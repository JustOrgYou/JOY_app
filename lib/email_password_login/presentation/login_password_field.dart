import 'package:flutter/material.dart';

class LoginPasswordField extends StatelessWidget {
  final TextEditingController textEditingController;

  const LoginPasswordField({
    required this.textEditingController, Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: const InputDecoration(
        labelText: 'Password',

      ),

    );
  }
}