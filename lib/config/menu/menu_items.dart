import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItems({
    required this.title,
    required this.subTitle,
    required this.link,
    required this.icon,
  });
}

const appMenuItems = <MenuItems>[
  MenuItems(
    title: 'Meals',
    subTitle: 'Select your favorite category',
    link: '/meals',
    icon: Icons.restaurant_menu_outlined,
  ),
  MenuItems(
    title: 'Filters',
    subTitle: 'Search your favorite meal',
    link: '/filters',
    icon: Icons.filter_1_outlined,
  ),
];
