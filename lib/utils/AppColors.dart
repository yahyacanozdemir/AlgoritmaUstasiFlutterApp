import 'dart:ui';

class AppColors {

  static Color Prussian_Blue = getColorFromHex("#1C404C");
  static Color Dark_Sea_Green = getColorFromHex("#2D8077");
  static Color White_Chocolate = getColorFromHex("#F4D9AE");
  static Color Dark_Coral = getColorFromHex("#CD4F41");
  static Color Jasper_Orange  = getColorFromHex("#DE9E46");
  static Color Jacarta  = getColorFromHex("#353458");
  static Color Garnet  = getColorFromHex("#7C3A2F");
  static Color Aztec_Gold  = getColorFromHex("#D19D4F");
  static Color Soldier_Green  = getColorFromHex("#545932");
  static Color Terra_Cotta  = getColorFromHex("#DE6960");
  static Color Topaz  = getColorFromHex("#F4C87C");
  static Color Oxley  = getColorFromHex("#6DA06E");
  static Color Isabelline  = getColorFromHex("#F3F3EB");
  static Color Light_Taupe  = getColorFromHex("#B18E73");
  static Color Pearl_Aqua  = getColorFromHex("#75CAC3");
  static Color Black_Olive  = getColorFromHex("#3A3A38");
  static Color Dark_Electric_Blue  = getColorFromHex("#596D86");
  static Color Pearl  = getColorFromHex("#F2E3C4");



  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');

    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return Color(int.parse(hexColor, radix: 16));
  }

}