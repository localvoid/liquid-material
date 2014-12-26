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
        css.transform('translate3d(0, 0, 0)'),
        css.top(0),
        css.left(0),
        css.right(0),
        css.bottom(0),
        css.overflow('hidden'),
        css.borderRadius('inherit')
      ]),

      css.rule(['.Ripple_bg'], [
        css.position('absolute'),
        css.top(0),
        css.left(0),
        css.right(0),
        css.bottom(0),
        css.opacity(0),
        css.transition('opacity 1.1s $swiftEaseInOut'),
      ]),

      css.rule('.Ripple_wave', [
        css.position('absolute'),
        css.borderRadius('50%'),
        css.left('-50px'),
        css.top('-50px'),
        css.width('100px'),
        css.height('100px'),
        css.transition('opacity 0.4s $swiftEaseIn, transform 0.6s $swiftEaseOut'),
        css.opacity(0.25),

        css.rule('&.out', [
          css.opacity(0)
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
  static final css = new RippleStyleSheet();

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
        domScheduler.nextFrame.write(0).then((_) {
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

    domScheduler.nextFrame.write(0).then((_) {
      if (_currentWave == null) {
        return;
      }
      element.append(_currentWave.element);
      domScheduler.currentFrame.read().then((_) {
        if (_currentWave == null) {
          return;
        }
        _currentWave.element.getComputedStyle().transform;
        domScheduler.currentFrame.write(0).then((_) {
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
