library liquid_material.src.components.buttons.flat_button;

import 'package:liquid/vdom.dart' as v;
import 'package:vcss/vcss.dart' as v;
import 'button_base.dart';
import '../../layout.dart';
import '../../typography.dart';
import '../../elements/paper.dart';

class FlatButtonStyleSheet extends v.StyleSheet {
  static const height = const v.Size.px(36);
  static const minWidth = const v.Size.px(64);

  final require = const [ButtonBase.css];

  const FlatButtonStyleSheet();

  build(_) => [
      v.rule('.FlatButton', [
        ButtonBase.style,
        Paper.roundStyle,
        v.height(height),
        v.minWidth(minWidth),
        v.padding('0 ${Layout.gridSize}'),
        Typography.button(),
      ]),
    ];
}

final flatButton = v.componentFactory(FlatButton);
class FlatButton extends ButtonBase {
  static const css = const FlatButtonStyleSheet();

  FlatButton({bool disabled: false, bool noink: false})
      : super(disabled: disabled, noink: noink);

  void create() {
    super.create();
    element.classes.add('FlatButton');
  }
}
