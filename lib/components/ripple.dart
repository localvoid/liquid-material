library liquid_material.ripple;

import 'dart:math' as math;
import 'dart:html' as html;
import 'package:liquid/liquid.dart';
import 'package:vcss/vcss.dart' as css;
import '../style.dart';

class RippleStyleSheet extends css.StyleSheet {
  build() => [
      css.rule('.Ripple', [
        css.position('absolute'),
        css.top(0),
        css.left(0),
        css.right(0),
        css.bottom(0),
        css.overflow('hidden'),
        css.borderRadius('inherit')
      ]),

      css.rule(['.Ripple_fill'], [
        css.position('absolute'),
        css.top(0),
        css.left(0),
        css.right(0),
        css.bottom(0),
        css.transition('opacity 1.1s $swiftEaseInOut'),
        css.opacity(0)
      ]),

      css.rule('.Ripple_wave', [
        css.position('absolute'),
        css.borderRadius('50%'),
        css.left('-50px'),
        css.top('-50px'),
        css.width('100px'),
        css.height('100px'),
        css.overflow('hidden'),
        css.transition('opacity 0.4s $swiftEaseIn, transform 0.6s $swiftEaseOut'),
        css.opacity(0.25),

        css.rule('&.out', [
          css.opacity(0)
        ])
      ])
    ];
}

class Position {
  final num x;
  final num y;

  const Position(this.x, this.y);
}

class RippleWave {
  final html.DivElement element = new html.DivElement();
  final Position from;
  final Position to;
  final num radius;
  final double scaleFactor;

  RippleWave(this.from, this.to, num radius, String color)
      : radius = radius,
        scaleFactor = radius / 100 {
    element.classes.add('Ripple_wave');
    element.style
      ..background = color
      ..transform = 'translate(${from.x}px, ${from.y}px) scale(0.01)';
  }

  void update() {
    element.style.transform = 'translate(${to.x}px, ${to.y}px) scale($scaleFactor)';
  }

  void out() {
    element.classes.add('out');
    element.style.transform = 'translate(${to.x}px, ${to.y}px) scale(${scaleFactor + 0.3})';
  }
}

class Ripple {
  static final css = new RippleStyleSheet();

  final html.DivElement element = new html.DivElement();
  final html.DivElement _fillElement = new html.DivElement();
  html.Element container;

  final String color;
  final bool fill;
  final bool recentering;

  RippleWave _currentWave;
  bool _active = false;

  Ripple(this.container, {this.color, this.fill: true, this.recentering: true}) {
    element.classes.add('Ripple');
    element.onTransitionEnd.listen(_handleTransitionEnd);

    if (fill) {
      _fillElement.classes.add('Ripple_fill');
      element.append(_fillElement);
    }
  }

  void _handleTransitionEnd(html.TransitionEvent e) {
    final html.DivElement t = e.target;
    if (t.classes.contains('out')) {
      if (e.propertyName == 'opacity') {
        domScheduler.nextFrame.write(0).then((_) {
          t.remove();
        });
      }
    }
  }

  void touchDown(html.MouseEvent e) {
    if (_currentWave != null) {
      return;
    }
    String fillColor;
    if (color != null) {
      fillColor = color;
    } else {
      final style = container.getComputedStyle();
      fillColor = style.color;
    }

    final w = container.offsetWidth;
    final h = container.offsetHeight;
    final x = e.client.x - container.offsetLeft;
    final y = e.client.y - container.offsetTop;
    final from = new Position(x, y);
    final to = recentering ? new Position(w / 2, h / 2) : from;
    final radius = math.sqrt((w * w) + (h * h));
    _currentWave = new RippleWave(from, to, radius, fillColor);
    _fillElement.style.backgroundColor = fillColor;

    domScheduler.nextFrame.write(0).then((_) {
      element.append(_currentWave.element);
      domScheduler.currentFrame.read().then((_) {
        _currentWave.element.getComputedStyle().transform;
        domScheduler.currentFrame.write(0).then((_) {
          _currentWave.update();
          _fillElement.style.opacity = '0.25';
        });
      });
    });
  }

  void touchUp() {
    _fillElement.style.opacity = null;
    if (_currentWave != null) {
      _currentWave.out();
      _currentWave = null;
    }
  }
}
