import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  static const name = 'animated_screend';
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50;
  double height = 50;
  Color colors = Colors.indigo;
  double borderRadius = 10.0;
  void changeShape() {
    setState(() {
      final randon = Random();
      width = randon.nextInt(300) + 120;
      height = randon.nextInt(300) + 120;
      colors = Colors.indigo;
      borderRadius = randon.nextInt(100) + 20;
      colors = Color.fromRGBO(
          randon.nextInt(255), //red
          randon.nextInt(255), //green
          randon.nextInt(255), //blue
          1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          //curve: Curves.easeOutCubic,
          //curve: Curves.bounceOut,
          curve: Curves.elasticOut,
          width: width <= 0 ? 0 : width,
          height: height <= 0 ? 0 : height,
          decoration: BoxDecoration(
            color: colors,
            borderRadius:
                BorderRadius.circular(borderRadius < 0 ? 0 : borderRadius),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
