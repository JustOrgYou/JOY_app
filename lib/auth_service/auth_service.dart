abstract class AuthService {
  Future<bool> authenticate(String email, String password);
}