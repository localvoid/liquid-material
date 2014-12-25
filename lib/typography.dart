library liquid_material.typography;

import 'package:vcss/vcss.dart' as css;

class Typography {
  static const fontFamily = "RobotoDraft, Roboto, 'Helvetica Neue', sans-serif";

  static display4({bool contrast: false}) {
    final ret = [
        css.fontSize('112px'),
        css.fontWeight(300),
        css.lineHeight('112px'),
        css.letterSpacing('-0.04em')
      ];

    if (contrast) {
      ret.add(css.opacity(0.54));
    }
    return ret;
  }

  static display3({bool contrast: false}) {
    final ret = [
        css.fontSize('56px'),
        css.fontWeight(400),
        css.lineHeight('56px'),
        css.letterSpacing('-0.02em')
      ];

    if (contrast) {
      ret.add(css.opacity(0.54));
    }
    return ret;
  }

  static display2({bool contrast: false}) {
    final ret = [
        css.fontSize('45px'),
        css.fontWeight(400),
        css.lineHeight('48px')
      ];

    if (contrast) {
      ret.add(css.opacity(0.54));
    }
    return ret;
  }

  static display1({bool contrast: false}) {
    final ret = [
        css.fontSize('34px'),
        css.fontWeight(400),
        css.lineHeight('40px')
      ];

    if (contrast) {
      ret.add(css.opacity(0.54));
    }
    return ret;
  }

  static headline({bool contrast: false}) {
    final ret = [
        css.fontSize('24px'),
        css.fontWeight(400),
        css.lineHeight('32px')
      ];

    if (contrast) {
      ret.add(css.opacity(0.87));
    }
    return ret;
  }

  static title({bool contrast: false}) {
    final ret = [
        css.fontSize('20px'),
        css.fontWeight(500),
        css.lineHeight('20px'),
        css.letterSpacing('0.02em')
      ];

    if (contrast) {
      ret.add(css.opacity(0.87));
    }
    return ret;
  }

  static subhead2({bool contrast: false}) {
    final ret = [
        css.fontSize('16px'),
        css.fontWeight(400),
        css.lineHeight('28px'),
        css.letterSpacing('0.04em')
      ];

    if (contrast) {
      ret.add(css.opacity(0.87));
    }
    return ret;
  }

  static subhead1({bool contrast: false}) {
    final ret = [
        css.fontSize('16px'),
        css.fontWeight(400),
        css.lineHeight('24px'),
        css.letterSpacing('0.04em')
      ];

    if (contrast) {
      ret.add(css.opacity(0.87));
    }
    return ret;
  }

  static body2({bool contrast: false}) {
    final ret = [
        css.fontSize('14px'),
        css.fontWeight(500),
        css.lineHeight('24px'),
        css.letterSpacing('0.04em')
      ];

    if (contrast) {
      ret.add(css.opacity(0.87));
    }
    return ret;
  }

  static body1({bool contrast: false}) {
    final ret = [
        css.fontSize('14px'),
        css.fontWeight(400),
        css.lineHeight('20px'),
        css.letterSpacing('0.04em')
      ];

    if (contrast) {
      ret.add(css.opacity(0.87));
    }
    return ret;
  }

  static caption({bool contrast: false}) {
    final ret = [
        css.fontSize('12px'),
        css.fontWeight(400),
        css.lineHeight('12px'),
        css.letterSpacing('0.08em')
      ];

    if (contrast) {
      ret.add(css.opacity(0.54));
    }
    return ret;
  }

  static blockquote({bool contrast: false}) {
    final ret = [
        css.fontSize('24px'),
        css.fontWeight(300),
        css.fontStyle('italic'),
        css.lineHeight('24px'),
        css.letterSpacing('0.08em'),

        css.rule('&:before', [
          css.content('“'),
          css.opacity(0.54)
        ]),

        css.rule('&:after', [
           css.content('”'),
           css.opacity(0.54)
        ])
      ];

    if (contrast) {
      ret.add(css.opacity(0.54));
    }
    return ret;
  }

  static menu({bool contrast: false}) {
    final ret = [
        css.fontSize('14px'),
        css.fontWeight(500),
        css.lineHeight('14px'),
        css.letterSpacing('0.04em')
      ];

    if (contrast) {
      ret.add(css.opacity(0.87));
    }
    return ret;
  }

  static button({bool contrast: false}) {
    final ret = [
        css.fontSize('14px'),
        css.fontWeight(400),
        css.textTransform('uppercase'),
        css.lineHeight('14px'),
        css.letterSpacing('0.04em')
      ];

    if (contrast) {
      ret.add(css.opacity(0.87));
    }
    return ret;
  }
}