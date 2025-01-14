import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  MenuItems(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

List<MenuItems> appMenuItems = [
  MenuItems(
      title: 'Botones',
      subTitle: 'Varios botones flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItems(
      title: 'Tarjetas',
      subTitle: 'Varios botones flutter',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItems(
      title: 'Progress Indicators',
      subTitle: 'Generañes y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItems(
      title: 'Snackbars y dialogos',
      subTitle: 'indicadores en pantalla',
      link: '/snackbars',
      icon: Icons.info_outline),
  MenuItems(
      title: 'Animated container',
      subTitle: 'StateFulWidget animado',
      link: '/animated',
      icon: Icons.check_box_outlined),
  MenuItems(
      title: 'iu controls',
      subTitle: 'Una seria de flutter ',
      link: '/ui-controls',
      icon: Icons.car_rental_outlined),
  MenuItems(
      title: 'Introduccion a la aplicacion',
      subTitle: 'Tutoria introductorio',
      link: '/tutorial',
      icon: Icons.accessibility_rounded),
  MenuItems(
      title: 'Infinite scroll y Pull',
      subTitle: 'Listas infinitas',
      link: '/infinite',
      icon: Icons.list_alt_rounded),
];
