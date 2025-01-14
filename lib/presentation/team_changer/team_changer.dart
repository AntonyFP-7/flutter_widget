import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widget_app/presentation/providers/team_provider.dart';

class TeamChanger extends ConsumerWidget {
  static String name = "team_changer";
  const TeamChanger({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('theme Changer'),
        actions: [
          IconButton(
              icon: Icon(isDarkMode
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined),
              onPressed: () {
                /* ref.read(isDarkModeProvider.notifier).state = !ref.read(isDarkModeProvider.notifier).state; */
                ref.read(isDarkModeProvider.notifier).update((value) => !value);
              }),
        ],
      ),
      body: _ThemeChengerView(),
    );
  }
}

class _ThemeChengerView extends ConsumerWidget {
  const _ThemeChengerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorsProvider);
    final int selectColor = ref.watch(selectedColorProvider);
    return ListView.builder(
      itemCount: colors.length,
      itemBuilder: (context, index) {
        final Color color = colors[index];
        return RadioListTile(
          title: Text(
            'Este color',
            style: TextStyle(color: color),
          ),
          subtitle: Text('${color.hashCode}'),
          activeColor: color,
          value: index,
          groupValue: selectColor,
          onChanged: (value) {
            /* ref
                .read(selectedColorProvider.notifier)
                .update((item) => value ?? 0); */
            ref.read(selectedColorProvider.notifier).state = value ?? 0;
          },
        );
      },
    );
  }
}
