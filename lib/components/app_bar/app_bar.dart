library liquid_material.app_bar;

import 'dart:html' as html;
import 'package:vdom/vdom.dart' as vdom;
import 'package:liquid_material/components/paper/paper.dart';

class AppBar extends Paper {
  String title;
  html.HeadingElement _titleElement;
  html.DivElement _container;

  html.Element get container => _container;

  AppBar(Object key,
      List<vdom.Node> children,
      {this.title: '',
       int depth: 1,
       Map<String, String> attributes: null,
       List<String> classes: null,
       Map<String, String> styles: null})
       : super(key, children,
           depth: depth,
           attributes: attributes,
           classes: classes,
           styles: styles);

  void render(vdom.Context context) {
    _titleElement = new html.HeadingElement.h1()
      ..classes.add('mui-app-bar-title')
      ..text = title;

    _container = new html.DivElement()
      ..classes.add('mui-app-bar-container');

    super.render(context);

    final html.DivElement e = ref;
    e.classes.add('mui-app-bar');

    inner.append(_titleElement);
    inner.append(_container);
  }

  void update(AppBar other, vdom.Context context) {
    super.update(other, context);
    other._titleElement = _titleElement;
    other._container = _container;
    final e = ref;
    if (title != other.title) {
      _titleElement.text = other.title;
    }
  }
}
