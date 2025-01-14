import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(
      {required this.title, required this.caption, required this.imageUrl});
}

final slides = <SlideInfo>[
  SlideInfo(
      title: 'Busca la comida',
      caption: 'Do eiusmod deserunt cillum pariatur qui.',
      imageUrl: 'assets/images/1.png'),
  SlideInfo(
      title: 'Entrega rapida',
      caption:
          'Incididunt velit voluptate aute fugiat proident mollit voluptate ullamco.',
      imageUrl: 'assets/images/2.png'),
  SlideInfo(
      title: 'Disfruta la comida',
      caption:
          'Minim amet aliqua aute et ullamco amet voluptate incididunt laborum.',
      imageUrl: 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'app_tutorial_screend';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  //late final PageController pageViewController;
  final PageController pageViewController = PageController();
  bool endReache = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (page >= slides.length - 1.5 && !endReache) {
        setState(() {
          endReache = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map(
                  (slideData) => _Slide(
                      slideData.title, slideData.caption, slideData.imageUrl),
                )
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              onPressed: () => context.pop(),
              child: Text('Salir'),
            ),
          ),
          if (endReache)
            Positioned(
              bottom: 30,
              right: 30,
              child: FadeInRight(
                from: 15,
                delay: const Duration(seconds: 1),
                child: FilledButton(
                  onPressed: () => context.pop(),
                  child: Text('Empezar'),
                ),
              ),
            )
        ],
      ),
    );
  }
}

class _Slide extends StatefulWidget {
  final String title;
  final String caption;
  final String imageUrl;
  const _Slide(this.title, this.caption, this.imageUrl);

  @override
  State<_Slide> createState() => _SlideState();
}

class _SlideState extends State<_Slide> {
  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.imageUrl),
            //Image(image: AssetImage(widget.imageUrl)),
            const SizedBox(height: 20),
            Text(widget.title, style: titleStyle),
            const SizedBox(height: 10),
            Text(
              widget.caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
