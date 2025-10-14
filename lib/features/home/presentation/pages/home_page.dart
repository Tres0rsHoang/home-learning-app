import 'package:donuts_app/core/themes/light_theme.dart';
import 'package:donuts_app/features/home/presentation/widgets/mini_app.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<MiniAppData> miniApps = [
    MiniAppData(icon: 'icon', name: 'Learning'),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: Container(
        height: size.height * 0.8,
        width: size.width * 0.9,
        decoration: BoxDecoration(
          border: BoxBorder.all(width: 2),
          borderRadius: borderRadius,
          color: Theme.of(context).cardColor,
        ),
      ),
    );
  }
}
