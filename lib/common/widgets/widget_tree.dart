import 'package:flutter/material.dart';
import 'package:managment_app/common/widgets/bottom_navbar.dart';
import 'package:managment_app/features/home/presentation/pages/home_page.dart';
import 'package:managment_app/features/profile/presentation/pages/profile_page.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedTabNotifier,
      builder: (context, selectedTab, child) {
        return pages.elementAt(selectedTab);
      },
    );
  }
}
