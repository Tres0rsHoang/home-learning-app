import 'package:flutter/material.dart';

enum FormInputFieldTypeEnum { text, email, password }

class FormInputField extends StatelessWidget {
  final String? label;
  final FormInputFieldTypeEnum type;
  final FormFieldSetter<String?> onSaved;

  const FormInputField({
    super.key,
    this.label,
    required this.onSaved,
    this.type = FormInputFieldTypeEnum.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: type == FormInputFieldTypeEnum.password,
      decoration: InputDecoration(labelText: label),
      validator: (value) {
        if (type == FormInputFieldTypeEnum.email) {
          return value == null || !value.contains('@') ? 'Invalid Email' : null;
        }
        if (type == FormInputFieldTypeEnum.password) {
          return value == null || value.length < 6 ? 'Ivalid Password' : null;
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
