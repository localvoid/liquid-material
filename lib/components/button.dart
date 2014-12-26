library liquid_material.button;

import 'dart:async';
import 'dart:html' as html;
import 'package:liquid/vdom.dart' as v;
import 'package:liquid/liquid.dart';
import 'package:vcss/vcss.dart' as css;

import 'paper.dart';
import 'ripple.dart';
import 'icon.dart' as mui;
import '../layout.dart';
import '../typography.dart';
import '../colors.dart';
import '../vars.dart' as vars;

class ButtonStyleSheet extends css.StyleSheet {
  static const height = const css.Size.px(36);
  static const minWidth = const css.Size.px(64);
  static const fabSize = const css.Size.px(56);
  static const fabMiniSize = const css.Size.px(40);

  final require = [Paper.css, Ripple.css];

  build() => [
      css.rule('.Button', [
        css.position('relative'),
        css.display('inline-block'),
        css.cursor('pointer'),
        css.touchAction('none'),
        css.userSelect('none'),
        css.background(vars.buttonColor),
        css.color(vars.buttonTextColor),
        Typography.button(),

        css.rule('&.disabled', [
          css.cursor('default')
        ]),

        css.rule(['&.flat', '&.raised'], [
          css.height(height),
          css.minWidth(minWidth),
          css.padding('0 ${Layout.gridSize}')
        ]),

        css.rule('&.fab', [
          css.height(fabSize),
          css.width(fabSize),
          css.background(vars.colorAccent.colors[Palette.P500]),
          css.color(white),
          css.padding(Layout.gridSize * 2)
        ]),

        css.rule('&.icon', [
          css.padding(Layout.gridSize),
        ])
      ]),

      css.rule('.Button_content', [
        css.position('relative'),
        css.height('100%'),
        css.display('flex'),
        css.alignItems('center'),
        css.justifyContent('center')
      ]),


    ];
}

abstract class ButtonBase extends Paper {
  static final css = new ButtonStyleSheet();

  @property()
  bool disabled;

  html.DivElement content;

  html.DivElement get container => content;

  ButtonBase({this.disabled: false, int zDepth: 0})
      : super(zDepth: zDepth) {
    assert(disabled != null);
    assert(zDepth != null);
  }

  void create() {
    super.create();
    element.classes.add('Button');

    content = new html.DivElement()
      ..classes.add('Button_content');

    element.append(content);
  }

  v.VRootDecorator<html.DivElement> build() =>
      super.build().decorate(
          v.rootDecorator(classes: disabled == true ? const ['disabled'] : null)
      );
}

abstract class Button extends ButtonBase {
  static final css = ButtonBase.css;

  bool _down = false;
  List<StreamSubscription> _downSubs;

  Button({bool disabled: false, int zDepth: 0})
      : super(disabled: disabled, zDepth: zDepth);

  void init() {
    element
      ..onTouchStart.listen(_handleDown)
      ..onMouseDown.listen(_handleDown);
  }

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
}

abstract class InkButton extends Button {
  static final css = Button.css;

  Ripple _ripple;

  InkButton({bool disabled: false, int zDepth: 0})
      : super(disabled: disabled, zDepth: zDepth);

  void handleDown(html.Event e) {
    super.handleDown(e);

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

  void handleUp(html.Event e) {
    super.handleUp(e);

    if (_ripple != null) {
      _ripple.cancel();
    }
  }

  void _insertRipple(_) {
    element.insertBefore(_ripple.element, content);
  }
}

final flatButton = v.componentFactory(FlatButton);
class FlatButton extends ButtonBase {
  FlatButton({bool disabled: false, int zDepth: 0})
      : super(disabled: disabled, zDepth: zDepth);

  void create() {
    super.create();
    element.classes
      ..add('flat')
      ..add('round');
  }
}

final flatInkButton = v.componentFactory(FlatInkButton);
class FlatInkButton extends InkButton {
  FlatInkButton({bool disabled: false, int zDepth: 0})
      : super(disabled: disabled, zDepth: zDepth);

  void create() {
    super.create();
    element.classes
      ..add('flat')
      ..add('round');
  }
}

final raisedButton = v.componentFactory(RaisedButton);
class RaisedButton extends Button {
  RaisedButton({bool disabled: false, int zDepth: 1})
      : super(disabled: disabled, zDepth: zDepth);

  void create() {
    super.create();
    element.classes
      ..add('raised')
      ..add('round');
  }

  void handleDown(html.Event e) {
    super.handleDown(e);
    zDepth += 1;
    invalidate();
  }

  void handleUp(html.Event e) {
    super.handleUp(e);
    zDepth -= 1;
    invalidate();
  }
}

final raisedInkButton = v.componentFactory(RaisedInkButton);
class RaisedInkButton extends InkButton {
  RaisedInkButton({bool disabled: false, int zDepth: 1})
      : super(disabled: disabled, zDepth: zDepth);

  void create() {
    super.create();
    element.classes
      ..add('raised')
      ..add('round');
  }

  void handleDown(html.MouseEvent e) {
    super.handleDown(e);
    zDepth += 1;
    invalidate();
  }

  void handleUp(html.MouseEvent e) {
    super.handleUp(e);
    zDepth -= 1;
    invalidate();
  }
}

final fabInk = v.componentFactory(FabInk);
class FabInk extends InkButton {
  @property(required: true)
  css.SvgIcon icon;

  FabInk({this.icon, bool disabled: false, int zDepth: 1})
      : super(disabled: disabled, zDepth: zDepth);

  void create() {
    super.create();
    element.classes
      ..add('fab')
      ..add('circle');
  }

  build() => super.build().decorate(
      v.root()(
        mui.icon(icon)
      )
    );

  void handleDown(html.Event e) {
    super.handleDown(e);
    zDepth += 1;
    invalidate();
  }

  void handleUp(html.Event e) {
    super.handleUp(e);
    zDepth -= 1;
    invalidate();
  }
}

final iconButtonInk = v.componentFactory(IconButtonInk);
class IconButtonInk extends InkButton {
  @property(required: true)
  css.SvgIcon icon;

  IconButtonInk({this.icon, bool disabled: false, int zDepth: 0})
      : super(disabled: disabled, zDepth: zDepth);

  void create() {
    super.create();
    element.classes
      ..add('icon')
      ..add('circle');
  }

  build() => super.build().decorate(
      v.root()(
        mui.icon(icon)
      )
    );
}
