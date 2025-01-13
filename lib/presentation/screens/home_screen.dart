import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widget_app/config/menu/menu_items.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter + Material 3'),
      ),
      body: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //para quitar o agregar scrrol
      //physics: const BouncingScrollPhysics(),
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final menu = appMenuItems[index];
        return _CustomListTitle(menu: menu);
      },
    );
  }
}

class _CustomListTitle extends StatelessWidget {
  const _CustomListTitle({
    required this.menu,
  });

  final MenuItems menu;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ListTile(
      leading: Icon(
        menu.icon,
        color: colors.primary,
      ),
      trailing: Icon(Icons.arrow_forward_ios_rounded),
      title: Text(menu.title),
      subtitle: Text(menu.subTitle),
      onTap: () {
        /* Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ButtonsScreen(),
          ),
        ); */
        //Navigator.pushNamed(context, menu.link);
        context.push(menu.link);
      },
    );
  }
}
