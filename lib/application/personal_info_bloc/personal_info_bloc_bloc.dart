import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trobify/domain/entities/user.dart';
import 'package:trobify/infrastructure/core/firebase_user.dart';

part 'personal_info_bloc_event.dart';
part 'personal_info_bloc_state.dart';
part 'personal_info_bloc_bloc.freezed.dart';

class PersonalInfoBlocBloc extends Bloc<PersonalInfoBlocEvent, PersonalInfoBlocState> {
  PersonalInfoBlocBloc() : super(PersonalInfoBlocState.initial());

  User userData = User();

  @override
  Stream<PersonalInfoBlocState> mapEventToState(
    PersonalInfoBlocEvent event,
  ) async* {
    yield* event.map(
      nameChanged: (e) async* {
        yield state.copyWith(
          name: e.nameStr,
          saveChangesVisible: true,
        );
      },
      surnameChanged: (e) async* {
        yield state.copyWith(
          surname: e.surnameStr,
          saveChangesVisible: true,
        );
      },
      emailChanged: (e) async* {
        yield state.copyWith(
          email: e.emailStr,
          saveChangesVisible: true,
        );
      },
      phoneChanged: (e) async* {
        yield state.copyWith(
          phone: e.phoneStr,
          saveChangesVisible: true,
        );
      },
      submitChanges: (e) async* {
        userData.setEmail(state.email);
        userData.setSurname(state.surname);
        userData.setName(state.name);
        userData.setPhone(state.phone);
        userData.setImage(state.userImage);

        await FirebaseUser(firestore: FirebaseFirestore.instance).updateUserOnDB();

        yield state.copyWith(
          saveChangesVisible: false,
        );
      },
      photoChanged: (e) async* {
        yield state.copyWith(
          userImage: e.photo,
          saveChangesVisible: true,
        );
      },
    );
  }
}
