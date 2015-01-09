library liquid_material.src.components.buttons.fab;

import 'package:liquid/liquid.dart';
import 'package:liquid/vdom.dart' as v;
import 'package:vcss/vcss.dart' as v;
import 'raised_button_base.dart';
import '../../colors.dart';
import '../../layout.dart';
import '../../vars.dart' as vars;
import '../../elements/paper.dart';
import '../icon.dart';

class FabStyleSheet extends v.StyleSheet {
  static const size = const v.Size.px(56);
  static const miniSize = const v.Size.px(40);

  final require = const [RaisedButtonBase.css];

  const FabStyleSheet();

  build(_) => [
      v.rule('.Fab', [
        Paper.circleStyle,
        v.height(size),
        v.width(size),
        v.background(vars.colorAccent.colors[Palette.P500]),
        v.color(white),
        v.padding(Layout.gridSize * 2)
      ]),
    ];
}

final fab = v.componentFactory(Fab);
class Fab extends RaisedButtonBase {
  static const css = const FabStyleSheet();

  @property(required: true)
  v.SvgIcon icon;

  Fab({this.icon, int zDepth: 1, bool disabled: false, bool noink: false})
      : super(zDepth: zDepth, disabled: disabled, noink: noink);

  void create() {
    super.create();
    element.classes.add('Fab');
  }

  build() => super.build().decorate(
      v.root()(
        new Icon(icon)
      )
    );
}
