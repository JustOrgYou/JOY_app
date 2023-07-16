import 'package:flutter/material.dart';
import 'package:todo_app/generated/l10n.dart';


class LoginEmailField extends StatelessWidget {
  final TextEditingController textEditingController;

  const LoginEmailField({
    required this.textEditingController, Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: S.of(context).email,
      ),
    );
  }
}
