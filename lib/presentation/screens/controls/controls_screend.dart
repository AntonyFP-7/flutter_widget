import 'package:flutter/material.dart';

class ControlsScreend extends StatelessWidget {
  static const name = 'controls_screend';
  const ControlsScreend({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UI Controls'),
      ),
      body: _ControlssView(),
    );
  }
}

class _ControlssView extends StatefulWidget {
  const _ControlssView();

  @override
  State<_ControlssView> createState() => _ControlssViewState();
}

enum Transportation { car, plane, boat, submarine }

class _ControlssViewState extends State<_ControlssView> {
  bool isDeveloper = true;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;
  Transportation selectTransportation = Transportation.car;
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer mode'),
          subtitle: const Text('Controles adicinales'),
          value: isDeveloper,
          onChanged: (value) {
            setState(() {
              isDeveloper = !isDeveloper;
            });
          },
        ),
        ExpansionTile(
          title: const Text('Vehiculo de transporte'),
          //subtitle: const Text('$selectTransportation'),
          children: [
            RadioListTile(
              title: const Text('by car'),
              subtitle: const Text('viajar por carro'),
              value: Transportation.car,
              groupValue: selectTransportation,
              onChanged: (value) => setState(() {
                selectTransportation = Transportation.car;
              }),
            ),
            RadioListTile(
              title: const Text('by boat'),
              subtitle: const Text('viajar por bote'),
              value: Transportation.boat,
              groupValue: selectTransportation,
              onChanged: (value) => setState(() {
                selectTransportation = Transportation.boat;
              }),
            ),
            RadioListTile(
              title: const Text('by plane'),
              subtitle: const Text('viajar por avion'),
              value: Transportation.plane,
              groupValue: selectTransportation,
              onChanged: (value) => setState(() {
                selectTransportation = Transportation.plane;
              }),
            ),
            RadioListTile(
              title: const Text('by submarine'),
              subtitle: const Text('viajar por submary'),
              value: Transportation.submarine,
              groupValue: selectTransportation,
              onChanged: (value) => setState(() {
                selectTransportation = Transportation.submarine;
              }),
            ),
          ],
        ),
        CheckboxListTile(
          title: const Text('¿Desayuno?'),
          value: wantsBreakfast,
          onChanged: (value) => setState(() {
            wantsBreakfast = !wantsBreakfast;
          }),
        ),
        CheckboxListTile(
          title: const Text('Almuerzo?'),
          value: wantsLunch,
          onChanged: (value) => setState(() {
            wantsLunch = !wantsLunch;
          }),
        ),
        CheckboxListTile(
          title: const Text('¿Cena?'),
          value: wantsDinner,
          onChanged: (value) => setState(() {
            wantsDinner = !wantsDinner;
          }),
        ),
      ],
    );
  }
}
