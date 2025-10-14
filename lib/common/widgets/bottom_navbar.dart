import 'package:flutter/material.dart';

ValueNotifier<int> selectedTabNotifier = ValueNotifier(0);

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedTabNotifier,
      builder: (context, selectedTab, child) {
        return NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.person), label: "User"),
          ],
          onDestinationSelected: (newIndex) {
            selectedTabNotifier.value = newIndex;
          },
          selectedIndex: selectedTab,
        );
      },
    );
  }
}
