library liquid_material.tool_bar;

import 'dart:html' as html;
import 'package:liquid/liquid.dart';
import 'package:liquid/vdom.dart' as v;
import 'package:vcss/vcss.dart' as css;
import '../layout.dart';
import '../typography.dart';

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
  const ToolBarStyleSheet();

  /*
   * if (Layout.type & (Layout.xsScreen | Layout.landscape)) {
   *   height = 48;
   * } else if (Layout.type & Layout.xsScreen) {
   *   height = 56;
   * } else {
   *   height = 64;
   * }
   */
  static const rowHeight = const css.Size.px(64);

  build(_) => [
      css.rule('.ToolBar', [
        css.position('relative'),
        css.minHeight(rowHeight),
        Typography.title(),

        css.rule('&.mediumTall', [
          css.height(rowHeight * 2)
        ]),

        css.rule('&.tall', [
          css.height(rowHeight * 3)
        ]),

        css.rule(['&.mediumTall', '&.tall'], [
          css.transform('translateY(100%)')
        ])
      ]),

      css.rule('.ToolBarRow', [
        css.display('flex'),
        css.alignItems('center'),
        css.height(rowHeight),
        css.padding('0 ${Layout.gridSize * 3}'), // gridSize * 2 on mobile

        css.rule('&.bottom', [
          css.position('absolute'),
          css.left(0),
          css.right(0),
          css.bottom(0)
        ]),

        css.rule('&.middle', [
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
  static const css = const ToolBarStyleSheet();

  void create() {
    element = new html.DivElement()
      ..classes.add('ToolBar');
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
      ..add('ToolBarRow')
      ..add(alignToString(align));
  }

  build() => v.rootDecorator();
}
