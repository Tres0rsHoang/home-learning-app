import 'package:flutter/material.dart';
import 'package:managment_app/common/widgets/bottom_navbar.dart';
import 'package:managment_app/common/widgets/widget_tree.dart';
import 'package:managment_app/core/themes/dark_theme.dart';
import 'package:managment_app/core/themes/light_theme.dart';

void main() {
  runApp(const BaseApp());
}

class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home Server Management',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: BaseWidget(),
    );
  }
}

class BaseWidget extends StatefulWidget {
  const BaseWidget({super.key});

  @override
  State<BaseWidget> createState() => _BaseWidgetState();
}

class _BaseWidgetState extends State<BaseWidget> {
  int selectedItem = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Server Management")),
      body: WidgetTree(),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
