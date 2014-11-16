library liquid_material.button;

import 'dart:html' as html;
import 'package:vdom/vdom.dart' as vdom;
import 'package:liquid_material/components/paper/paper.dart';
import 'package:liquid_material/components/ripple/ripple.dart';

class Button extends Paper {
  Ripple _ripple;
  html.DivElement content;
  bool disabled;

  html.Element get container => content;

  Button(Object key,
      List<vdom.Node> children,
      {this.disabled: false,
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
    _ripple = new Ripple(0);
    _ripple.create(context);
    _ripple.render(context);
    content = new html.DivElement()
      ..classes.add('mui-paper-button-content');

    super.render(context);
    final html.DivElement e = ref;
    e.classes
      ..add('mui-paper-button');
    if (disabled) {
      e.classes.add('mui-disabled');
    }

    inner
      ..append(_ripple.ref)
      ..append(content);

    e.onMouseDown.listen(_handleMouseDown);
  }

  void update(Button other, vdom.Context context) {
    super.update(other, context);
    other._ripple = _ripple;
    other.content = content;
    final html.DivElement e = ref;
    if (disabled != other.disabled) {
      if (disabled) {
        e.classes.remove('mui-disabled');
      } else {
        e.classes.add('mui-disabled');
      }
    }
  }

  void _handleMouseDown(html.MouseEvent ev) {
    final e = ref;
    var x = ev.offset.x / e.clientWidth;
    var y = ev.offset.y / e.clientHeight;
    _ripple.animate(x, y);
  }
}

class FlatButton extends Button {
  FlatButton(Object key,
      List<vdom.Node> children,
      {bool disabled: false,
       Map<String, String> attributes: null,
       List<String> classes: null,
       Map<String, String> styles: null})
       : super(key, children,
           disabled: disabled,
           depth: 0,
           attributes: attributes,
           classes: classes,
           styles: styles);

  void create(vdom.Context context) {
    super.create(context);
    (ref as html.DivElement).classes.add('mui-flat');
  }
}

class RaisedButton extends Button {
  bool _raising = false;

  RaisedButton(Object key,
      List<vdom.Node> children,
      {bool disabled: false,
       Map<String, String> attributes: null,
       List<String> classes: null,
       Map<String, String> styles: null})
       : super(key, children,
           disabled: disabled,
           depth: 1,
           attributes: attributes,
           classes: classes,
           styles: styles);

  void create(vdom.Context context) {
    super.create(context);
    (ref as html.DivElement)
        ..classes.add('mui-flat')
        ..onTransitionEnd.listen(_handleTransitionEnd);
  }

  void _handleMouseDown(html.MouseEvent ev) {
    super._handleMouseDown(ev);
    if (!_raising) {
      _raising = true;
      final html.DivElement e = ref;
      e.classes.remove('mui-z-depth-$depth');
      e.classes.add('mui-z-depth-${depth+1}');
    }
  }

  void _handleTransitionEnd(html.TransitionEvent ev) {
    if (_raising) {
      final html.DivElement e = ref;
      e.classes.remove('mui-z-depth-${depth+1}');
      e.classes.add('mui-z-depth-$depth');
      _raising = false;
    }
  }
}
