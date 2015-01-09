library liquid_material.main;

import 'package:vcss/vcss.dart' as css;
import 'typography.dart';

class MainStyleSheet extends css.StyleSheet {
  const MainStyleSheet();

  static const MainStyleSheet instance = const MainStyleSheet();

  build(_) => [
      css.rule('html', [
        css.fontFamily(Typography.fontFamily),
        css.color('#333')
      ])
    ];
}
