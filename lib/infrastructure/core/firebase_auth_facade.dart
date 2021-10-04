import 'package:firebase_auth/firebase_auth.dart';

import 'package:trobify/domain/entities/user.dart' as model;
import 'package:flutter_login/src/models/login_data.dart';
import 'package:trobify/domain/core/i_auth_facade.dart';

class AuthFacade extends IAuthFacade {
  late FirebaseAuth firebaseAuth;

  AuthFacade({
    required this.firebaseAuth,
  });

  @override
  Future<String?> registerUser(LoginData data) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: data.name,
        password: data.password,
      );

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'Este correo ya esta en uso';
      } else if (e.code == 'weak-password') {
        return 'Contraseña muy débil: la contraseña debe contener al menos 6 carácteres';
      } else {
        return 'Error inesperado, por favor intenta de nuevo';
      }
    }
  }

  @override
  Future<String?> recoverPassword(String recoveryEmail) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: recoveryEmail);
      return null;
    } on FirebaseAuthException {
      return 'Este correo no pertenece a ninguna cuenta.';
    }
  }

  @override
  Future<String?> signIn(LoginData data) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: data.name,
        password: data.password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password' || e.code == 'user-not-found') {
        return 'Correo o contraseña invalidos';
      } else {
        return 'Error inesperado, por favor intenta de nuevo';
      }
    }
  }

  @override
  void signOut() {
    firebaseAuth.signOut();
    model.User().clear();
  }

  @override
  User? getUserAuth() {
    return firebaseAuth.currentUser;
  }
}
