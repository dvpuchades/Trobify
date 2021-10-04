import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/flutter_login.dart';

abstract class IAuthFacade {
  Future<String?> registerUser(LoginData data);

  Future<String?> signIn(LoginData data);

  Future<String?> recoverPassword(String recoveryEmail);

  User? getUserAuth();

  void signOut();
}
