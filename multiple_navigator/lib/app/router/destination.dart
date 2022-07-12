import 'package:flutter/material.dart';

const List<NavigationDestination> destinations = [
  NavigationDestination(
    label: 'Home',
    icon: Icon(Icons.home),
    route: '/',
  ),
  NavigationDestination(
    label: 'Search',
    icon: Icon(Icons.search),
    route: '/search',
  ),
  NavigationDestination(
    label: 'Basket',
    icon: Icon(Icons.shopping_basket_outlined),
    route: '/basket',
  ),
  NavigationDestination(
    label: 'Profile',
    icon: Icon(Icons.person),
    route: '/profile',
  ),
];

class NavigationDestination {
  const NavigationDestination({
    required this.route,
    required this.label,
    required this.icon,
    this.child,
  });

  final String route;
  final String label;
  final Icon icon;
  final Widget? child;
}
