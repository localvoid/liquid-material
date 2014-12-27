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
          css.color(black),
        ])
      ]),

      css.rule('.CheckBox_box', [
        css.position('absolute'),
        css.transform('scale(1)'),
        css.top(0),
        css.left(0),
        css.width('18px'),
        css.height('18px'),
        css.border('2px solid #777'),
        css.borderRadius('2px'),
        css.transition('transform 0.2s $swiftEaseInOut'),
        css.rule('.CheckBox.checked &', [
          css.transform('scale(0.8)'),
          css.background('#777')
        ])
      ]),

      css.rule('.CheckBox_mark', [
        css.position('absolute'),
        css.transform('scale(0.01)'),
        css.top(0),
        css.left(0),
        css.width('18px'),
        css.height('18px'),
        css.borderRadius('2px'),
        css.background(color),
        css.transition('transform 0.2s $swiftEaseInOut'),

        css.rule('.CheckBox.checked &', [
          css.transform('scale(1)')
        ])
      ]),

      css.rule('.CheckBox_mark_icon', [
        css.position('absolute'),
        css.transform('rotate(45deg)'),
        css.top('2px'),
        css.left('6px'),
        css.width('6px'),
        css.height('12px'),
        css.border('2px solid #eee'),
        css.borderTopWidth(0),
        css.borderLeftWidth(0),
      ])
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

    final boxElement = new html.DivElement()
      ..classes.add('CheckBox_box');

    final markElement = new html.DivElement()
      ..classes.add('CheckBox_mark');

    final markIcon = new html.DivElement()
      ..classes.add('CheckBox_mark_icon');

    markElement.append(markIcon);

    content
      ..append(boxElement)
      ..append(markElement);
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
