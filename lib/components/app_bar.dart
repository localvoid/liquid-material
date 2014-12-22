library liquid_material.app_bar;

import 'dart:html' as html;
import 'package:liquid/vdom.dart' as v;
import 'package:liquid/liquid.dart';
import 'package:vcss/vcss.dart' as css;
import '../vars.dart' as vars;
import 'tool_bar.dart';

class AppBarStyleSheet extends css.StyleSheet {
  final require = [ToolBar.css];

  build() => [
      css.rule('.mui_appBar', [
        css.backgroundColor(vars.appBarColor),
        css.color(vars.appBarTextColor),
        css.zIndex(2)
      ]),

      css.rule('.mui_appBar_navIcon', [
        css.marginRight(vars.desktopGutter),
        css.flex('0 1 main-size')
      ]),

      css.rule('.mui_appBar_title', [
        css.paddingTop(0)
      ]),
    ];
}


final appBar = v.componentFactory(AppBar);
class AppBar extends ToolBar {
  static final css = new AppBarStyleSheet();

  @property(required: true)
  String title;

  void create() {
    super.create();
    element.classes.add('mui_appBar');
  }

  build() {
    return super.build().decorate(
      v.rootDecorator()(
        toolBarRow()(
          v.div(type: 'mui_appBar_title')(title)
        )
      )
    );
  }
}
