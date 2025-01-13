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

  AppTheme({required this.selectColor})
      : assert(selectColor >= 0, 'selectec color mayor a 0'),
        assert(selectColor < colorList.length,'mejor a ${colorList.length}');

  ThemeData getTheme() => ThemeData(
        colorSchemeSeed: colorList[selectColor],
        appBarTheme: AppBarTheme(
          centerTitle: false,
        )
      );
}
