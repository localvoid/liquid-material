library liquid_material.paper;

import 'dart:html' as html;
import 'package:liquid/liquid.dart';
import 'package:liquid/vdom.dart' as v;
import 'package:vcss/vcss.dart' as css;
import '../style.dart';

class PaperStyleSheet extends css.StyleSheet {
  build() => [
      css.rule('.Paper', [
        css.transition('box-shadow 0.5s $swiftEaseInOut')
      ]),

      css.rule('.z1', [
        paperShadow(1)
      ]),

      css.rule('.z2', [
        paperShadow(2)
      ]),

      css.rule('.z3', [
        paperShadow(3)
      ]),

      css.rule('.z4', [
        paperShadow(4)
      ]),

      css.rule('.z5', [
        paperShadow(5)
      ]),

      css.rule('&.round', [
        css.borderRadius('2px')
      ]),

      css.rule('&.circle', [
        css.borderRadius('50%')
      ])
    ];
}

abstract class Paper extends Component<html.DivElement> {
  static final css = new PaperStyleSheet();

  @property() int zDepth;

  Paper({this.zDepth: 0});

  void create() {
    element = new html.DivElement()
      ..classes.add('Paper');
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
