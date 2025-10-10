import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/donut_logo.png',
            width: 200,
            fit: BoxFit.cover,
          ),
          Text("Donuts", style: Theme.of(context).textTheme.titleLarge),
          LoadingAnimationWidget.progressiveDots(
            color: Theme.of(context).primaryColor,
            size: 70,
          ),
        ],
      ),
    );
  }
}
