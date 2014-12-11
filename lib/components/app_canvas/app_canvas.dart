library liquid_material.app_canvas;

import 'dart:html' as html;
import 'package:liquid/liquid.dart';
import 'package:liquid/vdom.dart' as v;

final appCanvas = v.componentFactory(AppCanvas);
class AppCanvas extends Component<html.DivElement> {
  void create() {
    element = new html.DivElement();

    element.classes
      ..add('mui-app-canvas')
      ..add('mui-predefined-layout-1');
  }
}

class AppContentCanvas extends Component<html.DivElement> {
  void create() {
    super.create();
    element.classes.add('mui-app-content-canvas');
  }
}
