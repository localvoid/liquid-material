library liquid_material.vars;

import 'package:vcss/vcss.dart';
import 'colors.dart' as colors;

var iconSize = const Size.px(24);
var desktopGutter = const Size.px(24);
var desktopGutterMore = const Size.px(32);
var desktopGutterLess = const Size.px(16);
var desktopGutterMini = const Size.px(8);
var desktopKeylineIncrement = const Size.px(64);
var desktopDropDownMenuItemHeight = const Size.px(32);
var desktopDropDownMenuFontSize = const Size.px(15);
var desktopLeftNavMenuItemHeight = const Size.px(48);
var desktopSubheaderHeight = const Size.px(48);
var desktopToolbarHeight = const Size.px(56);

var paperButtonHeight = const Size.px(36);
var paperButtonMinWidth = const Size.px(88);

var fabSize = const Size.px(56);
var fabMiniSize = const Size.px(40);

var headingFontFamily = "'Roboto', sans-serif";
var contentFontFamily = headingFontFamily;

// App Colors
var primary1Color = colors.cyan500;
var primary2Color = colors.cyan700;
var primary3Color = colors.cyan100;
var accent1Color = colors.pinkA200;
var accent2Color = colors.pinkA400;
var accent3Color = colors.pinkA100;

// Text Colors
var bodyTextColor = colors.darkBlack;

// Border Colors
var borderColor = colors.grey300;

// Component Colors
var appBarColor = primary1Color;
var appBarTextColor = colors.darkWhite;
var toolBarColor = primary1Color;
var canvasColor = colors.white;
var dropDownMenuIconColor = colors.minBlack;
var leftNavColor = colors.white;
var subheaderBorderColor = borderColor;
var subheaderTextColor = primary1Color;

// menu
var menuBackgroundColor = colors.white;
var menuItemDataHeight = const Size.px(32);
var menuItemHeight = const Size.px(48);
var menuItemHoverColor = const RgbColor(0, 0, 0, 0.035);
var menuItemPadding = desktopGutter;
var menuItemSelectedTextColor = accent1Color;
var menuContainerBackgroundColor = colors.white;
var menuSubheaderPadding = desktopGutter;

// button
var buttonDefaultColor = colors.white;
var buttonDefaultTextColor = colors.darkBlack;
var buttonPrimaryColor = accent1Color;
var buttonPrimaryTextColor = colors.white;
var buttonDisabledColor = colors.grey200;
var buttonDisabledTextColor = colors.minBlack;

// input
var inputWidth = const Size.px(320);
var inputFontSize = const Size.px(16);
var inputPlaceholderSize = const Size.px(13);
var inputErrorColor = colors.red500;
var inputBarHeight = const Size.px(2);

// radio button
var radioButtonSize = const Size.px(16);
var radioButtonBorderColor = colors.black;
var radioButtonBackgroundColor = colors.white;
var radioButtonCheckColor = colors.black;

// checkbox
var checkboxBoxBackgroundColor = colors.white;
var checkboxBoxBorderColor = colors.black;
var checkboxCheckColor = colors.green400;

// toggle
var toggleWidth = const Size.px(32);
var toggleCheckedColor = colors.green400;
var toggleBarColor = colors.black;

// toast
var toastColor = colors.white;
var toastBackgroundColor = const HexColor('#323232');
var toastActionColor = colors.yellow400;

// layout
var appBarHeight = desktopKeylineIncrement;
var leftNavWidth = desktopKeylineIncrement * 4;
