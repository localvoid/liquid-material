library liquid_material.elements.ripple;

import 'dart:math' as math;
import 'dart:html' as html;
import 'package:liquid/liquid.dart';
import 'package:vcss/vcss.dart' as v;
import '../style.dart';

class RippleStyleSheet extends v.StyleSheet {
  const RippleStyleSheet();

  build(_) => [
      v.rule('.Ripple', [
        v.position('absolute'),
        v.transform('translateZ(0)'),
        v.top(0),
        v.left(0),
        v.right(0),
        v.bottom(0),
        v.overflow('hidden'),
        v.borderRadius('inherit'),
        v.pointerEvents('none')
      ]),

      v.rule(['.Ripple_bg'], [
        v.position('absolute'),
        v.top(0),
        v.left(0),
        v.right(0),
        v.bottom(0),
        v.opacity(0),
        v.transition('opacity 1.1s $swiftEaseInOut'),
      ]),

      v.rule('.Ripple_wave', [
        v.position('absolute'),
        v.borderRadius('50%'),
        v.left('-50px'),
        v.top('-50px'),
        v.width('100px'),
        v.height('100px'),
        v.transition('opacity 0.4s $swiftEaseIn, transform 0.6s $swiftEaseOut'),
        v.opacity(0.25),

        v.rule('&.out', [
          v.opacity(0)
        ])
      ])
    ];
}

class RippleWave {
  final html.DivElement element = new html.DivElement();
  final math.Point from;
  final math.Point to;
  final num radius;
  final double scaleFactor;

  RippleWave(this.from, this.to, num radius, String color)
      : radius = radius,
        scaleFactor = radius / 100 {
    element.classes.add('Ripple_wave');
    element.style
      ..background = color
      ..transform = 'translate3d(${from.x}px, ${from.y}px, 0) scale(0.01)';
  }

  void update() {
    element.style.transform = 'translate3d(${to.x}px, ${to.y}px, 0) scale($scaleFactor)';
  }

  void out() {
    element.classes.add('out');
    element.style.transform = 'translate3d(${to.x}px, ${to.y}px, 0) scale(${scaleFactor + 0.3})';
  }
}

class Ripple {
  static const css = const RippleStyleSheet();

  final html.DivElement element = new html.DivElement();
  html.DivElement _bgElement;

  html.Element container;

  final String color;
  final bool backgroundFill;
  final bool recentering;

  RippleWave _currentWave;
  bool _active = false;

  Ripple(this.container, {this.color, this.backgroundFill: true, this.recentering: true}) {
    element.classes.add('Ripple');
    element.onTransitionEnd.listen(_handleTransitionEnd);

    if (backgroundFill) {
      _bgElement = new html.DivElement()
        ..classes.add('Ripple_bg');
      element.append(_bgElement);
    }
  }

  void _handleTransitionEnd(html.TransitionEvent e) {
    final html.DivElement t = e.target;
    if (t.classes.contains('out')) {
      if (e.propertyName == 'opacity') {
        domScheduler.nextFrame.write().then((_) {
          t.remove();
        });
      }
    }
  }

  void touch(num x, num y) {
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
    final from = new math.Point(x - container.offsetLeft, y - container.offsetTop);
    final to = recentering ? new math.Point(w / 2, h / 2) : from;
    final radius = math.sqrt((w * w) + (h * h));
    _currentWave = new RippleWave(from, to, radius, fillColor);
    _bgElement.style.backgroundColor = fillColor;

    domScheduler.nextFrame.write().then((_) {
      if (_currentWave == null) {
        return;
      }
      element.append(_currentWave.element);
      domScheduler.currentFrame.read().then((_) {
        if (_currentWave == null) {
          return;
        }
        _currentWave.element.getComputedStyle().transform;
        domScheduler.currentFrame.write().then((_) {
          if (_currentWave == null) {
            return;
          }
          _currentWave.update();
          if (_bgElement != null) {
            _bgElement.style.opacity = '0.25';
          }
        });
      });
    });
  }

  void cancel() {
    if (_bgElement != null) {
      _bgElement.style.opacity = null;
    }
    if (_currentWave != null) {
      _currentWave.out();
      _currentWave = null;
    }
  }
}
