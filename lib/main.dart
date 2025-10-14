import 'package:donuts_app/common/widgets/bottom_navbar.dart';
import 'package:donuts_app/features/auth/data/datasources/auth_bloc.dart';
import 'package:donuts_app/features/auth/data/repositories/auth_repository_iml.dart';
import 'package:donuts_app/features/auth/presentation/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:donuts_app/common/widgets/widget_tree.dart';
import 'package:donuts_app/core/themes/dark_theme.dart';
import 'package:donuts_app/core/themes/light_theme.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const BaseApp());
}

ValueNotifier<ThemeMode> selectedTheme = ValueNotifier(ThemeMode.system);

class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedTheme,
      builder: (context, selectedTheme, child) {
        return MaterialApp(
          title: 'Donuts App',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: selectedTheme,
          debugShowCheckedModeBanner: false,
          home: BaseWidget(),
        );
      },
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
  final repo = AuthRepositoryIml();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(repo),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: AnimatedSwitcher(
              duration: const Duration(milliseconds: 600),
              transitionBuilder: (child, animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: state.isAuthenticated ? WidgetTree() : WelcomePage(),
            ),
            floatingActionButton: ValueListenableBuilder(
              valueListenable: selectedTheme,
              builder: (context, selected, child) {
                return FloatingActionButton(
                  onPressed: () {
                    selectedTheme.value = selectedTheme.value == ThemeMode.dark
                        ? ThemeMode.light
                        : ThemeMode.dark;
                  },
                  child: selected == ThemeMode.dark
                      ? Icon(Icons.brightness_2)
                      : Icon(Icons.brightness_5),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
