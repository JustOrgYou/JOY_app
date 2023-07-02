import 'package:flutter/material.dart';
import 'package:todo_app/login/presentation/login_email_field.dart';
import 'package:todo_app/login/presentation/login_password_field.dart';
import 'package:todo_app/tasks_overview/tasks_overview.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool? isChecked;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String errorMessage = 'Invalid email or password.';

  Future<void> isCheckedAsync() async {
    if (email.text == 'asd@gmail.com' && password.text == '1234') {
      setState(() {
        isChecked = true;
      });

      // Navigate to a new screen when isChecked is true
      await Navigator.push<void>(
        context,
        MaterialPageRoute(
          builder: (context) => const TasksOverview(),
        ),
      );
    } else {
      setState(() {
        isChecked = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            LoginEmailField(
              textEditingController: email,
            ),
            LoginPasswordField(
              textEditingController: password,
            ),
            ElevatedButton(
              onPressed: isCheckedAsync,
              child: const Text('Log In'),
            ),
            if (isChecked == false) Text(errorMessage),
          ],
        ),
      ),
    );
  }
}
