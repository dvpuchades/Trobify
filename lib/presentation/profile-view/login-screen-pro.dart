import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trobify/application/auth/auth_bloc.dart';
import 'package:trobify/domain/core/i_auth_facade.dart';
import 'package:trobify/infrastructure/core/firebase_auth_facade.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:trobify/infrastructure/core/firebase_user.dart';
import 'package:trobify/presentation/core/constants.dart';

class LoginScreenPro extends StatefulWidget {
  @override
  _LoginScreenProState createState() => _LoginScreenProState();
}

class _LoginScreenProState extends State<LoginScreenPro> {
  final GlobalKey login = GlobalKey();

  final IAuthFacade _authFacade = AuthFacade(firebaseAuth: FirebaseAuth.instance);
  final _userFacade = FirebaseUser(firestore: FirebaseFirestore.instance);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {},
      builder: (context, state) => Center(
        child: FlutterLogin(
          key: login,
          logo: 'assets/images/logo2.png',
          title: '',
          messages: LoginMessages(
            usernameHint: 'Email',
            passwordHint: 'Contraseña',
            confirmPasswordHint: 'Confirmar constraseña',
            forgotPasswordButton: 'Recordar contraseña',
            loginButton: 'INICIAR SESION',
            signupButton: 'REGISTRARSE',
            recoverPasswordButton: 'ENVIAR',
            recoverPasswordIntro: 'Recordar contraseña',
            recoverPasswordDescription: 'Le enviaremos sus datos de inicio de sesión a este correo',
            goBackButton: 'ATRÁS',
            confirmPasswordError: 'Las constraseñas no coinciden',
            recoverPasswordSuccess: 'Constraseña restaurada con éxito',
          ),
          theme: LoginTheme(
            primaryColor: trobifyColor[1],
            accentColor: trobifyColor,
            cardTheme: CardTheme(
              elevation: 8,
              shadowColor: trobifyColor[2],
            ),
            bodyStyle: Body1TextStyle,
            buttonStyle: TextStyle(color: Colors.white),
            inputTheme: InputDecorationTheme(
              labelStyle: Body1TextStyle,
              hintStyle: Body1TextStyle,
              helperStyle: Body2TextStyle,
            ),
            buttonTheme: LoginButtonTheme(
              backgroundColor: trobifyColor[3],
              elevation: 4,
            ),
          ),
          onLogin: (data) async {
            var res = await _authFacade.signIn(data);
            _userFacade.getUserFromDB();
            return res;
          },
          onSignup: (data) async {
            var res = await _authFacade.registerUser(data);
            if (res == null) {
              _userFacade.createUser(FirebaseAuth.instance.currentUser!);

              _userFacade.getUserFromDB();
            }
            return res;
          },
          onRecoverPassword: _authFacade.recoverPassword,
          onSubmitAnimationCompleted: () {
            context.read<AuthBloc>().add(AuthEvent.authCheckRequested());
          },
        ),
      ),
    );
  }
}
