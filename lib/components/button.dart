library liquid_material.button;

import 'dart:html' as html;
import 'package:liquid/vdom.dart' as v;
import 'package:liquid/liquid.dart';
import 'package:vcss/vcss.dart' as css;
import '../layout.dart';
import '../typography.dart';
import '../vars.dart' as vars;
import 'paper.dart';
import 'ripple.dart';

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
        css.height(height),
        css.minWidth(minWidth),
        css.background(vars.buttonColor),
        css.overflow('hidden'),

        css.rule('&.disabled', [
          css.cursor('default')
        ])
      ]),

      css.rule('.Button_content', [
        css.height('100%'),
        css.userSelect('none'),
        css.position('relative'),
        css.display('flex'),
        css.alignItems('center'),
        css.padding('0 ${Layout.gridSize}'),
        css.textAlign('center'),
        css.color(vars.buttonTextColor),
        Typography.button()
      ])
    ];
}

abstract class Button extends Paper {
  static final css = new ButtonStyleSheet();

  @property()
  bool disabled;

  html.DivElement content;

  html.DivElement get container => content;

  Button({this.disabled: false, int zDepth: 0})
      : super(zDepth: zDepth);

  void create() {
    super.create();
    element.classes.add('Button');

    content = new html.DivElement()
      ..classes.add('Button_content');

    element.append(content);
  }

  v.VRootDecorator<html.DivElement> build() =>
      super.build().decorate(
          v.rootDecorator(classes: disabled == true ? ['mui-disabled'] : null)
      );
}

abstract class InkButton extends Button {
  Ripple _ripple;

  InkButton({bool disabled: false, int zDepth: 0})
      : super(disabled: disabled, zDepth: zDepth);

  void create() {
    super.create();
  }

  void init() {
    element.onMouseDown.listen(handleMouseDown);
    element.onMouseUp.listen(handleMouseUp);
  }

  void handleMouseDown(html.MouseEvent e) {
    // lazy ripple render to improve initial render performance
    if (_ripple == null) {
      _ripple = new Ripple(element);
      domScheduler.nextFrame.write(depth).then(_insertRipple);
    }

    _ripple.touchDown(e);
  }

  void handleMouseUp(html.MouseEvent ev) {
    if (_ripple != null) {
      _ripple.touchUp();
    }
  }

  void _insertRipple(_) {
    element.insertBefore(_ripple.element, content);
  }
}

final flatButton = v.componentFactory(FlatButton);
class FlatButton extends Button {
  FlatButton({bool disabled, int zDepth: 0})
      : super(disabled: disabled, zDepth: zDepth);

  void create() {
    super.create();
    element.classes.add('flat');
  }
}

final flatInkButton = v.componentFactory(FlatInkButton);
class FlatInkButton extends InkButton {
  FlatInkButton({bool disabled, int zDepth: 0})
      : super(disabled: disabled, zDepth: zDepth);

  void create() {
    super.create();
    element.classes.add('flat');
  }
}

final fabButton = v.componentFactory(FabButton);
class FabButton extends Button {
  FabButton({bool disabled, int zDepth: 1})
      : super(disabled: disabled, zDepth: zDepth);

  void create() {
    super.create();
    element.classes.add('fab');
  }
}


final raisedButton = v.componentFactory(RaisedButton);
class RaisedButton extends Button {
  RaisedButton({bool disabled, int zDepth: 1})
      : super(disabled: disabled, zDepth: zDepth);

  void create() {
    super.create();
    element.classes.add('raised');
  }

  void init() {
    super.init();
    element
      ..onMouseDown.listen(handleMouseDown)
      ..onMouseUp.listen(handleMouseUp);
  }

  void handleMouseDown(html.MouseEvent e) {
    zDepth += 1;
    invalidate();
  }

  void handleMouseUp(html.MouseEvent e) {
    zDepth -= 1;
    invalidate();
  }
}

final raisedInkButton = v.componentFactory(RaisedInkButton);
class RaisedInkButton extends InkButton {
  RaisedInkButton({bool disabled, int zDepth: 1})
      : super(disabled: disabled, zDepth: zDepth);

  void create() {
    super.create();
    element.classes.add('raised');
  }

  void handleMouseDown(html.MouseEvent e) {
    super.handleMouseDown(e);
    zDepth += 1;
    invalidate();
  }

  void handleMouseUp(html.MouseEvent e) {
    super.handleMouseUp(e);
    zDepth -= 1;
    invalidate();
  }
}
