library liquid_material.ripple;

import 'dart:html' as html;
import 'package:vdom/vdom.dart' as vdom;

class Ripple extends vdom.ElementBase {
  bool _active = false;

  Ripple(Object key, {
    Map<String, String> attributes: null,
    List<String> classes: null,
    Map<String, String> styles: null})
    : super(key, attributes, classes, styles);

  void create(vdom.Context context) {
    ref = new html.DivElement();
  }

  void render(vdom.Context context) {
    (ref as html.DivElement).classes.add('mui-ripple');
  }

  void update(Ripple other, vdom.Context context) {
    other._active = _active;
    super.update(other, context);
  }

  void animate(num x, num y) {
    if (!_active) {
      final html.DivElement e = ref;
      e.style
        ..top = '${y*100}%'
        ..left = '${x*100}%';

      e.classes.add('mui-show');
      _active = true;
      e.on['animationend'].listen(_handleAnimationEnd);
    }
  }

  void _handleAnimationEnd(html.Event e) {
    if (_active) {
      final html.DivElement e = ref;
      e.classes.remove('mui-show');
      _active = false;
    }
  }
}
