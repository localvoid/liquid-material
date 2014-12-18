import 'dart:html' as html;
import 'package:route/client.dart';
import 'package:liquid/liquid.dart';
import 'package:liquid/vdom.dart' as v;
import 'package:liquid_material/material.dart' as mui;
import 'src/pages.dart';

class Application extends mui.AppCanvas {
  static const int buttonPage = 0;

  @property(required: true) int page = 0;

  v.VRoot build() {
    var vpage;
    switch (page) {
      case buttonPage:
        vpage = vButtonPage();
        break;
    }

    return v.root()([
      mui.appBar(title: 'Components Demo'),
      vpage
    ]);
  }
}


void main() {
  final app = new Application();

  final router = new Router()
    ..addHandler(new UrlPattern(r'/'), (_) {
      app.page = Application.buttonPage;
      app.invalidate();
    })
    ..listen();

  injectComponent(app, html.document.body);
}
