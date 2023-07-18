import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/auth_service/auth_service.dart';
import 'package:todo_app/auth_service/auth_service_mock.dart';

final authServiceProvider = Provider<AuthService>(
  (ref) => AuthServiceMock(),
);

