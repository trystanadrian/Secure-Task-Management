import 'dart:math';
import 'dart:ui';

class Colours {
  const Colours._();

  static const Color darkBackground = Color(0xffffffff);
  static const Color light = Color(0xFF00A9FF);
  static const Color red = Color(0xffd80000);
  static const Color lightBlue = Color(0xFF00244F);
  static const Color darkGrey = Color(0xFF89CFF3);
  static const Color lightGrey = Color(0xFFA0E9FF);
  static const Color green = Color(0xFF65B741);
  static const Color yellow = Color(0xFFFF9800);
  static const Color lightBackground = Color(0xFF00244F);
  static const Color greyBackground = Color(0xFFCDF5FD);

  static const colours = [
    red,
    lightBlue,
    Color(0xFFF50FCF),
    Color(0xFFAC0FF5),
    green,
    yellow,
  ];

  static Color randomColour() {
    final random = Random();
    int randomIndex = random.nextInt(Colours.colours.length);
    return Colours.colours[randomIndex];
  }
}
