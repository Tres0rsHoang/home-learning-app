import 'package:flutter/material.dart';

ValueNotifier<bool> globalLoading = ValueNotifier(false);

class GlobalLoading extends StatefulWidget {
  final Widget? child;
  const GlobalLoading({super.key, this.child});

  @override
  State<GlobalLoading> createState() => _GlobalLoadingState();
}

class _GlobalLoadingState extends State<GlobalLoading> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
