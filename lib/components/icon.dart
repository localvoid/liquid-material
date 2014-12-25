library liquid_material.icon;

import 'dart:svg' as svg;
import 'package:vdom/vdom.dart' as vdom;
import 'package:vcss/vcss.dart' as css;
import '../colors.dart';

class IconStyleSheet extends css.StyleSheet {
  static const size = const css.Size.px(24);
  static const bigSize = const css.Size.px(32);

  static num calcOpacity(int backgroundType, {bool active: true}) {
    if (backgroundType == Color.light) {
      return active ? 0.54 : 0.26;
    }
    return active ? 1 : 0.3;
  }

  build() =>
      css.rule('.Icon', [
        css.display('inline-block'),
        css.height(size),
        css.width(size),
        css.verticalAlign('middle'),
        css.backgroundRepeat('no-repeat'),
        css.fill('currentcolor'),

        css.rule('&.big', [
          css.height(bigSize),
          css.width(bigSize)
        ])
      ]);
}

Icon icon(css.SvgIcon icon,
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

class Icon extends vdom.VElement<svg.SvgSvgElement> {
  static final css = new IconStyleSheet();

  final css.SvgIcon icon;
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

  void create(vdom.Context context) {
    ref = new svg.SvgSvgElement();
  }

  void render(vdom.Context context) {
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

  void update(Icon other, vdom.Context context) {
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
