library liquid_material.tool_bar;

import 'dart:html' as html;
import 'package:liquid/liquid.dart';
import 'package:liquid/vdom.dart' as v;
import 'package:vcss/vcss.dart' as css;
import '../vars.dart' as vars;

const int alignTop = 0;
const int alignBottom = 1;
const int alignMiddle = 2;

String alignToString(int align) {
  switch (align) {
    case 0:
      return 'top';
    case 1:
      return 'bottom';
  }
  return 'middle';
}

class ToolBarStyleSheet extends css.StyleSheet {
  build() => [
      css.rule('.mui_toolBar', [
        css.display('relative'),
        css.height(vars.desktopToolbarHeight),
        css.backgroundColor(vars.toolBarColor),

//        css.media('mobile', [
//          css.height(vars.mobileToolbarHeight)
//        ]),

        css.rule('&.mui_mediumTall', [
          css.height(vars.desktopToolbarHeight * 2)
        ]),

        css.rule('&.mui_tall', [
          css.height(vars.desktopToolbarHeight * 3)
        ]),

        css.rule(['&.mui_mediumTall', '&.mui_tall'], [
          css.transform('translateY(100%)')
        ])
      ]),

      css.rule('.mui_toolBar_row', [
        css.height(vars.desktopToolbarHeight),
        css.padding('0 ${vars.desktopGutterMini}'),

        css.rule('&.mui_bottom', [
          css.position('absolute'),
          css.left(0),
          css.right(0),
          css.bottom(0)
        ]),

        css.rule('&.mui_middle', [
          css.position('absolute'),
          css.left(0),
          css.right(0),
          css.top(0)
        ])
      ])
    ];
}

final toolBar = v.componentFactory(ToolBar);
class ToolBar extends Component {
  static final css = new ToolBarStyleSheet();

  void create() {
    element = new html.DivElement()
      ..classes.add('mui_toolBar');
  }

  build() => v.rootDecorator();
}

final toolBarRow = v.componentFactory(ToolBarRow);
class ToolBarRow extends Component {
  @property(immutable: true) final int align;

  ToolBarRow({this.align: alignTop});

  void create() {
    element = new html.DivElement();
    element.classes
      ..add('mui_toolBar_row')
      ..add('mui_${alignToString(align)}');
  }

  build() => v.rootDecorator();
}
