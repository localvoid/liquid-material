library liquid_material.main;

import 'package:vcss/vcss.dart' as css;
import 'typography.dart';

class MainStyleSheet extends css.StyleSheet {
  static MainStyleSheet instance = new MainStyleSheet();

  build() => [
      css.rule('html', [
        css.fontFamily(Typography.fontFamily),
        css.color('#333')
      ])
    ];
}
