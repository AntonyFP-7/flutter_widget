import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreend extends StatelessWidget {
  static const name = 'snackbar_screend';
  const SnackbarScreend({super.key});
  void showCustomeSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    final snackbar = SnackBar(
      content: Text('Hola mundo'),
      action: SnackBarAction(
        label: "Ok",
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: Text('¿Estas seguro?'),
        content: Text(
            'Aliquip ad laboris voluptate duis magna. Quis amet sit dolor irure. Ea enim laborum sint adipisicing commodo excepteur ea occaecat ipsum et in mollit incididunt excepteur. Cillum elit veniam in ullamco aute.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: Text('Aceptar'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(
                  context: context,
                  applicationName: 'Flutter',
                  applicationVersion: '1.0.0',
                  applicationIcon: const Icon(Icons.info),
                  children: const [
                    Text(
                        'Deserunt ad excepteur voluptate nisi exercitation tempor nisi eu. Velit non ipsum non culpa et do exercitation. Anim esse aute nostrud ea proident in. Tempor consequat officia voluptate do laborum consectetur nisi cillum eu esse sit nisi.'),
                  ],
                );
              },
              child: Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context),
              child: Text('Mostrar dialo de pantalla'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text('Mostrar snackbar'),
        icon: Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomeSnackbar(context),
      ),
    );
  }
}
