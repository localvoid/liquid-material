library liquid_material.style;

import 'package:vcss/vcss.dart' as css;

String paperShadowTransition() =>
    css.transition('box-shadow 0.28s cubic-bezier(0.4, 0, 0.2, 1)');

String paperShadow(int z) {
  switch (z) {
    case 1:
      return css.boxShadow('0 1px 4px 0 rgba(0, 0, 0, 0.37)');
    case 2:
      return css.boxShadow('0 2px 2px 0 rgba(0, 0, 0, 0.2),'
                           '0 6px 10px 0 rgba(0, 0, 0, 0.3)');
    case 3:
      return css.boxShadow('0 11px 7px 0 rgba(0, 0, 0, 0.19),'
                           '0 13px 25px 0 rgba(0, 0, 0, 0.3)');
    case 4:
      return css.boxShadow('0 14px 12px 0 rgba(0, 0, 0, 0.17)'
                           '0 20px 40px 0 rgba(0, 0, 0, 0.3)');
    case 5:
      return css.boxShadow('0 17px 17px 0 rgba(0, 0, 0, 0.15),'
                           '0 27px 55px 0 rgba(0, 0, 0, 0.3)');
  }
  return null;
}

const String swiftEaseOut = 'cubic-bezier(0.25, 0.8, 0.25, 1)';
const String swiftEaseIn = 'cubic-bezier(0.55, 0, 0.55, 0.2)';
const String swiftEaseInOut = 'cubic-bezier(0.35, 0, 0.25, 1)';
