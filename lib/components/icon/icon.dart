library liquid_material.icon;

import 'dart:html' as html;
import 'package:vdom/vdom.dart' as vdom;

class VIcon extends vdom.ElementBase {
  String name;

  VIcon(Object key,
      this.name,
      {Map<String, String> attributes: null,
       List<String> classes: null,
       Map<String, String> styles: null})
       : super(key, attributes, classes, styles);

  void create(vdom.Context context) {
    ref = new html.DivElement();
  }

  void render(vdom.Context context) {
    (ref as html.DivElement)
      ..classes.add('mui-icon')
      ..classes.add(name);
  }

  void update(VIcon other, vdom.Context context) {
    super.update(other, context);
    final e = ref;
    if (name != other.name) {
      e.classes.remove(name);
      e.classes.add(other.name);
    }
  }
}
