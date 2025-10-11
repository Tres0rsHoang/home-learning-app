import 'package:donuts_app/common/widgets/form/form_input_field.dart';
import 'package:donuts_app/core/themes/light_theme.dart';
import 'package:donuts_app/features/auth/data/datasources/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginForm extends StatefulWidget {
  final double height;
  const LoginForm({super.key, required this.height});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _loginData = LoginData();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        height: widget.height,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).dialogTheme.backgroundColor,
          borderRadius: borderRadius.copyWith(
            bottomLeft: Radius.zero,
            bottomRight: Radius.zero,
          ),
          border: Border(top: borderSide, left: borderSide, right: borderSide),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Login", style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(height: 20),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  FormInputField(
                    onSaved: (value) {
                      _loginData.username = value;
                    },
                    label: "Username",
                  ),
                  SizedBox(height: 20),
                  FormInputField(
                    type: FormInputFieldTypeEnum.password,
                    onSaved: (value) {
                      _loginData.password = value;
                    },
                    label: "Password",
                  ),
                  SizedBox(height: 10),
                  BlocBuilder<AuthCubit, AuthState>(
                    builder: (context, state) {
                      final authCubit = context.read<AuthCubit>();
                      return OutlinedButton(
                        onPressed: !state.isLoading
                            ? () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  authCubit.login(_loginData);
                                }
                              }
                            : null,
                        child: state.isLoading
                            ? LoadingAnimationWidget.progressiveDots(
                                color: Theme.of(context).hintColor,
                                size: 40,
                              )
                            : Text(
                                "Login",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
