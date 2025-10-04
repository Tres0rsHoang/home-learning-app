import 'package:flutter/material.dart';

ValueNotifier<int> selectedTabNotifier = ValueNotifier(0);

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedTabNotifier,
      builder: (context, selectedTab, child) {
        return BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "User"),
          ],
          onTap: (newIndex) {
            selectedTabNotifier.value = newIndex;
          },
          currentIndex: selectedTab,
        );
      },
    );
  }
}
