import 'dart:html';
import 'package:vdom/helpers.dart' as vdom;
import 'package:liquid/liquid.dart';
import 'package:liquid_material/material.dart' as mui;

class PaperPage extends VComponent {
  PaperPage(Context context) : super('div', context) {
    element.id = 'paper-examples';
  }

  build() {
    final sharpPapers = [];
    final roundedPapers = [];
    final circlePapers = [];
    for (var i = 1; i < 6; i++) {
      sharpPapers.add(new mui.Paper(i, const [], depth: i));
      roundedPapers.add(new mui.RoundedPaper(i, const [], depth: i));
      circlePapers.add(new mui.CirclePaper(i, const [], depth: i));
    }

    return vdom.div(0,
        [vdom.div(0, sharpPapers, classes: const ['paper-examples-group']),
         vdom.div(1, roundedPapers, classes: const ['paper-examples-group']),
         vdom.div(2, circlePapers, classes: const ['paper-examples-group'])]);
  }

  static virtual(Object key) {
    return new VDomComponent(key, (component, context) {
      if (component == null) {
        return new PaperPage(context);
      }
    });
  }
}

class Application extends VComponent {
  Application(Context context) : super('div', context);

  build() => new mui.AppCanvas(0,
      [new mui.AppBar(#bar, [], title: 'Material UI'),
       PaperPage.virtual(0),
       new mui.FlatButton(0, [vdom.t('Flat Button')]),
       new mui.RaisedButton(1, [vdom.t('Raised Button')])]);
}


void main() {
  injectComponent(new Application(null), document.body);
}
