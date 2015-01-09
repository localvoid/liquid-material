import 'dart:html' as html;
import 'package:route/client.dart';
import 'package:liquid/liquid.dart';
import 'package:liquid/vdom.dart' as v;
import 'package:liquid_material/material.dart' as mui;
import 'package:liquid_material/icons.dart' as mui;
import 'package:vcss/browser.dart' as css;

class ApplicationStyleSheet extends css.StyleSheet {
  const ApplicationStyleSheet();

  static const instance = const ApplicationStyleSheet();

  final require = const [
      mui.MainStyleSheet.instance,
      mui.Icon.css,
      mui.FlatButton.css,
      mui.RaisedButton.css,
      mui.IconButton.css,
      mui.Fab.css,
      mui.RadioButton.css,
      mui.CheckBox.css
    ];

  final icons = const [mui.iconComment, mui.iconMenu];

  build(_) => [
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
      mui.flatButton(type: 'flat1')(v.div()('Subject Title')),
      mui.raisedButton(type: 'raised1')(v.div()('Subject Title')),
      mui.fab(icon: mui.iconComment, type: 'fab1'),
      mui.iconButton(icon: mui.iconMenu, type: 'icon1'),
      mui.radioButton(type: 'radio1'),
      mui.checkBox(type: 'checkBox1')
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
