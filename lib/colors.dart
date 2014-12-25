library liquid_material.colors;

import 'package:vcss/vcss.dart';

class Color {
  static const int light = 0;
  static const int dark = 1;

  final HexColor color;
  final int type;

  int get contrast => type ^ 1;

  const Color(this.color, this.type);

  String toString() => color.toString();
}

class Palette {
  static const int P50  = 0;
  static const int P100 = 1;
  static const int P200 = 2;
  static const int P300 = 3;
  static const int P400 = 4;
  static const int P500 = 5;
  static const int P600 = 6;
  static const int P700 = 7;
  static const int P800 = 8;
  static const int P900 = 9;
  static const int A100 = 10;
  static const int A200 = 11;
  static const int A400 = 12;
  static const int A700 = 13;

  final List<Color> colors;

  const Palette(this.colors);
}

const paletteRed = const Palette(const [
  const Color(const HexColor('#ffebee'), Color.light),
  const Color(const HexColor('#ffcdd2'), Color.light),
  const Color(const HexColor('#ef9a9a'), Color.light),
  const Color(const HexColor('#e57373'), Color.light),
  const Color(const HexColor('#ef5350'), Color.light),
  const Color(const HexColor('#f44336'), Color.dark),
  const Color(const HexColor('#e53935'), Color.dark),
  const Color(const HexColor('#d32f2f'), Color.dark),
  const Color(const HexColor('#c62828'), Color.dark),
  const Color(const HexColor('#b71c1c'), Color.dark),
  const Color(const HexColor('#ff8a80'), Color.light),
  const Color(const HexColor('#ff5252'), Color.dark),
  const Color(const HexColor('#ff1744'), Color.dark),
  const Color(const HexColor('#d50000'), Color.dark)
]);

const palettePink = const Palette(const [
  const Color(const HexColor('#fce4ec'), Color.light),
  const Color(const HexColor('#f8bbd0'), Color.light),
  const Color(const HexColor('#f8bbd0'), Color.light),
  const Color(const HexColor('#f06292'), Color.light),
  const Color(const HexColor('#ec407a'), Color.light),
  const Color(const HexColor('#e91e63'), Color.dark),
  const Color(const HexColor('#d81b60'), Color.dark),
  const Color(const HexColor('#c2185b'), Color.dark),
  const Color(const HexColor('#ad1457'), Color.dark),
  const Color(const HexColor('#880e4f'), Color.dark),
  const Color(const HexColor('#ff80ab'), Color.light),
  const Color(const HexColor('#ff4081'), Color.dark),
  const Color(const HexColor('#f50057'), Color.dark),
  const Color(const HexColor('#c51162'), Color.dark)
]);

const palettePurple = const Palette(const [
  const Color(const HexColor('#f3e5f5'), Color.light),
  const Color(const HexColor('#e1bee7'), Color.light),
  const Color(const HexColor('#ce93d8'), Color.light),
  const Color(const HexColor('#ba68c8'), Color.dark),
  const Color(const HexColor('#ab47bc'), Color.dark),
  const Color(const HexColor('#9c27b0'), Color.dark),
  const Color(const HexColor('#8e24aa'), Color.dark),
  const Color(const HexColor('#7b1fa2'), Color.dark),
  const Color(const HexColor('#6a1b9a'), Color.dark),
  const Color(const HexColor('#4a148c'), Color.dark),
  const Color(const HexColor('#ea80fc'), Color.light),
  const Color(const HexColor('#e040fb'), Color.dark),
  const Color(const HexColor('#d500f9'), Color.dark),
  const Color(const HexColor('#aa00ff'), Color.dark)
]);

const paletteDeepPurple = const Palette(const [
  const Color(const HexColor('#ede7f6'), Color.light),
  const Color(const HexColor('#d1c4e9'), Color.light),
  const Color(const HexColor('#b39ddb'), Color.light),
  const Color(const HexColor('#9575cd'), Color.dark),
  const Color(const HexColor('#7e57c2'), Color.dark),
  const Color(const HexColor('#673ab7'), Color.dark),
  const Color(const HexColor('#5e35b1'), Color.dark),
  const Color(const HexColor('#512da8'), Color.dark),
  const Color(const HexColor('#4527a0'), Color.dark),
  const Color(const HexColor('#311b92'), Color.dark),
  const Color(const HexColor('#b388ff'), Color.light),
  const Color(const HexColor('#7c4dff'), Color.dark),
  const Color(const HexColor('#651fff'), Color.dark),
  const Color(const HexColor('#6200ea'), Color.dark)
]);

const paletteIndigo = const Palette(const [
  const Color(const HexColor('#e8eaf6'), Color.light),
  const Color(const HexColor('#c5cae9'), Color.light),
  const Color(const HexColor('#9fa8da'), Color.light),
  const Color(const HexColor('#7986cb'), Color.dark),
  const Color(const HexColor('#5c6bc0'), Color.dark),
  const Color(const HexColor('#3f51b5'), Color.dark),
  const Color(const HexColor('#3949ab'), Color.dark),
  const Color(const HexColor('#303f9f'), Color.dark),
  const Color(const HexColor('#283593'), Color.dark),
  const Color(const HexColor('#1a237e'), Color.dark),
  const Color(const HexColor('#8c9eff'), Color.light),
  const Color(const HexColor('#536dfe'), Color.dark),
  const Color(const HexColor('#3d5afe'), Color.dark),
  const Color(const HexColor('#304ffe'), Color.dark)
]);

const paletteBlue = const Palette(const [
  const Color(const HexColor('#e3f2fd'), Color.light),
  const Color(const HexColor('#bbdefb'), Color.light),
  const Color(const HexColor('#90caf9'), Color.light),
  const Color(const HexColor('#64b5f6'), Color.light),
  const Color(const HexColor('#42a5f5'), Color.light),
  const Color(const HexColor('#2196f3'), Color.dark),
  const Color(const HexColor('#1e88e5'), Color.dark),
  const Color(const HexColor('#1976d2'), Color.dark),
  const Color(const HexColor('#1565c0'), Color.dark),
  const Color(const HexColor('#0d47a1'), Color.dark),
  const Color(const HexColor('#82b1ff'), Color.light),
  const Color(const HexColor('#448aff'), Color.dark),
  const Color(const HexColor('#2979ff'), Color.dark),
  const Color(const HexColor('#2962ff'), Color.dark)
]);

const paletteLightBlue = const Palette(const [
  const Color(const HexColor('#e1f5fe'), Color.light),
  const Color(const HexColor('#b3e5fc'), Color.light),
  const Color(const HexColor('#81d4fa'), Color.light),
  const Color(const HexColor('#4fc3f7'), Color.light),
  const Color(const HexColor('#29b6f6'), Color.light),
  const Color(const HexColor('#03a9f4'), Color.dark),
  const Color(const HexColor('#039be5'), Color.dark),
  const Color(const HexColor('#0288d1'), Color.dark),
  const Color(const HexColor('#0277bd'), Color.dark),
  const Color(const HexColor('#01579b'), Color.dark),
  const Color(const HexColor('#80d8ff'), Color.light),
  const Color(const HexColor('#40c4ff'), Color.light),
  const Color(const HexColor('#00b0ff'), Color.light),
  const Color(const HexColor('#0091ea'), Color.dark)
]);

const paletteCyan = const Palette(const [
  const Color(const HexColor('#e0f7fa'), Color.light),
  const Color(const HexColor('#b2ebf2'), Color.light),
  const Color(const HexColor('#80deea'), Color.light),
  const Color(const HexColor('#4dd0e1'), Color.light),
  const Color(const HexColor('#26c6da'), Color.light),
  const Color(const HexColor('#00bcd4'), Color.dark),
  const Color(const HexColor('#00acc1'), Color.dark),
  const Color(const HexColor('#0097a7'), Color.dark),
  const Color(const HexColor('#00838f'), Color.dark),
  const Color(const HexColor('#006064'), Color.dark),
  const Color(const HexColor('#84ffff'), Color.light),
  const Color(const HexColor('#18ffff'), Color.light),
  const Color(const HexColor('#00e5ff'), Color.light),
  const Color(const HexColor('#00b8d4'), Color.light)
]);

const paletteTeal = const Palette(const [
  const Color(const HexColor('#e0f2f1'), Color.light),
  const Color(const HexColor('#b2dfdb'), Color.light),
  const Color(const HexColor('#80cbc4'), Color.light),
  const Color(const HexColor('#4db6ac'), Color.light),
  const Color(const HexColor('#26a69a'), Color.light),
  const Color(const HexColor('#009688'), Color.dark),
  const Color(const HexColor('#00897b'), Color.dark),
  const Color(const HexColor('#00796b'), Color.dark),
  const Color(const HexColor('#00695c'), Color.dark),
  const Color(const HexColor('#004d40'), Color.dark),
  const Color(const HexColor('#a7ffeb'), Color.light),
  const Color(const HexColor('#64ffda'), Color.light),
  const Color(const HexColor('#1de9b6'), Color.light),
  const Color(const HexColor('#00bfa5'), Color.light)
]);

const paletteGreen = const Palette(const [
  const Color(const HexColor('#e8f5e9'), Color.light),
  const Color(const HexColor('#c8e6c9'), Color.light),
  const Color(const HexColor('#a5d6a7'), Color.light),
  const Color(const HexColor('#81c784'), Color.light),
  const Color(const HexColor('#66bb6a'), Color.light),
  const Color(const HexColor('#4caf50'), Color.dark),
  const Color(const HexColor('#43a047'), Color.dark),
  const Color(const HexColor('#388e3c'), Color.dark),
  const Color(const HexColor('#2e7d32'), Color.dark),
  const Color(const HexColor('#1b5e20'), Color.dark),
  const Color(const HexColor('#b9f6ca'), Color.light),
  const Color(const HexColor('#69f0ae'), Color.light),
  const Color(const HexColor('#00e676'), Color.light),
  const Color(const HexColor('#00c853'), Color.light)
]);

const paletteLightGreen = const Palette(const [
  const Color(const HexColor('#f1f8e9'), Color.light),
  const Color(const HexColor('#dcedc8'), Color.light),
  const Color(const HexColor('#c5e1a5'), Color.light),
  const Color(const HexColor('#aed581'), Color.light),
  const Color(const HexColor('#9ccc65'), Color.light),
  const Color(const HexColor('#8bc34a'), Color.light),
  const Color(const HexColor('#7cb342'), Color.light),
  const Color(const HexColor('#689f38'), Color.light),
  const Color(const HexColor('#558b2f'), Color.dark),
  const Color(const HexColor('#33691e'), Color.dark),
  const Color(const HexColor('#ccff90'), Color.light),
  const Color(const HexColor('#b2ff59'), Color.light),
  const Color(const HexColor('#76ff03'), Color.light),
  const Color(const HexColor('#64dd17'), Color.light)
]);

const paletteLime = const Palette(const [
  const Color(const HexColor('#f9fbe7'), Color.light),
  const Color(const HexColor('#f0f4c3'), Color.light),
  const Color(const HexColor('#e6ee9c'), Color.light),
  const Color(const HexColor('#dce775'), Color.light),
  const Color(const HexColor('#d4e157'), Color.light),
  const Color(const HexColor('#cddc39'), Color.light),
  const Color(const HexColor('#c0ca33'), Color.light),
  const Color(const HexColor('#afb42b'), Color.light),
  const Color(const HexColor('#9e9d24'), Color.light),
  const Color(const HexColor('#827717'), Color.dark),
  const Color(const HexColor('#f4ff81'), Color.light),
  const Color(const HexColor('#eeff41'), Color.light),
  const Color(const HexColor('#c6ff00'), Color.light),
  const Color(const HexColor('#aeea00'), Color.light)
]);

const paletteYellow = const Palette(const [
  const Color(const HexColor('#fffde7'), Color.light),
  const Color(const HexColor('#fff9c4'), Color.light),
  const Color(const HexColor('#fff59d'), Color.light),
  const Color(const HexColor('#fff176'), Color.light),
  const Color(const HexColor('#ffee58'), Color.light),
  const Color(const HexColor('#ffeb3b'), Color.light),
  const Color(const HexColor('#fdd835'), Color.light),
  const Color(const HexColor('#fbc02d'), Color.light),
  const Color(const HexColor('#f9a825'), Color.light),
  const Color(const HexColor('#f57f17'), Color.light),
  const Color(const HexColor('#ffff8d'), Color.light),
  const Color(const HexColor('#ffff00'), Color.light),
  const Color(const HexColor('#ffea00'), Color.light),
  const Color(const HexColor('#ffd600'), Color.light)
]);

const paletteAmber = const Palette(const [
  const Color(const HexColor('#fff8e1'), Color.light),
  const Color(const HexColor('#ffecb3'), Color.light),
  const Color(const HexColor('#ffe082'), Color.light),
  const Color(const HexColor('#ffd54f'), Color.light),
  const Color(const HexColor('#ffca28'), Color.light),
  const Color(const HexColor('#ffc107'), Color.light),
  const Color(const HexColor('#ffb300'), Color.light),
  const Color(const HexColor('#ffa000'), Color.light),
  const Color(const HexColor('#ff8f00'), Color.light),
  const Color(const HexColor('#ff6f00'), Color.light),
  const Color(const HexColor('#ffe57f'), Color.light),
  const Color(const HexColor('#ffd740'), Color.light),
  const Color(const HexColor('#ffc400'), Color.light),
  const Color(const HexColor('#ffab00'), Color.light)
]);

const paletteOrange = const Palette(const [
  const Color(const HexColor('#fff3e0'), Color.light),
  const Color(const HexColor('#ffe0b2'), Color.light),
  const Color(const HexColor('#ffcc80'), Color.light),
  const Color(const HexColor('#ffb74d'), Color.light),
  const Color(const HexColor('#ffa726'), Color.light),
  const Color(const HexColor('#ff9800'), Color.light),
  const Color(const HexColor('#fb8c00'), Color.light),
  const Color(const HexColor('#f57c00'), Color.light),
  const Color(const HexColor('#ef6c00'), Color.dark),
  const Color(const HexColor('#e65100'), Color.dark),
  const Color(const HexColor('#ffd180'), Color.light),
  const Color(const HexColor('#ffab40'), Color.light),
  const Color(const HexColor('#ff9100'), Color.light),
  const Color(const HexColor('#ff6d00'), Color.light)
]);

const paletteDeepOrange = const Palette(const [
  const Color(const HexColor('#fbe9e7'), Color.light),
  const Color(const HexColor('#ffccbc'), Color.light),
  const Color(const HexColor('#ffab91'), Color.light),
  const Color(const HexColor('#ff8a65'), Color.light),
  const Color(const HexColor('#ff7043'), Color.light),
  const Color(const HexColor('#ff5722'), Color.dark),
  const Color(const HexColor('#f4511e'), Color.dark),
  const Color(const HexColor('#e64a19'), Color.dark),
  const Color(const HexColor('#d84315'), Color.dark),
  const Color(const HexColor('#bf360c'), Color.dark),
  const Color(const HexColor('#ff9e80'), Color.light),
  const Color(const HexColor('#ff6e40'), Color.light),
  const Color(const HexColor('#ff3d00'), Color.dark),
  const Color(const HexColor('#dd2c00'), Color.dark)
]);

const paletteBrown = const Palette(const [
  const Color(const HexColor('#efebe9'), Color.light),
  const Color(const HexColor('#d7ccc8'), Color.light),
  const Color(const HexColor('#bcaaa4'), Color.light),
  const Color(const HexColor('#a1887f'), Color.dark),
  const Color(const HexColor('#8d6e63'), Color.dark),
  const Color(const HexColor('#795548'), Color.dark),
  const Color(const HexColor('#6d4c41'), Color.dark),
  const Color(const HexColor('#5d4037'), Color.dark),
  const Color(const HexColor('#4e342e'), Color.dark),
  const Color(const HexColor('#3e2723'), Color.dark)
]);

const paletteGrey = const Palette(const [
  const Color(const HexColor('#fafafa'), Color.light),
  const Color(const HexColor('#f5f5f5'), Color.light),
  const Color(const HexColor('#eeeeee'), Color.light),
  const Color(const HexColor('#e0e0e0'), Color.light),
  const Color(const HexColor('#bdbdbd'), Color.light),
  const Color(const HexColor('#9e9e9e'), Color.light),
  const Color(const HexColor('#757575'), Color.dark),
  const Color(const HexColor('#616161'), Color.dark),
  const Color(const HexColor('#424242'), Color.dark),
  const Color(const HexColor('#212121'), Color.dark)
]);

const paletteBlueGrey = const Palette(const [
  const Color(const HexColor('#eceff1'), Color.light),
  const Color(const HexColor('#cfd8dc'), Color.light),
  const Color(const HexColor('#b0bec5'), Color.light),
  const Color(const HexColor('#90a4ae'), Color.light),
  const Color(const HexColor('#78909c'), Color.dark),
  const Color(const HexColor('#607d8b'), Color.dark),
  const Color(const HexColor('#546e7a'), Color.dark),
  const Color(const HexColor('#455a64'), Color.dark),
  const Color(const HexColor('#37474f'), Color.dark),
  const Color(const HexColor('#263238'), Color.dark)
]);

const black = const Color(const HexColor('#000000'), Color.dark);
const white = const Color(const HexColor('#ffffff'), Color.light);
