library liquid_material.layout;

import 'dart:html' as html;
import 'package:vcss/vcss.dart' as css;

/// WIP
///
/// TODO: take into consideration view distances (TVs, etc)
class Layout {
  static Layout _instance = new Layout._();

  static const css.Size gridSize = const css.Size.px(8);
  static const css.Size touchSize = const css.Size.px(48);

  /// Landscape Orientation
  static const int landscape = 1;

  /// 0 < xs < 600
  static const int xsScreen = 1 << 1;

  /// 600 <= sm < 960
  static const int smScreen = 1 << 2;

  /// 960 <= md < 1200
  static const int mdScreen = 1 << 3;

  /// 1200 <= lg
  static const int lgScreen = 1 << 4;

  int width;
  int height;
  int type;

  bool get isLandscape => type & landscape == landscape;

  Layout._() {
    final screen = html.window.screen;
    width = screen.width;
    height = screen.height;

//    final orientation = screen.orientation;
//    final orientationType = orientation.type;
//
//    orientation.onChange.listen(_handleOrientationChange);
//    html.window.onResize.listen(_handleResize);
  }

  void _handleOrientationChange(html.Event e) {

  }

  void _handleResize(html.Event e) {
  }

  static int _calcType(int width, int height, bool landscapeOrientation) {
    int i = 0;
    if (width < 600) {
      i |= xsScreen;
    } else if (width < 960) {
      i |= smScreen;
    } else if (width < 1200) {
      i |= mdScreen;
    } else {
      i |= lgScreen;
    }

    if (landscapeOrientation) {
      i |= landscape;
    }

    return i;
  }
}