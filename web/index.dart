import 'dart:html' as html;
import 'package:route/client.dart';
import 'package:liquid/liquid.dart';
import 'package:liquid_material/material.dart' as mui;
import 'src/pages.dart';

class Application extends mui.AppCanvas {
  static const int buttonPage = 0;

  int _page = buttonPage;
  void set page(int newPage) {
    if (_page != newPage) {
      _page = newPage;
      invalidate();
    }
  }

  Application(Context context) : super(context);

  VRootElement build() {
    var p;
    switch (_page) {
      case buttonPage:
        p = new VButtonPage(_page);
        break;
    }

    return new VRootElement([new mui.VAppBar(#appBar, const [], title: 'Components Demo'),
                             p]);
  }
}


void main() {
  final app = new Application(null);

  final router = new Router()
    ..addHandler(new UrlPattern(r'/'), (_) {
      app.page = Application.buttonPage;
    })
    ..listen();

  injectComponent(app, html.document.body);
}
