import 'package:flutter/material.dart';
import 'package:todo_app/generated/l10n.dart';


class LoginPasswordField extends StatelessWidget {
  final TextEditingController textEditingController;

  const LoginPasswordField({
    required this.textEditingController, Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: S.of(context).password,
      ),

    );
  }
}