library liquid_material.button;

import 'dart:html' as html;
import 'package:vdom/vdom.dart' as vdom;
import 'package:liquid/liquid.dart';
import 'package:liquid_material/components/paper/paper.dart';
import 'package:liquid_material/components/ripple/ripple.dart';

class Button extends Paper {
  Ripple _ripple;
  html.DivElement content;

  bool _oldDisabled;
  bool _disabled;

  bool get disabled => _disabled;

  void set disabled(bool newDisabled) {
    if (_disabled != newDisabled) {
      _disabled = newDisabled;
      invalidate();
    }
  }

  html.DivElement get container => content;

  Button(Context context,
      {bool disabled: false,
       int zDepth: 1})
      : _oldDisabled = disabled,
      _disabled = disabled,
      super(context, zDepth) {
    _ripple = new Ripple(this);

    element.classes.add('mui-paper-button');
    if (_disabled != null && _disabled) {
      element.classes.add('mui-disabled');
    }

    content = new html.DivElement()
      ..classes.add('mui-paper-button-content');

    inner
      ..append(_ripple.element)
      ..append(content);

    element.onMouseDown.listen(handleMouseDown);
  }

  void update() {
    super.update();
    updateDisabled(_disabled);
  }

  void updateDisabled(bool newDisabled) {
    if (_oldDisabled != newDisabled) {
      if (_oldDisabled) {
        element.classes.remove('mui-disabled');
      } else {
        element.classes.add('mui-disabled');
      }
      _oldDisabled = newDisabled;
      _disabled = newDisabled;
    }
  }

  void updateProperties(bool newDisabled) {
    if (newDisabled != null) {
      updateDisabled(newDisabled);
    }
  }

  void handleMouseDown(html.MouseEvent ev) {
    var x = ev.offset.x / element.clientWidth;
    var y = ev.offset.y / element.clientHeight;
    _ripple.animate(x, y);
  }
}

class FlatButton extends Button {
  FlatButton(Context context, {bool disabled: false})
       : super(context, disabled: disabled, zDepth: 0) {
    element.classes.add('mui-flat');
  }
}

class RaisedButton extends Button {
  bool _mouseDown = false;
  bool _raising = false;

  RaisedButton(Context context, {bool disabled: false})
       : super(context, disabled: disabled, zDepth: 1) {
    element.classes.add('mui-raised');
    element.onTransitionEnd.listen(_handleTransitionEnd);
  }

  void handleMouseDown(html.MouseEvent e) {
    super.handleMouseDown(e);
    if (!_mouseDown) {
      zDepth += 1;
      _mouseDown = true;
    }
  }

  void _handleTransitionEnd(html.TransitionEvent ev) {
    if (_mouseDown) {
      zDepth -= 1;
      _mouseDown = false;
    }
  }
}

class VFlatButton extends VComponentContainer<FlatButton, html.DivElement> {
  bool disabled;

  VFlatButton(Object key,
      List<vdom.Node> children,
      {this.disabled: null,
       Map<String, String> attributes: null,
       List<String> classes: null,
       Map<String, String> styles: null})
    : super(key, children, attributes, classes, styles);

  void create(Context context) {
    component = new FlatButton(context, disabled: disabled);
    ref = component.element;
  }

  void update(VFlatButton other, Context context) {
    super.update(other, context);
    component.updateProperties(other.disabled);
  }
}


class VRaisedButton extends VComponentContainer<RaisedButton, html.DivElement> {
  bool disabled;

  VRaisedButton(Object key,
      List<vdom.Node> children,
      {this.disabled: null,
       Map<String, String> attributes: null,
       List<String> classes: null,
       Map<String, String> styles: null})
    : super(key, children, attributes, classes, styles);

  void create(Context context) {
    component = new RaisedButton(context, disabled: disabled);
    ref = component.element;
  }

  void update(VRaisedButton other, Context context) {
    super.update(other, context);
    component.updateProperties(other.disabled);
  }
}
