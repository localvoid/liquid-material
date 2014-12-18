library liquid_material.button;

import 'dart:html' as html;
import 'package:liquid/vdom.dart' as v;
import 'package:liquid/liquid.dart';
import 'package:liquid_material/components/paper/paper.dart';
import 'package:liquid_material/components/ripple/ripple.dart';

class Button extends Paper {
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
