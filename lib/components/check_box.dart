library liquid_material.check_box;

import 'dart:html' as html;
import 'package:liquid/liquid.dart';
import 'package:liquid/vdom.dart' as v;
import 'package:vcss/vcss.dart' as css;
import 'button.dart';
import '../layout.dart';
import '../style.dart';
import '../colors.dart';

class CheckBoxStyleSheet extends css.StyleSheet {
  static const size = const css.Size.px(48);
  static const markSize = const css.Size.px(16);
  static final color = paletteGreen.colors[Palette.P700];

  build() => [
      css.rule('.CheckBox', [
        css.width(size),
        css.height(size),
        css.padding(Layout.gridSize * 2),
        css.color(color),

        css.rule('&.checked', [
          css.color(black)
        ])
      ]),

      css.rule('.CheckBox_i1', [
        css.position('absolute'),
        css.top(0),
        css.left(0),
        css.width('16px'),
        css.height('16px'),
        css.border('2px solid #777'),
        css.borderRadius('2px'),
        css.background('#777'),
        css.transition('border-color 0.28s $swiftEaseIn 0.28s, background 0.28s $swiftEaseIn 0.28s'),
        css.rule('.CheckBox.checked &', [
          css.background(color),
          css.borderColor(color)
        ])
      ]),

      css.rule('.CheckBox_i2', [
        css.position('absolute'),
        css.transform('scale(1)'),
        css.top('2px'),
        css.left('2px'),
        css.width('12px'),
        css.height('12px'),
        css.borderRadius(0),
        css.background('#fff'),
        css.transition('border-radius 0.28s $swiftEaseIn 0.28s, transform 0.28s $swiftEaseOut 0.28s'),

        css.rule('.CheckBox.checked &', [
          css.transition('border-radius 0.28s $swiftEaseIn, transform 0.28s $swiftEaseIn'),
          css.transform('scale(0)'),
          css.borderRadius('50%'),
        ])
      ]),

      // icon
      css.rule('.CheckBox_i3', [
        css.position('absolute'),
        css.transform('translate(-2px, 5px) rotate(45deg) scale(0)'),
        css.top('1px'),
        css.left('5px'),
        css.width('6px'),
        css.height('11px'),
        css.border('2px solid #eee'),
        css.borderTopWidth(0),
        css.borderLeftWidth(0),
        css.transition('transform 0.28s $swiftEaseIn'),

        css.rule('.CheckBox.checked &', [
          css.transition('transform 0.28s $swiftEaseOut 0.28s'),
          css.transform('translate(0, 0) rotate(45deg) scale(1)'),
        ])
      ]),
    ];
}

final checkBox = v.componentFactory(CheckBox);
class CheckBox extends InkButton {
  static final css = new CheckBoxStyleSheet();

  @property()
  bool checked;

  CheckBox({this.checked: false, bool disabled: false})
    : super(disabled: disabled);

  void create() {
    super.create();
    element.classes
      ..add('CheckBox')
      ..add('circle');

    final i1Element = new html.DivElement()
      ..classes.add('CheckBox_i1');

    final i2Element = new html.DivElement()
      ..classes.add('CheckBox_i2');

    final i3Element = new html.DivElement()
      ..classes.add('CheckBox_i3');

    content
      ..append(i1Element)
      ..append(i2Element)
      ..append(i3Element);
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
