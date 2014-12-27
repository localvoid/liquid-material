library liquid_material.radio_button;

import 'dart:html' as html;
import 'package:liquid/liquid.dart';
import 'package:liquid/vdom.dart' as v;
import 'package:vcss/vcss.dart' as css;
import 'button.dart';
import '../layout.dart';
import '../style.dart';

class RadioButtonStyleSheet extends css.StyleSheet {
  static const size = const css.Size.px(48);
  static const radioSize = const css.Size.px(16);

  build() => [
      css.rule('.RadioButton', [
        css.width(size),
        css.height(size),
        css.padding(Layout.gridSize * 2)
      ]),

      css.rule('.RadioButton_off', [
        css.position('absolute'),
        css.top(0),
        css.left(0),
        css.width(radioSize),
        css.height(radioSize),
        css.border('2px solid #5a5a5a'),
        css.borderRadius('50%')
      ]),

      css.rule('.RadioButton_on', [
        css.position('absolute'),
        css.top(0),
        css.left(0),
        css.width(radioSize),
        css.height(radioSize),
        css.background('#0f9d58'),
        css.borderRadius('50%'),
        css.transform('scale(0)'),
        css.transition('transform 0.28s $swiftEaseInOut'),

        css.rule('.RadioButton.checked &', [
          css.transform('scale(1.125)')
        ])
      ])
    ];
}

final radioButton = v.componentFactory(RadioButton);
class RadioButton extends InkButton {
  static final css = new RadioButtonStyleSheet();

  @property()
  bool checked;

  @property(immutable: true)
  bool toggles;

  RadioButton({this.checked: false, this.toggles: true, bool disabled: false})
    : super(disabled: disabled);

  void create() {
    super.create();
    element.classes
      ..add('RadioButton')
      ..add('circle');


    final offElement = new html.DivElement()
      ..classes.add('RadioButton_off');

    final onElement = new html.DivElement()
      ..classes.add('RadioButton_on');

    content
      ..append(offElement)
      ..append(onElement);
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
