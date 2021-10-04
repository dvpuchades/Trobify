part of 'personal_info_bloc_bloc.dart';

@freezed
class PersonalInfoBlocState with _$PersonalInfoBlocState {
  const factory PersonalInfoBlocState({
    required String name,
    required String surname,
    required String email,
    required String phone,
    required bool saveChangesVisible,
    required String userImageRef,
    Image? userImage,
  }) = _PersonalInfoBlocState;

  factory PersonalInfoBlocState.initial() {
    var userData = User();
    return PersonalInfoBlocState(
      name: userData.getName(),
      surname: userData.getSurname(),
      email: userData.getEmail(),
      phone: userData.getPhone(),
      saveChangesVisible: false,
      userImageRef: '',
      userImage: userData.getImage(),
    );
  }
}
