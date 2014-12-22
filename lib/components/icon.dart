library liquid_material.icon;

import 'dart:svg' as svg;
import 'package:vdom/vdom.dart' as vdom;
import 'package:vdom/src/utils/style.dart';
import 'package:vcss/vcss.dart' as css;

VIcon icon(css.SvgIcon icon,
           {Object key,
            Map<String, String> shapeStyles,
            String id,
            String type,
            Map<String, String> attributes,
            List<String> classes,
            Map<String, String> styles}) {
  return new VIcon(
      icon,
      key: key,
      shapeStyles: shapeStyles,
      id: id,
      type: type,
      attributes: attributes,
      classes: classes,
      styles: styles);
}

class VIcon extends vdom.VElement<svg.SvgSvgElement> {
  final css.SvgIcon icon;
  final Map<String, String> shapeStyles;
  svg.UseElement shapeRef;

  VIcon(this.icon,
      {Object key,
       this.shapeStyles,
       String id,
       String type,
       Map<String, String> attributes,
       List<String> classes,
       Map<String, String> styles})
       : super(
           key: key,
           children: null,
           id: id,
           type: type,
           attributes: attributes,
           classes: classes,
           styles: styles);

  void create(vdom.Context context) {
    ref = new svg.SvgSvgElement();
  }

  void render(vdom.Context context) {
    super.render(context);
    ref
      ..classes.add('mui_icon');

    shapeRef = new svg.UseElement()
      ..setAttributeNS('http://www.w3.org/1999/xlink', 'href', '#${icon.id}');

    if (shapeStyles != null) {
      shapeStyles.forEach((k, v) {
        shapeRef.style.setProperty(k, v);
      });
    }

    ref.append(shapeRef);
  }

  void update(VIcon other, vdom.Context context) {
    super.update(other, context);
    other.shapeRef = shapeRef;

    if (icon.id != other.icon.id) {
      shapeRef.setAttributeNS('http://www.w3.org/1999/xlink', 'href', '#${other.icon.id}');
    }

    if (shapeStyles != null || other.shapeStyles != null) {
      updateStyle(shapeStyles, other.shapeStyles, shapeRef.style);
    }
  }
}
