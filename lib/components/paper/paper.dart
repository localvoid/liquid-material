library liquid_material.paper;

import 'dart:html' as html;
import 'package:liquid/liquid.dart';

abstract class Paper extends Component<html.DivElement> {
  html.DivElement inner;

  int _oldZDepth;
  int _zDepth;

  int get zDepth => _zDepth;

  html.DivElement get container => inner;

  void set zDepth(int newZDepth) {
    if (_zDepth != newZDepth) {
      _zDepth = newZDepth;
      invalidate();
    }
  }

  html.DivElement get root => inner;

  Paper(Context context, int zDepth)
      : _zDepth = zDepth,
      super(new html.DivElement(), context) {
    inner = new html.DivElement()
      ..classes.add('mui-paper-container');

    element
      ..classes.add('mui-paper')
      ..append(inner);
  }

  void updateZDepth(int newZDepth) {
    if (_oldZDepth != newZDepth) {
      element.classes
        ..remove('mui-z-$_oldZDepth')
        ..add('mui-z-$_zDepth');
      _oldZDepth = newZDepth;
      _zDepth = newZDepth;
    }
  }

  void update() {
    super.update();
    updateZDepth(_zDepth);
  }
}

abstract class CirclePaper extends Paper {
  CirclePaper(Context context, int zDepth)
      : super(context, zDepth) {
    element.classes.add('mui-circle');
  }
}

abstract class RoundedPaper extends Paper {
  RoundedPaper(Context context, int zDepth)
      : super(context, zDepth) {
    element.classes.add('mui-rounded');
  }
}
