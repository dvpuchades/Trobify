// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:trobify/infrastructure/core/firebase_auth_facade.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() {
  var _auth = MockFirebaseAuth();

  group('testing authtentification methods', () {
    test('Sign in', () async {
      var authFacade = AuthFacade(firebaseAuth: _auth);

      var result = await authFacade.signIn(LoginData(name: 'elarenas10@gmail.com', password: '123123'));

      expect(result, null);

      result = await authFacade.signIn(LoginData(name: 'elarenas10@gmail.com', password: '123'));

      expect(result, null);
    });

    test('Register', () async {
      var authFacade = AuthFacade(firebaseAuth: _auth);

      var result = await authFacade.registerUser(LoginData(name: 'elarenas10@gmail.com', password: '123123'));

      expect(result, null);
    });
  });
}
