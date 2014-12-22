part of pages;

final vButtonPage = v.componentFactory(ButtonPage);
class ButtonPage extends Component {
  void create() {
    super.create();
    element.id = 'button-examples';
  }

  v.VRoot build() {
    final flatButtons = [];
    final raisedButtons = [];
    flatButtons.add(mui.flatButton()('Flat Button'));
    raisedButtons.add(mui.raisedButton()('Raised Button'));

    return v.root()([
      v.div(classes: const ['examples-group'])(flatButtons),
      v.div(classes: const ['examples-group'])(raisedButtons)
    ]);
  }
}
