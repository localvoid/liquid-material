library liquid_material.paper;

import 'dart:html' as html;
import 'package:vdom/vdom.dart' as vdom;

class Paper extends vdom.Element {
  int depth;
  html.DivElement inner;

  html.Element get container => inner;

  Paper(Object key,
      List<vdom.Node> children,
      {this.depth: 1,
       Map<String, String> attributes: null,
       List<String> classes: null,
       Map<String, String> styles: null})
       : super(key, 'div', children,
           attributes: attributes,
           classes: classes,
           styles: styles);

  void render(vdom.Context context) {
    (ref as html.DivElement)
      ..classes.add('mui-paper')
      ..classes.add('mui-z-depth-${depth}');
    inner = new html.DivElement()
      ..classes.add('mui-paper-container')
      ..classes.add('mui-z-depth-bottom');
    ref.append(inner);
    super.render(context);
  }

  void update(Paper other, vdom.Context context) {
    super.update(other, context);
    final e = ref;
    if (depth != other.depth) {
      e.classes
        ..remove('mui-z-depth-$depth')
        ..add('mui-z-depth-${other.depth}');
    }
    other.inner = inner;
  }
}

class CirclePaper extends Paper {
  CirclePaper(Object key,
      List<vdom.Node> children,
      {int depth: 1,
       Map<String, String> attributes: null,
       List<String> classes: null,
       Map<String, String> styles: null})
       : super(key, children,
           depth: depth,
           attributes: attributes,
           classes: classes,
           styles: styles);

  void render(vdom.Context context) {
    super.render(context);
    (ref as html.DivElement).classes.add('mui-circle');
  }
}

class RoundedPaper extends Paper {
  RoundedPaper(Object key,
      List<vdom.Node> children,
      {int depth: 1,
       Map<String, String> attributes: null,
       List<String> classes: null,
       Map<String, String> styles: null})
       : super(key, children,
           depth: depth,
           attributes: attributes,
           classes: classes,
           styles: styles);

  void render(vdom.Context context) {
    super.render(context);
    (ref as html.DivElement).classes.add('mui-rounded');
  }
}
