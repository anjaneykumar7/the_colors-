import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:the_colors/src/assets.dart';
import 'package:the_colors/src/color_model.dart';

class TheColors {
  final List<ColorModel> _colors = [];

  // get getAllColors => _colors["colors"];

  List<ColorModel> getColors() {
    List temp = jsonDecode(thecolors)["colors"];
    for (var element in temp) {
      _colors.add(ColorModel(
        HexColor(element["hex"]),
        element["name"],
        element["hex"],
      ));
    }

    return _colors;
  }

  getRandomColor() {
    List<dynamic> colors = jsonDecode(thecolors)["colors"];
    colors.shuffle();
    return colors.elementAt(0);
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }

    final hexNum = int.parse(hexColor, radix: 16);

    if (hexNum == 0) {
      return 0xff000000;
    }

    return hexNum;
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
