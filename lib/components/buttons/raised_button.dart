library liquid_material.src.components.buttons.raised_button;

import 'package:liquid/vdom.dart' as v;
import 'package:vcss/vcss.dart' as v;
import 'raised_button_base.dart';
import '../../layout.dart';
import '../../typography.dart';
import '../../elements/paper.dart';

class RaisedButtonStyleSheet extends v.StyleSheet {
  static const height = const v.Size.px(36);
  static const minWidth = const v.Size.px(64);

  final require = const [RaisedButtonBase.css];

  const RaisedButtonStyleSheet();

  build(_) => [
      v.rule('.RaisedButton', [
        RaisedButtonBase.style,
        Paper.roundStyle,
        v.height(height),
        v.minWidth(minWidth),
        v.padding('0 ${Layout.gridSize}'),
        Typography.button(),
      ]),
    ];
}

final raisedButton = v.componentFactory(RaisedButton);
class RaisedButton extends RaisedButtonBase {
  static const css = const RaisedButtonStyleSheet();

  RaisedButton({int zDepth: 1, bool disabled: false, bool noink: false})
      : super(zDepth: zDepth, disabled: disabled, noink: noink);

  void create() {
    super.create();
    element.classes.add('RaisedButton');
  }
}
