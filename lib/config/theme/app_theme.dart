import 'package:flutter/material.dart';

const List<Color> colorList = [
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {
  final int selectColor;
  final bool isDarkMode;

  AppTheme({required this.selectColor, this.isDarkMode = false})
      : assert(selectColor >= 0, 'selectec color mayor a 0'),
        assert(selectColor < colorList.length, 'mejor a ${colorList.length}');

  ThemeData getTheme() => ThemeData(
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      colorSchemeSeed: colorList[selectColor],
      appBarTheme: AppBarTheme(
        centerTitle: false,
      ));
}
