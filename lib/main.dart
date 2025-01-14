import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/config/router/app_router.dart';
import 'package:widget_app/config/theme/app_theme.dart';
import 'package:widget_app/presentation/providers/team_provider.dart';

void main() {
  runApp(ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(isDarkModeProvider);
    final int selectColor = ref.watch(selectedColorProvider);
    return MaterialApp.router(
      title: 'Flutter widget',
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme:
          AppTheme(selectColor: selectColor, isDarkMode: isDarkMode).getTheme(),
    );
  }
}
