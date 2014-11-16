library liquid_material.app_canvas;

import 'dart:html' as html;
import 'package:vdom/vdom.dart' as vdom;

class AppCanvas extends vdom.Element {
  AppCanvas(Object key, List<vdom.Node> children,
      {Map<String, String> attributes: null,
       List<String> classes: null,
       Map<String, String> styles: null})
       : super(key, 'div', children,
           attributes: attributes,
           classes: classes,
           styles: styles);

  void render(vdom.Context context) {
    super.render(context);
    final html.DivElement e = ref;
    e.classes
      ..add('mui-app-canvas')
      ..add('mui-predefined-layout-1');
  }
}
