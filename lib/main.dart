import 'package:flutter/material.dart';
import 'package:widget_app/config/theme/app_theme.dart';
import 'package:widget_app/presentation/buttons/buttons_screen.dart';
import 'package:widget_app/presentation/cards/cards_screen.dart';
import 'package:widget_app/presentation/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(selectColor: 0).getTheme(),
      home: HomeScreen(),
      routes: {
        '/buttons': (context) => ButtonsScreen(),
        '/cards': (context) => CardsScreen(),
      },
    );
  }
}
