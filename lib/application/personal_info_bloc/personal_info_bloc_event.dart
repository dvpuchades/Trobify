part of 'personal_info_bloc_bloc.dart';

@freezed
class PersonalInfoBlocEvent with _$PersonalInfoBlocEvent {
  const factory PersonalInfoBlocEvent.nameChanged(String nameStr) = NameChanged;
  const factory PersonalInfoBlocEvent.surnameChanged(String surnameStr) = SurnameChanged;
  const factory PersonalInfoBlocEvent.emailChanged(String emailStr) = EmailChanged;
  const factory PersonalInfoBlocEvent.phoneChanged(String phoneStr) = PhoneChanged;
  const factory PersonalInfoBlocEvent.photoChanged(Image photo) = PhotoChanged;
  const factory PersonalInfoBlocEvent.submitChanges() = SubmitChanges;
}
