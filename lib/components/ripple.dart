library liquid_material.ripple;

import 'dart:html' as html;
import 'package:liquid/liquid.dart';
import 'package:vcss/vcss.dart' as css;

class RippleStyleSheet extends css.StyleSheet {
  build() => [
      css.rule('.mui-ripple', [
        css.position('absolute'),
        css.opacity(1),
        css.width(0),
        css.height(0),
        css.transform('translate(-50%, -50%)'),
        css.borderRadius('50%')
      ]),

      css.rule('.mui-ripple', [
        css.rule('&.mui-show', [
          css.opacity(0),
          css.width('150px'),
          css.height('150px'),
          css.transition('all 325ms linear'),
          css.transitionProperty('height, width, opacity')
        ])
      ])
    ];
}

class Ripple extends Component<html.DivElement> {
  static final css = new RippleStyleSheet();

  bool _active = false;

  void create() {
    element = new html.DivElement()
      ..classes.add('mui-ripple');
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
