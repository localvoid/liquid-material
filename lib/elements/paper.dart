library liquid_material.src.elements.paper;

import 'dart:html' as html;
import 'package:vcss/vcss.dart' as v;
import '../style.dart';

class PaperStyleSheet extends v.StyleSheet {
  const PaperStyleSheet();

  build(_) => [
      v.rule('.Shadow', [
        v.position('absolute'),
        v.top(0),
        v.right(0),
        v.bottom(0),
        v.left(0),
        v.borderRadius('inherit'),
        v.transition('box-shadow 0.5s $swiftEaseInOut'),

        v.rule('.z1 > &', [
          paperShadow(1)
        ]),

        v.rule('.z2 > &', [
          paperShadow(2)
        ]),

        v.rule('.z3 > &', [
          paperShadow(3)
        ]),

        v.rule('.z4 > &', [
          paperShadow(4)
        ]),

        v.rule('.z5 > &', [
          paperShadow(5)
        ])
      ])
    ];
}

abstract class Paper {
  static const css = const PaperStyleSheet();

  static html.DivElement createShadowElement() =>
      new html.DivElement()..classes.add('Shadow');

  static List get style => [v.position('relative')];
  static List get roundStyle => [v.borderRadius('3px')];
  static List get circleStyle => [v.borderRadius('50%')];
}

