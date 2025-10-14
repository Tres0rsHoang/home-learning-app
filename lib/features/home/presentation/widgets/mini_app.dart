import 'package:flutter/material.dart';

class MiniAppData {
  String icon;
  String name;

  MiniAppData({required this.icon, required this.name});
}

class MiniApp extends StatelessWidget {
  final MiniAppData miniApp;

  const MiniApp({super.key, required this.miniApp});

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(child: Column(children: [

          ],
        )),
    );
  }
}
