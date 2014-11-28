part of pages;

class ButtonPage extends mui.AppContentCanvas {
  ButtonPage(Context context) : super(context) {
    element.id = 'button-examples';
  }

  VRootElement build() {
    final flatButtons = [];
    final raisedButtons = [];
    flatButtons.add(new mui.VFlatButton(0, [vdom.t('Flat Button')]));
    raisedButtons.add(new mui.VRaisedButton(0, [vdom.t('Raised Button')]));

    return new VRootElement(
        [vdom.div(0, flatButtons, classes: const ['examples-group']),
         vdom.div(1, raisedButtons, classes: const ['examples-group'])]);
  }
}

class VButtonPage extends VComponentBase<ButtonPage, html.DivElement> {
  VButtonPage(Object key) : super(key);

  void create(Context context) {
    component = new ButtonPage(context);
    ref = component.element;
  }
}