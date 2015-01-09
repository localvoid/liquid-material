library liquid_material.radio_button;

import 'dart:html' as html;
import 'package:liquid/liquid.dart';
import 'package:liquid/vdom.dart' as v;
import 'package:vcss/vcss.dart' as css;
import 'button_base.dart';
import '../../elements/paper.dart';
import '../../layout.dart';
import '../../style.dart';
import '../../colors.dart';

class RadioButtonStyleSheet extends css.StyleSheet {
  static const size = const css.Size.px(48);
  static const radioSize = const css.Size.px(16);
  static final color = paletteGreen.colors[Palette.P700];

  const RadioButtonStyleSheet();

  final require = const [ButtonBase.css];

  build(_) => [
      css.rule('.RadioButton', [
        ButtonBase.style,
        Paper.circleStyle,
        css.width(size),
        css.height(size),
        css.padding(Layout.gridSize * 2),
        css.color(black),

        css.rule('&.checked', [
          css.color(color),
        ]),
      ]),

      css.rule('.RadioButton_l1', [
        css.position('absolute'),
        css.top(0),
        css.left(0),
        css.width(radioSize),
        css.height(radioSize),
        css.border('2px solid #5a5a5a'),
        css.borderRadius('50%'),
        css.transition('border-color 0.14s $swiftEaseOut 0.14s'),

        css.rule('.RadioButton.checked &', [
          css.borderColor(color),
          css.transition('border-color 0.14s $swiftEaseIn 0.14s'),
        ])
      ]),

      css.rule('.RadioButton_l2', [
        css.position('absolute'),
        css.top(0),
        css.left(0),
        css.width(radioSize),
        css.height(radioSize),
        css.background('#5a5a5a'),
        css.borderRadius('50%'),
        css.transform('scale(1)'),
        css.transition('transform 0.28s $swiftEaseOut, background 0.14s $swiftEaseOut 0.14s'),

        css.rule('.RadioButton.checked &', [
          css.transition('transform 0.28s $swiftEaseIn, background 0.14s $swiftEaseIn 0.14s'),
          css.background(color),
          css.transform('scale(0.5)')
        ])
      ]),

      css.rule('.RadioButton_l3', [
        css.position('absolute'),
        css.top('2px'),
        css.left('2px'),
        css.width('12px'),
        css.height('12px'),
        css.background(white),
        css.borderRadius('50%'),
        css.transform('scale(1)'),
        css.transition('transform 0.28s $swiftEaseIn'),

        css.rule('.RadioButton.checked &', [
          css.transition('transform 0.28s $swiftEaseOut'),
          css.transform('scale(0)')
        ])
      ])
    ];
}

final radioButton = v.componentFactory(RadioButton);
class RadioButton extends ButtonBase {
  static const css = const RadioButtonStyleSheet();

  @property()
  bool checked;

  @property(immutable: true)
  bool toggles;

  RadioButton({this.checked: false, this.toggles: true, bool disabled: false, bool noink: false})
    : super(disabled: disabled, noink: noink);

  void create() {
    super.create();
    element.classes.add('RadioButton');

    content
      ..append(new html.DivElement()..classes.add('RadioButton_l1'))
      ..append(new html.DivElement()..classes.add('RadioButton_l2'))
      ..append(new html.DivElement()..classes.add('RadioButton_l3'));
  }

  void init() {
    super.init();
    element.onClick.listen(_handleClick);
  }

  void handleDown(html.Event e) {
    super.handleDown(e);
    element.classes.add('down');
  }

  void handleUp(html.Event e) {
    super.handleUp(e);
    element.classes.remove('down');
  }

  void _handleClick(html.MouseEvent e) {
    if (disabled) {
      return;
    }
    handleClick(e);
  }

  void handleClick(html.MouseEvent e) {
    toggle();
  }

  void toggle() {
    if (toggles || !checked) {
      checked = !checked;
      invalidate();
    }
  }

  v.VRootDecorator<html.DivElement> build() =>
      super.build().decorate(
        v.root(classes: checked ? const ['checked'] : null)
      );
}
