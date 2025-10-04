import 'package:flutter/material.dart';

class TempletePage extends StatefulWidget {
  const TempletePage({super.key});

  @override
  State<TempletePage> createState() => _TempletePageState();
}

class _TempletePageState extends State<TempletePage> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Homepage"));
  }
}
