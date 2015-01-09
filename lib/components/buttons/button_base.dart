library liquid_material.src.components.buttons.button_base;

import 'dart:async';
import 'dart:html' as html;
import 'package:liquid/liquid.dart';
import 'package:liquid/vdom.dart' as v;
import 'package:vcss/vcss.dart' as v;

import '../../elements/paper.dart';
import '../../elements/ripple.dart';
import '../../vars.dart' as vars;

class ButtonBaseStyleSheet extends v.StyleSheet {
  final require = const [Paper.css, Ripple.css];

  const ButtonBaseStyleSheet();

  build(_) => [
      v.rule('.Button_content', [
        v.position('relative'),
        v.height('100%'),
        v.display('flex'),
        v.alignItems('center'),
        v.justifyContent('center')
      ]),
    ];
}

abstract class ButtonBase extends Component<html.DivElement> {
  static const css = const ButtonBaseStyleSheet();

  static List get style => [
      Paper.style,
      v.display('inline-block'),
      v.cursor('pointer'),
      v.touchAction('none'),
      v.userSelect('none'),
      v.background(vars.buttonColor),
      v.color(vars.buttonTextColor),

      v.rule('&.disabled', [
        v.cursor('default')
      ]),
    ];

  @property()
  bool disabled;

  @property()
  bool noink;

  html.DivElement content;

  bool _down = false;
  List<StreamSubscription> _downSubs;
  Ripple _ripple;

  html.DivElement get container => content;

  ButtonBase({this.disabled: false, this.noink: false}) {
    assert(disabled != null);
    assert(noink != null);
  }

  void create() {
    super.create();

    content = new html.DivElement()
      ..classes.add('Button_content');

    element.append(content);
  }

  void init() {
    element
      ..onTouchStart.listen(_handleDown)
      ..onMouseDown.listen(_handleDown);
  }

  v.VRootDecorator<html.DivElement> build() =>
      v.rootDecorator(classes: disabled == true ? const ['disabled'] : null);

  void detached() {
    if (_downSubs != null) {
      _cancelDownSubs();
    }
  }

  void _handleDown(html.Event e) {
    if (_down || disabled) {
      return;
    }
    handleDown(e);
  }

  void handleDown(html.Event e) {
    _down = true;

    if (e is html.TouchEvent) {
      _downSubs = [
        html.document.onTouchMove.listen(_handleMove),
        html.document.onTouchEnd.listen(_handleUp),
        html.document.onTouchCancel.listen(_handleCancel)
      ];

    } else if (e is html.MouseEvent) {
      _downSubs = [
        html.document.onMouseMove.listen(_handleMove),
        html.document.onMouseUp.listen(_handleUp)
      ];
    }

    if (!noink) {
      // lazy ripple render to improve initial render performance
      if (_ripple == null) {
        _ripple = new Ripple(element, backgroundFill: true, recentering: true);
        domScheduler.nextFrame.write(depth).then(_insertRipple);
      }

      num x = 0;
      num y = 0;
      if (e is html.TouchEvent) {
        x = e.targetTouches[0].client.x;
        y = e.targetTouches[0].client.y;
      } else if (e is html.MouseEvent) {
        x = e.client.x;
        y = e.client.y;
      }

      _ripple.touch(x, y);
    }
  }

  void _handleMove(html.Event e) {
    if (!_down) {
      return;
    }
    handleMove(e);
  }

  void handleMove(html.Event e) {
    if (e is html.TouchEvent) {
      if (!element.offset.containsPoint(e.targetTouches[0].client)) {
        handleUp(e);
      }
    } else if (e is html.MouseEvent) {
      if (!element.offset.containsPoint(e.client)) {
        handleUp(e);
      }
    }
  }

  void _handleUp(html.Event e) {
    if (!_down) {
      return;
    }
    handleUp(e);
  }

  void handleUp(html.Event e) {
    _down = false;
    _cancelDownSubs();
    if (_ripple != null) {
      _ripple.cancel();
    }
  }

  void _handleCancel(html.TouchEvent e) {
    if (!_down) {
      return;
    }
    handleUp(e);
  }

  void _cancelDownSubs() {
    for (final sub in _downSubs) {
      sub.cancel();
    }
    _downSubs = null;
  }

  void _insertRipple(_) {
    element.append(_ripple.element);
  }
}
