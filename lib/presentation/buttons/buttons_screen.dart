import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screend';

  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.pop();
        },
        child: Icon(Icons.arrow_back_ios_new_rounded),
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          //crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text('Elevated button'),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text('Elevated disabled'),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              label: Text('Elevated icon'),
              icon: Icon(Icons.access_alarm_rounded),
            ),
            FilledButton(onPressed: () {}, child: Text('filled')),
            FilledButton.icon(
              onPressed: () {},
              icon: Icon(Icons.access_alarm_rounded),
              label: Text('filled icon'),
            ),
            OutlinedButton(onPressed: () {}, child: Text('outkend')),
            OutlinedButton.icon(
              onPressed: () {},
              label: Text('CON ICONO'),
              icon: Icon(Icons.import_contacts_rounded),
            ),
            TextButton(onPressed: () {}, child: Text('text button')),
            TextButton.icon(
              onPressed: () {},
              label: Text('text button icon'),
              icon: Icon(Icons.account_balance_rounded),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.add_box)),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add_box),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(colors.primary),
              ),
            ),
            CustomButton(),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatefulWidget {
  const CustomButton({super.key});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return ClipRect(
      child: Material(
        borderRadius: BorderRadius.circular(20),
        color: colors.primary,
        child: InkWell(
          onTap: (){
            
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              'Hola mundo',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
