import 'dart:html' as html;
import 'package:route/client.dart';
import 'package:liquid/liquid.dart';
import 'package:liquid/vdom.dart' as v;
import 'package:liquid_material/material.dart' as mui;
import 'package:liquid_material/icons.dart' as mui;
import 'package:vcss/browser.dart' as css;
import 'src/pages.dart';

class ApplicationStyleSheet extends css.StyleSheet {
  static final instance = new ApplicationStyleSheet();

  final require = [mui.MainStyleSheet.instance,
                   mui.Button.css,
                   mui.Icon.css];

  final icons = [mui.iconComment];

  build() => [
      css.rule(['.paper-examples .mui-paper'], [
        css.width('100px'),
        css.height('100px'),
        css.marginBottom('32px')
      ]),

      css.rule('.paper-examples-group', [
        css.display('inline-block'),
        css.margin('0 32px')
      ]),

      css.rule('.raised1', [
        css.background(mui.paletteBlue.colors[mui.Palette.P500]),
        css.color(mui.white),
        css.margin('40px')
      ]),

      css.rule('container', [
        css.height('100%'),
      ])
    ];
}

class Application extends Component {
  static const int buttonPage = 0;

  @property(required: true) int page = 0;

  build() {
    return v.root(type: 'container')([
      mui.flatInkButton(type: 'flat1')(v.div()('Subject Title')),
      mui.raisedInkButton(type: 'raised1')(v.div()('Subject Title')),
      mui.fabInk(icon: mui.iconComment, type: 'fab1')
    ]);
  }
}


void main() {
  final app = new Application();
  final cssManager = new css.StyleSheetManager();

  final router = new Router()
    ..addHandler(new UrlPattern(r'/'), (_) {
      app.page = Application.buttonPage;
      app.invalidate();
    })
    ..listen();
  cssManager.include([ApplicationStyleSheet.instance]);

  injectComponent(app, html.document.body);
}
