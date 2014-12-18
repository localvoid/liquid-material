library liquid_material.paper;

import 'dart:html' as html;
import 'package:liquid/liquid.dart';
import 'package:liquid/vdom.dart' as v;

abstract class Paper extends Component<html.DivElement> {
  html.DivElement inner;

  @property() int zDepth;

  html.DivElement get container => inner;

  Paper({this.zDepth: 0});

  void create() {
    element = new html.DivElement();
    inner = new html.DivElement()
      ..classes.add('mui-paper-container');

    element
      ..classes.add('mui-paper')
      ..append(inner);
  }

  v.VRootDecorator<html.DivElement> build() =>
      v.rootDecorator(
          innerContainer: inner,
          classes: ['mui-z-$zDepth']);
}

abstract class CirclePaper extends Paper {
  void create() {
    super.create();
    element.classes.add('mui-circle');
  }
}

abstract class RoundedPaper extends Paper {
  void create() {
    super.create();
    element.classes.add('mui-rounded');
  }
}
