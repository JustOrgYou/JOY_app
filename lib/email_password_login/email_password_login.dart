import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/auth_service/auth_providers.dart';
import 'package:todo_app/email_password_login/presentation/login_email_field.dart';
import 'package:todo_app/email_password_login/presentation/login_password_field.dart';
import 'package:todo_app/tasks_overview/tasks_overview.dart';
import 'package:todo_app/generated/l10n.dart';


class EmailPasswordLogin extends ConsumerStatefulWidget {
  const EmailPasswordLogin({Key? key}) : super(key: key);

  @override
  _EmailPasswordLoginState createState() => _EmailPasswordLoginState();
}

class _EmailPasswordLoginState extends ConsumerState<EmailPasswordLogin> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  String errorMessage = '';

  Future<void> validateCredentials() async {
    final authService = ref.watch(authServiceProvider);
    final authenticated = await authService.authenticate(email.text, password.text);
    if (!ref.context.mounted) return;
    if (authenticated) {
      // ignore: use_build_context_synchronously
<<<<<<< Updated upstream
      Navigator.pop(ref.context);
      // ignore: use_build_context_synchronously
      await Navigator.push<void>(
=======
      await Navigator.pushReplacement<void, void>(
>>>>>>> Stashed changes
        ref.context,
        MaterialPageRoute(
          builder: (context) => const TasksOverview(),
        ),
      );
    } else {
      setState(() {
<<<<<<< Updated upstream
        errorMessage = 'Invalid email or password.';
=======
        errorMessage = S.of(context).error_msg;
>>>>>>> Stashed changes
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
              onPressed: validateCredentials,
<<<<<<< Updated upstream
              child: const Text('Log In'),
=======
              child: Text(S.of(context).log_in),
>>>>>>> Stashed changes
            ),
            if (errorMessage.isNotEmpty)
              Text(
                errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
