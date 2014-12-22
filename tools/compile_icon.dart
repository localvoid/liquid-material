import 'dart:io';
import 'package:path/path.dart' as ospath;
import 'package:glob/glob.dart';
import 'package:xml/xml.dart' as xml;

final iconsGlob = new Glob('*/svg/production/*_24px.svg');

abstract class SvgNode {
  String toSource();
}

class SvgPath extends SvgNode {
  final String d;
  final String fill;
  final String opacity;
  final String fillOpacity;

  SvgPath(this.d, this.fill, this.opacity, this.fillOpacity);

  String toSource() {
    final out = new StringBuffer();
    out.write('const css.SvgPath(d: \'$d\'');
    if (fill != null) {
      out.write(', fill: \'$fill\'');
    }
    if (opacity != null) {
      out.write(', opacity: $opacity');
    }
    if (fillOpacity != null) {
      out.write(', fillOpacity: $fillOpacity');
    }
    out.write(')');
    return out.toString();
  }
}

class SvgCircle extends SvgNode {
  final String cx;
  final String cy;
  final String r;

  SvgCircle(this.cx, this.cy, this.r);

  String toSource() => 'const css.SvgCircle(cx: $cx, cy: $cy, r: $r)';
}

class Icon {
  final String name;
  final String viewBox;
  final String path;

  Icon(this.name, this.viewBox, this.path);

  String toString() => name;
}

SvgNode toSvgNode(xml.XmlElement node) {
  final tagName = node.name.local;
  switch (tagName) {
    case 'path':
      var d;
      var fill;
      var opacity;
      var fillOpacity;

      for (final a in node.attributes) {
        final aName = a.name.local;
        switch (aName) {
          case 'd':
            d = a.value;
            break;
          case 'fill':
            fill = a.value;
            break;
          case 'opacity':
            opacity = a.value;
            break;
          case 'fill-opacity':
            fillOpacity = a.value;
            break;
          default:
            throw 'Unknown attribute $a';
        }
      }

      return new SvgPath(d, fill, opacity, fillOpacity);
    case 'circle':
      var cx;
      var cy;
      var r;

      for (final a in node.attributes) {
        final aName = a.name.local;
        switch (aName) {
          case 'cx':
            cx = a.value;
            break;
          case 'cy':
            cy = a.value;
            break;
          case 'r':
            r = a.value;
            break;
          default:
            throw 'Unknown attribute $a';
        }
      }
      return new SvgCircle(cx, cy, r);
  }
  throw 'Unknown node: $node';
}

final underscoreRegexp = new RegExp(r'_[a-z0-9]');

void main(List<String> arguments) {
  for (final File iconFile in iconsGlob.listSync(root: 'material-design-icons-master')) {
    final fileName = ospath.basename(iconFile.path);
    final iconName = fileName.substring(3, fileName.length - 9)
        .replaceAllMapped(underscoreRegexp, (m) => m[0][1].toUpperCase());
    final varName = 'icon${iconName[0].toUpperCase()}${iconName.substring(1)}';

    final iconRaw = iconFile.readAsStringSync();
    final iconDoc = xml.parse(iconRaw);
    final icon = iconDoc.firstChild;
    final shapes = icon.children.map((c) => toSvgNode(c).toSource()).toList();
    print(
        'const $varName = const css.SvgIcon(\n'
        '    \'mui_$iconName\', \'0 0 24 24\',\n'
        '    const [\n'
        '      ${shapes.join(',\n      ')}\n'
        '    ]);\n');
  }
}
