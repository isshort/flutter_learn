import 'package:flutter/material.dart';

class AdaptiveNavigation extends StatelessWidget {
  const AdaptiveNavigation(
      {Key? key,
      required this.child,
      required this.selectedIndex,
      required this.onDestinationSelected,
      required this.destinations})
      : super(key: key);
  final Widget child;
  final int selectedIndex;
  final void Function(int index) onDestinationSelected;
  final List<NavigationDestination> destinations;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        destinations: destinations,
        selectedIndex: selectedIndex,
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}
