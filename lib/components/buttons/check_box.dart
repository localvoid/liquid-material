library liquid_material.src.components.buttons.check_box;

import 'dart:html' as html;
import 'package:liquid/liquid.dart';
import 'package:liquid/vdom.dart' as v;
import 'package:vcss/vcss.dart' as v;
import 'button_base.dart';
import '../../elements/paper.dart';
import '../../layout.dart';
import '../../style.dart';
import '../../colors.dart';

class CheckBoxStyleSheet extends v.StyleSheet {
  static const size = const v.Size.px(48);
  static const markSize = const v.Size.px(16);
  static final color = paletteGreen.colors[Palette.P700];

  final require = const [ButtonBase.css];

  const CheckBoxStyleSheet();

  build(_) => [
      v.rule('.CheckBox', [
        ButtonBase.style,
        Paper.circleStyle,
        v.width(size),
        v.height(size),
        v.padding(Layout.gridSize * 2),
        v.color(black),

        v.rule('&.checked', [
          v.color(color),
        ])
      ]),

      v.rule('.CheckBox_l1', [
        v.position('absolute'),
        v.top(0),
        v.left(0),
        v.width('16px'),
        v.height('16px'),
        v.border('2px solid #777'),
        v.borderRadius('2px'),
        v.background('#777'),
        v.transition('border-color 0.28s $swiftEaseIn 0.28s, background 0.28s $swiftEaseIn 0.28s'),
        v.rule('.CheckBox.checked &', [
          v.background(color),
          v.borderColor(color)
        ])
      ]),

      v.rule('.CheckBox_l2', [
        v.position('absolute'),
        v.transform('scale(1)'),
        v.top('2px'),
        v.left('2px'),
        v.width('12px'),
        v.height('12px'),
        v.borderRadius(0),
        v.background('#fff'),
        v.transition('border-radius 0.28s $swiftEaseIn 0.28s, transform 0.28s $swiftEaseOut 0.28s'),

        v.rule('.CheckBox.checked &', [
          v.transition('border-radius 0.28s $swiftEaseIn, transform 0.28s $swiftEaseIn'),
          v.transform('scale(0)'),
          v.borderRadius('50%'),
        ])
      ]),

      // icon
      v.rule('.CheckBox_l3', [
        v.position('absolute'),
        v.transform('translate(-2px, 5px) rotate(45deg) scale(0)'),
        v.top('1px'),
        v.left('5px'),
        v.width('6px'),
        v.height('11px'),
        v.border('2px solid #eee'),
        v.borderTopWidth(0),
        v.borderLeftWidth(0),
        v.transition('transform 0.28s $swiftEaseIn'),

        v.rule('.CheckBox.checked &', [
          v.transition('transform 0.28s $swiftEaseOut 0.28s'),
          v.transform('translate(0, 0) rotate(45deg) scale(1)'),
        ])
      ]),
    ];
}

final checkBox = v.componentFactory(CheckBox);
class CheckBox extends ButtonBase {
  static const css = const CheckBoxStyleSheet();

  @property()
  bool checked;

  CheckBox({this.checked: false, bool disabled: false, bool noink: false})
    : super(disabled: disabled, noink: noink);

  void create() {
    super.create();
    element.classes.add('CheckBox');

    content
      ..append(new html.DivElement()..classes.add('CheckBox_l1'))
      ..append(new html.DivElement()..classes.add('CheckBox_l2'))
      ..append(new html.DivElement()..classes.add('CheckBox_l3'));
  }

  void init() {
    super.init();
    element.onClick.listen(_handleClick);
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
    checked = !checked;
    invalidate();
  }

  v.VRootDecorator<html.DivElement> build() =>
      super.build().decorate(
        v.root(classes: checked ? const ['checked'] : null)
      );
}
