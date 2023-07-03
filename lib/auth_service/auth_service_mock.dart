import 'package:todo_app/auth_service/auth_service.dart';

class AuthServiceMock implements AuthService {
  @override
  Future<bool> authenticate(String email, String password) async {
    return email == 'asd@gmail.com' && password == '1234';
  }
}