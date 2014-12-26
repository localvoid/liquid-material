library liquid_material.paper;

import 'dart:html' as html;
import 'package:liquid/liquid.dart';
import 'package:liquid/vdom.dart' as v;
import 'package:vcss/vcss.dart' as css;
import '../style.dart';

class PaperStyleSheet extends css.StyleSheet {
  build() => [
      css.rule('.Paper_shadow', [
        css.position('absolute'),
        css.top(0),
        css.left(0),
        css.right(0),
        css.bottom(0),
        css.borderRadius('inherit'),
        css.transition('box-shadow 0.5s $swiftEaseInOut'),
      ]),

      css.rule('.Paper', [
        css.rule('&.round', [
          css.borderRadius('3px')
        ]),
        css.rule('&.circle', [
          css.borderRadius('50%')
        ]),

        css.rule('&.z1 > .Paper_shadow', [
          paperShadow(1)
        ]),

        css.rule('&.z2 > .Paper_shadow', [
          paperShadow(2)
        ]),

        css.rule('&.z3 > .Paper_shadow', [
          paperShadow(3)
        ]),

        css.rule('&.z4 > .Paper_shadow', [
          paperShadow(4)
        ]),

        css.rule('&.z5 > .Paper_shadow', [
          paperShadow(5)
        ])
      ])
    ];
}

abstract class Paper extends Component<html.DivElement> {
  static final css = new PaperStyleSheet();

  @property() int zDepth;

  final html.DivElement shadowElement = new html.DivElement();

  Paper({this.zDepth: 0});

  void create() {
    element = new html.DivElement()
      ..classes.add('Paper');

    shadowElement.classes.add('Paper_shadow');
    element.append(shadowElement);
  }

  v.VRootDecorator<html.DivElement> build() =>
      v.rootDecorator(classes: ['z$zDepth']);
}

abstract class CirclePaper extends Paper {
  void create() {
    super.create();
    element.classes.add('circle');
  }
}

abstract class RoundPaper extends Paper {
  void create() {
    super.create();
    element.classes.add('round');
  }
}
