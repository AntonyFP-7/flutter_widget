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
      title: 'ProgressIndicators',
      subTitle: 'Generañes y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
];
