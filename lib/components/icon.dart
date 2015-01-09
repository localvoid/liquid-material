library liquid_material.icon;

import 'dart:svg' as svg;
import 'package:vdom/vdom.dart' as v;
import 'package:vcss/vcss.dart' as v;
import '../colors.dart';

class IconStyleSheet extends v.StyleSheet {
  const IconStyleSheet();

  static const size = const v.Size.px(24);
  static const bigSize = const v.Size.px(32);

  static num calcOpacity(int backgroundType, {bool active: true}) {
    if (backgroundType == Color.light) {
      return active ? 0.54 : 0.26;
    }
    return active ? 1 : 0.3;
  }

  build(_) =>
      v.rule('.Icon', [
        v.display('inline-block'),
        v.height(size),
        v.width(size),
        v.verticalAlign('middle'),
        v.backgroundRepeat('no-repeat'),
        v.fill('currentcolor'),

        v.rule('&.big', [
          v.height(bigSize),
          v.width(bigSize)
        ])
      ]);
}

Icon icon(v.SvgIcon icon,
          {Object key,
           String alt,
           String id,
           String type,
           Map<String, String> attributes,
           List<String> classes,
           Map<String, String> styles}) {
  return new Icon(
      icon,
      key: key,
      id: id,
      type: type,
      attributes: attributes,
      classes: classes,
      styles: styles);
}

class Icon extends v.VElement<svg.SvgSvgElement> {
  static const css = const IconStyleSheet();

  final v.SvgIcon icon;
  final String alt;
  svg.UseElement _shapeRef;

  Icon(this.icon,
      {Object key,
       String id,
       String type,
       this.alt,
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

  void create(v.Context context) {
    ref = new svg.SvgSvgElement();
  }

  void render(v.Context context) {
    super.render(context);
    ref
      ..classes.add('Icon')
      ..setAttribute('role', 'img')
      ..setAttribute('viewBox', icon.viewBox)
      ..setAttribute('preserveAspectRatio', 'xMidYMid meet');

    if (alt != null) {
      ref.setAttribute('alt', alt);
    }

    _shapeRef = new svg.UseElement()
      ..setAttributeNS('http://www.w3.org/1999/xlink', 'href', '#${icon.id}');

    ref.append(_shapeRef);
  }

  void update(Icon other, v.Context context) {
    super.update(other, context);
    other._shapeRef = _shapeRef;

    if (alt != other.alt) {
      ref.setAttribute('alt', other.alt);
    }

    if (icon.id != other.icon.id) {
      _shapeRef.setAttributeNS('http://www.w3.org/1999/xlink', 'href', '#${other.icon.id}');
    }
  }
}
