import 'package:flutter/material.dart';

class LoginEmailField extends StatelessWidget {
  final TextEditingController textEditingController;

  const LoginEmailField({
    required this.textEditingController, Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: const InputDecoration(
        labelText: 'Email',
      ),
    );
  }
}
