library liquid_material.src.components.buttons.icon_button;

import 'package:liquid/liquid.dart';
import 'package:liquid/vdom.dart' as v;
import 'package:vcss/vcss.dart' as v;
import 'button_base.dart';
import '../../layout.dart';
import '../../elements/paper.dart';
import '../icon.dart';

class IconButtonStyleSheet extends v.StyleSheet {
  static const size = const v.Size.px(32);

  final require = const [ButtonBase.css];

  const IconButtonStyleSheet();

  build(_) => [
      v.rule('.IconButton', [
        ButtonBase.style,
        Paper.circleStyle,
        v.padding(Layout.gridSize),
      ]),
    ];
}

final iconButton = v.componentFactory(IconButton);
class IconButton extends ButtonBase {
  static const css = const IconButtonStyleSheet();

  @property(required: true)
  v.SvgIcon icon;

  IconButton({this.icon, bool disabled: false, bool noink: false})
      : super(disabled: disabled, noink: noink);

  void create() {
    super.create();
    element.classes.add('IconButton');
  }

  build() => super.build().decorate(
      v.root()(
        new Icon(icon)
      )
    );
}
