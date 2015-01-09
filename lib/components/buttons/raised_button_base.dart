library liquid_material.src.components.buttons.raised_button_base;

import 'dart:html' as html;
import 'package:liquid/liquid.dart';
import 'package:liquid/vdom.dart' as v;
import 'button_base.dart';
import '../../elements/paper.dart';

class RaisedButtonBase extends ButtonBase {
  static const css = ButtonBase.css;

  @property()
  int zDepth;

  RaisedButtonBase({this.zDepth: 1, bool disabled: false, bool noink: false})
      : super(disabled: disabled, noink: noink);

  void create() {
    super.create();

    element.append(Paper.createShadowElement());
  }

  v.VRootDecorator<html.DivElement> build() => super.build().decorate(
      v.rootDecorator(classes: ['z$zDepth'])
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
