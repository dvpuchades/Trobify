import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trobify/domain/core/i_auth_facade.dart';
import 'package:trobify/domain/entities/user.dart';
import 'package:trobify/infrastructure/core/firebase_auth_facade.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade = AuthFacade(firebaseAuth: auth.FirebaseAuth.instance);
  AuthBloc() : super(AuthState.initial());

  User userData = User();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(authCheckRequested: (e) async* {
      if (userData.getID() == '') {
        yield AuthState.unauthenticated();
      } else {
        yield AuthState.authenticated();
      }
    }, signedOut: (e) async* {
      _authFacade.signOut();
      yield AuthState.unauthenticated();
    });
  }
}
