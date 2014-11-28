library liquid_material.ripple;

import 'dart:html' as html;
import 'package:liquid/liquid.dart';

class Ripple extends Component<html.DivElement> {
  bool _active = false;

  Ripple(Context context) : super(new html.DivElement(), context) {
    element.classes.add('mui-ripple');
  }

  void animate(num x, num y) {
    if (!_active) {
      element.style
        ..top = '${y*100}%'
        ..left = '${x*100}%';

      element.classes.add('mui-show');
      _active = true;
      var sub;
      sub = element.onTransitionEnd.listen((e) {
        if (_active) {
          element.classes.remove('mui-show');
          _active = false;
        }
        e.stopPropagation();
        sub.cancel();
      });
    }
  }
}
