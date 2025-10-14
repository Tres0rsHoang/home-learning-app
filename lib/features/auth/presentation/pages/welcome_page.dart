import 'package:donuts_app/core/utils/logger.dart';
import 'package:donuts_app/features/auth/data/datasources/auth_bloc.dart';
import 'package:donuts_app/features/auth/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoScale;
  late Animation<double> _logoPosition;
  late Animation<double> _formPosition;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _logoScale = Tween<double>(
      begin: 1,
      end: 0.5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final formHeight = size.height * 0.4;

    _logoPosition = Tween<double>(
      begin: 0,
      end: -size.height * 0.25,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _formPosition = Tween<double>(
      begin: formHeight,
      end: 0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Center(
              child: Transform.translate(
                offset: Offset(0, _logoPosition.value),
                child: Transform.scale(
                  scale: _logoScale.value,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        child: Image.asset('assets/images/donut_logo.png'),
                      ),
                      Text(
                        "Donuts",
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (context, state) {
                          if (state.isChecking) {
                            _controller.reverse();
                          } else {
                            _controller.forward();
                          }
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 600),
                            transitionBuilder: (child, animation) {
                              return FadeTransition(
                                opacity: animation,
                                child: child,
                              );
                            },
                            child: state.isChecking
                                ? LoadingAnimationWidget.progressiveDots(
                                    color: Theme.of(context).primaryColor,
                                    size: 70,
                                  )
                                : SizedBox(height: 70),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state.isAuthenticated) return SizedBox.shrink();
                return Transform.translate(
                  offset: Offset(
                    0,
                    _formPosition.value -
                        MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: LoginForm(height: formHeight),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
