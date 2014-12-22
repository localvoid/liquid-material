library liquid_material.paper;

import 'dart:html' as html;
import 'package:liquid/liquid.dart';
import 'package:liquid/vdom.dart' as v;
import 'package:vcss/vcss.dart' as css;

class PaperStyleSheet extends css.StyleSheet {
  build() => [
      css.rule('.mui_paper', [
        css.transition('box-shadow .28s cubic-bezier(0.4, 0, .2, 1)')
      ]),

      css.rule('.mui_paper_container', [
        css.height('100%'),
        css.width('100%')
      ]),

      css.rule('.mui_z1', [
        css.boxShadow('0 1px 4px rgba(0, 0, 0, 0.24), '
                      '0 1px 6px rgba(0, 0, 0, 0.12)')
      ]),

      css.rule('.mui_z2', [
        css.boxShadow('0 3px 10px rgba(0, 0, 0, 0.23), '
                      '0 3px 10px rgba(0, 0, 0, 0.16)')
      ]),

      css.rule('.mui_z3', [
        css.boxShadow('0 6px 10px rgba(0, 0, 0, 0.23), '
                      '0 10px 30px rgba(0, 0, 0, 0.19)')
      ]),

      css.rule('.mui_z4', [
        css.boxShadow('0 10px 18px rgba(0, 0, 0, 0.22), '
                      '0 14px 45px rgba(0, 0, 0, 0.25)')
      ]),

      css.rule('.mui_z5', [
        css.boxShadow('0 15px 20px rgba(0, 0, 0, 0.22), '
                      '0 19px 60px rgba(0, 0, 0, 0.30)')
      ]),

      css.rule('.mui_rounded', [
        css.borderRadius('2px'),

        css.rule('& > .mui_paper_container', [
          css.borderRadius('2px')
        ])
      ]),

      css.rule('.mui_circle', [
        css.borderRadius('50%'),

        css.rule('& > .mui_paper_container', [
          css.borderRadius('50%')
        ])
      ])
    ];
}

abstract class Paper extends Component<html.DivElement> {
  static final css = new PaperStyleSheet();

  html.DivElement inner;

  @property() int zDepth;

  html.DivElement get container => inner;

  Paper({this.zDepth: 0});

  void create() {
    element = new html.DivElement();
    inner = new html.DivElement()
      ..classes.add('mui_paper_container');

    element
      ..classes.add('mui_paper')
      ..append(inner);
  }

  v.VRootDecorator<html.DivElement> build() =>
      v.rootDecorator(
          innerContainer: inner,
          classes: ['mui_z$zDepth']);
}

abstract class CirclePaper extends Paper {
  void create() {
    super.create();
    element.classes.add('mui_circle');
  }
}

abstract class RoundedPaper extends Paper {
  void create() {
    super.create();
    element.classes.add('mui_rounded');
  }
}
