import 'package:flutter/material.dart';

enum FormInputFieldTypeEnum { text, email, password }

class FormInputField extends StatelessWidget {
  final String? label;
  final FormInputFieldTypeEnum type;
  final FormFieldSetter<String?> onSaved;
  final bool required;

  const FormInputField({
    super.key,
    this.label,
    required this.onSaved,
    this.required = true,
    this.type = FormInputFieldTypeEnum.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: type == FormInputFieldTypeEnum.password,
      decoration: InputDecoration(
        labelText: "$label ${required ? "" : "(Optional)"}",
      ),
      validator: (String? value) {
        if (required && (value == null || value == "")) {
          return 'Field is required';
        }
        if (type == FormInputFieldTypeEnum.email) {
          return value == null || !value.contains('@') ? 'Invalid Email' : null;
        }
        if (type == FormInputFieldTypeEnum.password) {
          return value == null || value.length < 5 ? 'Ivalid Password' : null;
        }
        return null;
      },
      onSaved: onSaved,
    );
  }
}
