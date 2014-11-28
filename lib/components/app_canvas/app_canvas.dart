library liquid_material.app_canvas;

import 'dart:html' as html;
import 'package:liquid/liquid.dart';
import 'package:vdom/vdom.dart' as vdom;

class AppCanvas extends Component<html.DivElement> {
  AppCanvas(Context context) : super(new html.DivElement(), context) {
    element.classes
      ..add('mui-app-canvas')
      ..add('mui-predefined-layout-1');
  }
}

class AppContentCanvas extends Component<html.DivElement> {
  AppContentCanvas(Context context) : super(new html.DivElement(), context) {
    element.classes.add('mui-app-content-canvas');
  }
}

class VAppCanvas extends VComponentContainer<AppCanvas, html.DivElement> {
  VAppCanvas(Context context,
      List<vdom.Node> children,
      {Map<String, String> attributes: null,
       List<String> classes: null,
       Map<String, String> styles: null}) :
      super(context, children, attributes, classes, styles);

  void create(vdom.Context context) {
    component = new AppCanvas(context);
    ref = component.element;
  }
}
