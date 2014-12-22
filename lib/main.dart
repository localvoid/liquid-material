library liquid_material.main;

import 'package:vcss/vcss.dart' as css;
import 'vars.dart' as vars;

class MainStyleSheet extends css.StyleSheet {
  static MainStyleSheet instance = new MainStyleSheet();

  build() => [
      css.rule('html', [
        css.fontFamily(vars.contentFontFamily),
        css.color('#333')
      ])
    ];
}
