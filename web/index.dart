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
                   mui.AppBar.css];

  final icons = [mui.cloudDone];

  build() => [
      css.rule(['.paper-examples .mui-paper'], [
        css.width('100px'),
        css.height('100px'),
        css.marginBottom('32px')
      ]),

      css.rule('.paper-examples-group', [
        css.display('inline-block'),
        css.margin('0 32px')
      ])
    ];
}

class Application extends Component {
  static const int buttonPage = 0;

  @property(required: true) int page = 0;

  build() {
    return v.root()([
      mui.appBar(title: 'Components Demo'),
      mui.icon(mui.cloudDone, shapeStyles: {'fill': '#f00'})
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
