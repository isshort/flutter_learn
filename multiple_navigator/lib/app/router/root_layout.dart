import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScaffoldWithNavBarItem extends BottomNavigationBarItem {
  const ScaffoldWithNavBarItem(
      {required this.initialLocation, required Widget icon, String? label})
      : super(icon: icon, label: label, backgroundColor: Colors.red);

  final String initialLocation;
}

const tabs = [
  ScaffoldWithNavBarItem(
      initialLocation: '/home', icon: Icon(Icons.home), label: 'Home'),
  ScaffoldWithNavBarItem(
      initialLocation: '/search', icon: Icon(Icons.search), label: 'Search'),
  ScaffoldWithNavBarItem(
      initialLocation: '/basket',
      icon: Icon(Icons.shopping_basket),
      label: 'Basket'),
  ScaffoldWithNavBarItem(
      initialLocation: '/profile', icon: Icon(Icons.person), label: 'profile'),
];

class ScaffoldWithBottomNavBar extends StatefulWidget {
  const ScaffoldWithBottomNavBar({Key? key, required this.child})
      : super(key: key);
  final Widget child;
  @override
  State<ScaffoldWithBottomNavBar> createState() =>
      _ScaffoldWithBottomNavBarState();
}

class _ScaffoldWithBottomNavBarState extends State<ScaffoldWithBottomNavBar> {
  int get _currentIndex => _locationToTabIndex(GoRouter.of(context).location);

  int _locationToTabIndex(String location) {
    final index = tabs
        .indexWhere((element) => location.startsWith(element.initialLocation));
    return index < 0 ? 0 : index;
  }

  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      context.go(tabs[tabIndex].initialLocation);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: tabs,
        onTap: (value) => _onItemTapped(context, value),
      ),
    );
  }
}
