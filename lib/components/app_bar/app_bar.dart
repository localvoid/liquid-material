library liquid_material.app_bar;

import 'dart:html' as html;
import 'package:vdom/vdom.dart' as vdom;
import 'package:liquid/liquid.dart';
import 'package:liquid_material/components/paper/paper.dart';

class AppBar extends Paper {
  String title;
  html.HeadingElement _titleElement;

  AppBar(Context context,
      {this.title: '',
       int zDepth: 1})
       : super(context, zDepth) {
    _titleElement = new html.HeadingElement.h1()
      ..classes.add('mui-app-bar-title')
      ..text = title;
    element.classes.add('mui-app-bar');
    inner
      ..append(_titleElement);
  }
}

class VAppBar extends VComponentContainer<AppBar, html.DivElement> {
  String title;

  VAppBar(Object key,
      List<vdom.Node> children,
      {this.title: '',
       Map<String, String> attributes: null,
       List<String> classes: null,
       Map<String, String> styles: null}) :
      super(key, children, attributes, classes, styles);

  void create(vdom.Context context) {
    component = new AppBar(context, title: title);
    ref = component.element;
  }
}
