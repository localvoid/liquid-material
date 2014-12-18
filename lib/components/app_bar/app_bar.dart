library liquid_material.app_bar;

import 'dart:html' as html;
import 'package:liquid/vdom.dart' as v;
import 'package:liquid/liquid.dart';
import 'package:liquid_material/components/paper/paper.dart';

final appBar = v.componentFactory(AppBar);
class AppBar extends Paper {
  @property(required: true) String title;
  html.HeadingElement _titleElement;

  AppBar({int zDepth: 0}) : super(zDepth: zDepth);

  void create() {
    super.create();
    _titleElement = new html.HeadingElement.h1()
      ..classes.add('mui-app-bar-title')
      ..text = title;
    element.classes.add('mui-app-bar');
    inner
      ..append(_titleElement);
  }
}
