library liquid_material.button;

import 'dart:html' as html;
import 'package:liquid/vdom.dart' as v;
import 'package:liquid/liquid.dart';
import 'package:vcss/vcss.dart' as css;
import '../vars.dart' as vars;
import 'paper.dart';
import 'ripple.dart';

class ButtonBaseStyleSheet extends css.StyleSheet {
  final require = [Paper.css];

  build() => [
      css.rule('.mui_button', [
        css.display('inline-block'),
        css.cursor('pointer'),

        css.rule('> .mui_paper_container', [
          css.background(vars.buttonDefaultColor),
          css.position('relative'),
          css.overflow('hidden')
        ]),

        css.rule('&.mui_disabled', [
          css.cursor('default')
        ])
      ]),

      css.rule('.mui_button_content', [
        css.userSelect('none'),
        css.position('relative'),
        css.textAlign('center'),
        css.padding('0 0.5em'),
        css.lineHeight('1.5em'),

        css.rule('> a', [
          css.minWidth(vars.paperButtonMinWidth),
          css.padding('0 ${vars.desktopGutterLess}'),
          css.color(vars.buttonDefaultTextColor),
          css.textDecoration('none'),
          css.lineHeight(vars.paperButtonHeight),
          css.display('inline-block')
        ])
      ])
    ];
}

class CustomButtonStyleSheet extends css.StyleSheet {
  final String name;
  final css.Color color;
  final css.Color textColor;
  final css.Color hoverColor;

  final require = [Button.css];

  CustomButtonStyleSheet(this.name, css.Color color, this.textColor)
      : color = color, hoverColor = color;

  build() => [
      css.rule('.mui_button.$name', [
        css.backgroundColor(color),

        css.rule('> a', [
          css.color(textColor)
        ]),

        css.rule('&:hover', [
          css.backgroundColor(hoverColor)
        ])
      ])
    ];
}

class Button extends Paper {
  static final css = new ButtonBaseStyleSheet();

  @property() bool disabled;

  Ripple _ripple;
  html.DivElement content;

  html.DivElement get container => content;

  Button({this.disabled: false, int zDepth: 0})
      : super(zDepth: zDepth);

  void create() {
    super.create();
    _ripple = new Ripple();
    _ripple.context = this;
    _ripple.create();

    element.classes.add('mui-paper-button');

    content = new html.DivElement()
      ..classes.add('mui-paper-button-content');

    inner
      ..append(_ripple.element)
      ..append(content);
  }

  void init() {
    element.onMouseDown.listen(handleMouseDown);
  }

  v.VRootDecorator<html.DivElement> build() =>
      super.build().decorate(
          v.rootDecorator(classes: disabled == true ? ['mui-disabled'] : null)
      );

  void handleMouseDown(html.MouseEvent ev) {
    var x = ev.offset.x / element.clientWidth;
    var y = ev.offset.y / element.clientHeight;
    _ripple.animate(x, y);
  }
}

final flatButton = v.componentFactory(FlatButton);
class FlatButton extends Button {
  FlatButton({bool disabled, int zDepth: 1})
      : super(disabled: disabled, zDepth: zDepth);

  void create() {
    super.create();
    element.classes.add('mui-flat');
  }
}

final raisedButton = v.componentFactory(RaisedButton);
class RaisedButton extends Button {
  bool _mouseDown = false;
  bool _raising = false;

  RaisedButton({bool disabled, int zDepth: 1})
      : super(disabled: disabled, zDepth: zDepth);

  void create() {
    super.create();
    element.classes.add('mui-raised');
  }

  void init() {
    super.init();
    element.onTransitionEnd.listen(_handleTransitionEnd);
  }

  void handleMouseDown(html.MouseEvent e) {
    super.handleMouseDown(e);
    if (!_mouseDown) {
      zDepth += 1;
      _mouseDown = true;
      invalidate();
    }
  }

  void _handleTransitionEnd(html.TransitionEvent ev) {
    if (_mouseDown) {
      zDepth -= 1;
      _mouseDown = false;
      invalidate();
    }
  }
}
