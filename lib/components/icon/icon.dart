library liquid_material.icon;

import 'dart:html' as html;
import 'package:vdom/vdom.dart' as vdom;

class VIcon extends vdom.VElementBase<html.DivElement> {
  final String name;

  VIcon(
      {Object key,
       this.name: 'default',
       String id,
       String type,
       Map<String, String> attributes,
       List<String> classes,
       Map<String, String> styles})
       : super(key, null, id, type, attributes, classes, styles);

  void create(vdom.Context context) {
    ref = new html.DivElement();
  }

  void render(vdom.Context context) {
    super.render(context);
    ref
      ..classes.add('mui-icon')
      ..classes.add(name);
  }

  void update(VIcon other, vdom.Context context) {
    super.update(other, context);
    if (name != other.name) {
      ref.classes
        ..remove(name)
        ..add(other.name);
    }
  }
}
