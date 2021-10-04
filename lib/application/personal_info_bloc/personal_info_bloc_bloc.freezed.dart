// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'personal_info_bloc_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PersonalInfoBlocEventTearOff {
  const _$PersonalInfoBlocEventTearOff();

  NameChanged nameChanged(String nameStr) {
    return NameChanged(
      nameStr,
    );
  }

  SurnameChanged surnameChanged(String surnameStr) {
    return SurnameChanged(
      surnameStr,
    );
  }

  EmailChanged emailChanged(String emailStr) {
    return EmailChanged(
      emailStr,
    );
  }

  PhoneChanged phoneChanged(String phoneStr) {
    return PhoneChanged(
      phoneStr,
    );
  }

  PhotoChanged photoChanged(Image photo) {
    return PhotoChanged(
      photo,
    );
  }

  SubmitChanges submitChanges() {
    return const SubmitChanges();
  }
}

/// @nodoc
const $PersonalInfoBlocEvent = _$PersonalInfoBlocEventTearOff();

/// @nodoc
mixin _$PersonalInfoBlocEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String nameStr) nameChanged,
    required TResult Function(String surnameStr) surnameChanged,
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(String phoneStr) phoneChanged,
    required TResult Function(Image photo) photoChanged,
    required TResult Function() submitChanges,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String nameStr)? nameChanged,
    TResult Function(String surnameStr)? surnameChanged,
    TResult Function(String emailStr)? emailChanged,
    TResult Function(String phoneStr)? phoneChanged,
    TResult Function(Image photo)? photoChanged,
    TResult Function()? submitChanges,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(SurnameChanged value) surnameChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PhoneChanged value) phoneChanged,
    required TResult Function(PhotoChanged value) photoChanged,
    required TResult Function(SubmitChanges value) submitChanges,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(SurnameChanged value)? surnameChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(PhotoChanged value)? photoChanged,
    TResult Function(SubmitChanges value)? submitChanges,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalInfoBlocEventCopyWith<$Res> {
  factory $PersonalInfoBlocEventCopyWith(PersonalInfoBlocEvent value,
          $Res Function(PersonalInfoBlocEvent) then) =
      _$PersonalInfoBlocEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PersonalInfoBlocEventCopyWithImpl<$Res>
    implements $PersonalInfoBlocEventCopyWith<$Res> {
  _$PersonalInfoBlocEventCopyWithImpl(this._value, this._then);

  final PersonalInfoBlocEvent _value;
  // ignore: unused_field
  final $Res Function(PersonalInfoBlocEvent) _then;
}

/// @nodoc
abstract class $NameChangedCopyWith<$Res> {
  factory $NameChangedCopyWith(
          NameChanged value, $Res Function(NameChanged) then) =
      _$NameChangedCopyWithImpl<$Res>;
  $Res call({String nameStr});
}

/// @nodoc
class _$NameChangedCopyWithImpl<$Res>
    extends _$PersonalInfoBlocEventCopyWithImpl<$Res>
    implements $NameChangedCopyWith<$Res> {
  _$NameChangedCopyWithImpl(
      NameChanged _value, $Res Function(NameChanged) _then)
      : super(_value, (v) => _then(v as NameChanged));

  @override
  NameChanged get _value => super._value as NameChanged;

  @override
  $Res call({
    Object? nameStr = freezed,
  }) {
    return _then(NameChanged(
      nameStr == freezed
          ? _value.nameStr
          : nameStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$NameChanged implements NameChanged {
  const _$NameChanged(this.nameStr);

  @override
  final String nameStr;

  @override
  String toString() {
    return 'PersonalInfoBlocEvent.nameChanged(nameStr: $nameStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NameChanged &&
            (identical(other.nameStr, nameStr) ||
                const DeepCollectionEquality().equals(other.nameStr, nameStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(nameStr);

  @JsonKey(ignore: true)
  @override
  $NameChangedCopyWith<NameChanged> get copyWith =>
      _$NameChangedCopyWithImpl<NameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String nameStr) nameChanged,
    required TResult Function(String surnameStr) surnameChanged,
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(String phoneStr) phoneChanged,
    required TResult Function(Image photo) photoChanged,
    required TResult Function() submitChanges,
  }) {
    return nameChanged(nameStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String nameStr)? nameChanged,
    TResult Function(String surnameStr)? surnameChanged,
    TResult Function(String emailStr)? emailChanged,
    TResult Function(String phoneStr)? phoneChanged,
    TResult Function(Image photo)? photoChanged,
    TResult Function()? submitChanges,
    required TResult orElse(),
  }) {
    if (nameChanged != null) {
      return nameChanged(nameStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(SurnameChanged value) surnameChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PhoneChanged value) phoneChanged,
    required TResult Function(PhotoChanged value) photoChanged,
    required TResult Function(SubmitChanges value) submitChanges,
  }) {
    return nameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(SurnameChanged value)? surnameChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(PhotoChanged value)? photoChanged,
    TResult Function(SubmitChanges value)? submitChanges,
    required TResult orElse(),
  }) {
    if (nameChanged != null) {
      return nameChanged(this);
    }
    return orElse();
  }
}

abstract class NameChanged implements PersonalInfoBlocEvent {
  const factory NameChanged(String nameStr) = _$NameChanged;

  String get nameStr => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NameChangedCopyWith<NameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SurnameChangedCopyWith<$Res> {
  factory $SurnameChangedCopyWith(
          SurnameChanged value, $Res Function(SurnameChanged) then) =
      _$SurnameChangedCopyWithImpl<$Res>;
  $Res call({String surnameStr});
}

/// @nodoc
class _$SurnameChangedCopyWithImpl<$Res>
    extends _$PersonalInfoBlocEventCopyWithImpl<$Res>
    implements $SurnameChangedCopyWith<$Res> {
  _$SurnameChangedCopyWithImpl(
      SurnameChanged _value, $Res Function(SurnameChanged) _then)
      : super(_value, (v) => _then(v as SurnameChanged));

  @override
  SurnameChanged get _value => super._value as SurnameChanged;

  @override
  $Res call({
    Object? surnameStr = freezed,
  }) {
    return _then(SurnameChanged(
      surnameStr == freezed
          ? _value.surnameStr
          : surnameStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SurnameChanged implements SurnameChanged {
  const _$SurnameChanged(this.surnameStr);

  @override
  final String surnameStr;

  @override
  String toString() {
    return 'PersonalInfoBlocEvent.surnameChanged(surnameStr: $surnameStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SurnameChanged &&
            (identical(other.surnameStr, surnameStr) ||
                const DeepCollectionEquality()
                    .equals(other.surnameStr, surnameStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(surnameStr);

  @JsonKey(ignore: true)
  @override
  $SurnameChangedCopyWith<SurnameChanged> get copyWith =>
      _$SurnameChangedCopyWithImpl<SurnameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String nameStr) nameChanged,
    required TResult Function(String surnameStr) surnameChanged,
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(String phoneStr) phoneChanged,
    required TResult Function(Image photo) photoChanged,
    required TResult Function() submitChanges,
  }) {
    return surnameChanged(surnameStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String nameStr)? nameChanged,
    TResult Function(String surnameStr)? surnameChanged,
    TResult Function(String emailStr)? emailChanged,
    TResult Function(String phoneStr)? phoneChanged,
    TResult Function(Image photo)? photoChanged,
    TResult Function()? submitChanges,
    required TResult orElse(),
  }) {
    if (surnameChanged != null) {
      return surnameChanged(surnameStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(SurnameChanged value) surnameChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PhoneChanged value) phoneChanged,
    required TResult Function(PhotoChanged value) photoChanged,
    required TResult Function(SubmitChanges value) submitChanges,
  }) {
    return surnameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(SurnameChanged value)? surnameChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(PhotoChanged value)? photoChanged,
    TResult Function(SubmitChanges value)? submitChanges,
    required TResult orElse(),
  }) {
    if (surnameChanged != null) {
      return surnameChanged(this);
    }
    return orElse();
  }
}

abstract class SurnameChanged implements PersonalInfoBlocEvent {
  const factory SurnameChanged(String surnameStr) = _$SurnameChanged;

  String get surnameStr => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SurnameChangedCopyWith<SurnameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailChangedCopyWith<$Res> {
  factory $EmailChangedCopyWith(
          EmailChanged value, $Res Function(EmailChanged) then) =
      _$EmailChangedCopyWithImpl<$Res>;
  $Res call({String emailStr});
}

/// @nodoc
class _$EmailChangedCopyWithImpl<$Res>
    extends _$PersonalInfoBlocEventCopyWithImpl<$Res>
    implements $EmailChangedCopyWith<$Res> {
  _$EmailChangedCopyWithImpl(
      EmailChanged _value, $Res Function(EmailChanged) _then)
      : super(_value, (v) => _then(v as EmailChanged));

  @override
  EmailChanged get _value => super._value as EmailChanged;

  @override
  $Res call({
    Object? emailStr = freezed,
  }) {
    return _then(EmailChanged(
      emailStr == freezed
          ? _value.emailStr
          : emailStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EmailChanged implements EmailChanged {
  const _$EmailChanged(this.emailStr);

  @override
  final String emailStr;

  @override
  String toString() {
    return 'PersonalInfoBlocEvent.emailChanged(emailStr: $emailStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EmailChanged &&
            (identical(other.emailStr, emailStr) ||
                const DeepCollectionEquality()
                    .equals(other.emailStr, emailStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(emailStr);

  @JsonKey(ignore: true)
  @override
  $EmailChangedCopyWith<EmailChanged> get copyWith =>
      _$EmailChangedCopyWithImpl<EmailChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String nameStr) nameChanged,
    required TResult Function(String surnameStr) surnameChanged,
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(String phoneStr) phoneChanged,
    required TResult Function(Image photo) photoChanged,
    required TResult Function() submitChanges,
  }) {
    return emailChanged(emailStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String nameStr)? nameChanged,
    TResult Function(String surnameStr)? surnameChanged,
    TResult Function(String emailStr)? emailChanged,
    TResult Function(String phoneStr)? phoneChanged,
    TResult Function(Image photo)? photoChanged,
    TResult Function()? submitChanges,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(emailStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(SurnameChanged value) surnameChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PhoneChanged value) phoneChanged,
    required TResult Function(PhotoChanged value) photoChanged,
    required TResult Function(SubmitChanges value) submitChanges,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(SurnameChanged value)? surnameChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(PhotoChanged value)? photoChanged,
    TResult Function(SubmitChanges value)? submitChanges,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class EmailChanged implements PersonalInfoBlocEvent {
  const factory EmailChanged(String emailStr) = _$EmailChanged;

  String get emailStr => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EmailChangedCopyWith<EmailChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneChangedCopyWith<$Res> {
  factory $PhoneChangedCopyWith(
          PhoneChanged value, $Res Function(PhoneChanged) then) =
      _$PhoneChangedCopyWithImpl<$Res>;
  $Res call({String phoneStr});
}

/// @nodoc
class _$PhoneChangedCopyWithImpl<$Res>
    extends _$PersonalInfoBlocEventCopyWithImpl<$Res>
    implements $PhoneChangedCopyWith<$Res> {
  _$PhoneChangedCopyWithImpl(
      PhoneChanged _value, $Res Function(PhoneChanged) _then)
      : super(_value, (v) => _then(v as PhoneChanged));

  @override
  PhoneChanged get _value => super._value as PhoneChanged;

  @override
  $Res call({
    Object? phoneStr = freezed,
  }) {
    return _then(PhoneChanged(
      phoneStr == freezed
          ? _value.phoneStr
          : phoneStr // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PhoneChanged implements PhoneChanged {
  const _$PhoneChanged(this.phoneStr);

  @override
  final String phoneStr;

  @override
  String toString() {
    return 'PersonalInfoBlocEvent.phoneChanged(phoneStr: $phoneStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PhoneChanged &&
            (identical(other.phoneStr, phoneStr) ||
                const DeepCollectionEquality()
                    .equals(other.phoneStr, phoneStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(phoneStr);

  @JsonKey(ignore: true)
  @override
  $PhoneChangedCopyWith<PhoneChanged> get copyWith =>
      _$PhoneChangedCopyWithImpl<PhoneChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String nameStr) nameChanged,
    required TResult Function(String surnameStr) surnameChanged,
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(String phoneStr) phoneChanged,
    required TResult Function(Image photo) photoChanged,
    required TResult Function() submitChanges,
  }) {
    return phoneChanged(phoneStr);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String nameStr)? nameChanged,
    TResult Function(String surnameStr)? surnameChanged,
    TResult Function(String emailStr)? emailChanged,
    TResult Function(String phoneStr)? phoneChanged,
    TResult Function(Image photo)? photoChanged,
    TResult Function()? submitChanges,
    required TResult orElse(),
  }) {
    if (phoneChanged != null) {
      return phoneChanged(phoneStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(SurnameChanged value) surnameChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PhoneChanged value) phoneChanged,
    required TResult Function(PhotoChanged value) photoChanged,
    required TResult Function(SubmitChanges value) submitChanges,
  }) {
    return phoneChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(SurnameChanged value)? surnameChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(PhotoChanged value)? photoChanged,
    TResult Function(SubmitChanges value)? submitChanges,
    required TResult orElse(),
  }) {
    if (phoneChanged != null) {
      return phoneChanged(this);
    }
    return orElse();
  }
}

abstract class PhoneChanged implements PersonalInfoBlocEvent {
  const factory PhoneChanged(String phoneStr) = _$PhoneChanged;

  String get phoneStr => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhoneChangedCopyWith<PhoneChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoChangedCopyWith<$Res> {
  factory $PhotoChangedCopyWith(
          PhotoChanged value, $Res Function(PhotoChanged) then) =
      _$PhotoChangedCopyWithImpl<$Res>;
  $Res call({Image photo});
}

/// @nodoc
class _$PhotoChangedCopyWithImpl<$Res>
    extends _$PersonalInfoBlocEventCopyWithImpl<$Res>
    implements $PhotoChangedCopyWith<$Res> {
  _$PhotoChangedCopyWithImpl(
      PhotoChanged _value, $Res Function(PhotoChanged) _then)
      : super(_value, (v) => _then(v as PhotoChanged));

  @override
  PhotoChanged get _value => super._value as PhotoChanged;

  @override
  $Res call({
    Object? photo = freezed,
  }) {
    return _then(PhotoChanged(
      photo == freezed
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as Image,
    ));
  }
}

/// @nodoc

class _$PhotoChanged implements PhotoChanged {
  const _$PhotoChanged(this.photo);

  @override
  final Image photo;

  @override
  String toString() {
    return 'PersonalInfoBlocEvent.photoChanged(photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PhotoChanged &&
            (identical(other.photo, photo) ||
                const DeepCollectionEquality().equals(other.photo, photo)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(photo);

  @JsonKey(ignore: true)
  @override
  $PhotoChangedCopyWith<PhotoChanged> get copyWith =>
      _$PhotoChangedCopyWithImpl<PhotoChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String nameStr) nameChanged,
    required TResult Function(String surnameStr) surnameChanged,
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(String phoneStr) phoneChanged,
    required TResult Function(Image photo) photoChanged,
    required TResult Function() submitChanges,
  }) {
    return photoChanged(photo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String nameStr)? nameChanged,
    TResult Function(String surnameStr)? surnameChanged,
    TResult Function(String emailStr)? emailChanged,
    TResult Function(String phoneStr)? phoneChanged,
    TResult Function(Image photo)? photoChanged,
    TResult Function()? submitChanges,
    required TResult orElse(),
  }) {
    if (photoChanged != null) {
      return photoChanged(photo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(SurnameChanged value) surnameChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PhoneChanged value) phoneChanged,
    required TResult Function(PhotoChanged value) photoChanged,
    required TResult Function(SubmitChanges value) submitChanges,
  }) {
    return photoChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(SurnameChanged value)? surnameChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(PhotoChanged value)? photoChanged,
    TResult Function(SubmitChanges value)? submitChanges,
    required TResult orElse(),
  }) {
    if (photoChanged != null) {
      return photoChanged(this);
    }
    return orElse();
  }
}

abstract class PhotoChanged implements PersonalInfoBlocEvent {
  const factory PhotoChanged(Image photo) = _$PhotoChanged;

  Image get photo => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotoChangedCopyWith<PhotoChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitChangesCopyWith<$Res> {
  factory $SubmitChangesCopyWith(
          SubmitChanges value, $Res Function(SubmitChanges) then) =
      _$SubmitChangesCopyWithImpl<$Res>;
}

/// @nodoc
class _$SubmitChangesCopyWithImpl<$Res>
    extends _$PersonalInfoBlocEventCopyWithImpl<$Res>
    implements $SubmitChangesCopyWith<$Res> {
  _$SubmitChangesCopyWithImpl(
      SubmitChanges _value, $Res Function(SubmitChanges) _then)
      : super(_value, (v) => _then(v as SubmitChanges));

  @override
  SubmitChanges get _value => super._value as SubmitChanges;
}

/// @nodoc

class _$SubmitChanges implements SubmitChanges {
  const _$SubmitChanges();

  @override
  String toString() {
    return 'PersonalInfoBlocEvent.submitChanges()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SubmitChanges);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String nameStr) nameChanged,
    required TResult Function(String surnameStr) surnameChanged,
    required TResult Function(String emailStr) emailChanged,
    required TResult Function(String phoneStr) phoneChanged,
    required TResult Function(Image photo) photoChanged,
    required TResult Function() submitChanges,
  }) {
    return submitChanges();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String nameStr)? nameChanged,
    TResult Function(String surnameStr)? surnameChanged,
    TResult Function(String emailStr)? emailChanged,
    TResult Function(String phoneStr)? phoneChanged,
    TResult Function(Image photo)? photoChanged,
    TResult Function()? submitChanges,
    required TResult orElse(),
  }) {
    if (submitChanges != null) {
      return submitChanges();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NameChanged value) nameChanged,
    required TResult Function(SurnameChanged value) surnameChanged,
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PhoneChanged value) phoneChanged,
    required TResult Function(PhotoChanged value) photoChanged,
    required TResult Function(SubmitChanges value) submitChanges,
  }) {
    return submitChanges(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NameChanged value)? nameChanged,
    TResult Function(SurnameChanged value)? surnameChanged,
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PhoneChanged value)? phoneChanged,
    TResult Function(PhotoChanged value)? photoChanged,
    TResult Function(SubmitChanges value)? submitChanges,
    required TResult orElse(),
  }) {
    if (submitChanges != null) {
      return submitChanges(this);
    }
    return orElse();
  }
}

abstract class SubmitChanges implements PersonalInfoBlocEvent {
  const factory SubmitChanges() = _$SubmitChanges;
}

/// @nodoc
class _$PersonalInfoBlocStateTearOff {
  const _$PersonalInfoBlocStateTearOff();

  _PersonalInfoBlocState call(
      {required String name,
      required String surname,
      required String email,
      required String phone,
      required bool saveChangesVisible,
      required String userImageRef,
      Image? userImage}) {
    return _PersonalInfoBlocState(
      name: name,
      surname: surname,
      email: email,
      phone: phone,
      saveChangesVisible: saveChangesVisible,
      userImageRef: userImageRef,
      userImage: userImage,
    );
  }
}

/// @nodoc
const $PersonalInfoBlocState = _$PersonalInfoBlocStateTearOff();

/// @nodoc
mixin _$PersonalInfoBlocState {
  String get name => throw _privateConstructorUsedError;
  String get surname => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  bool get saveChangesVisible => throw _privateConstructorUsedError;
  String get userImageRef => throw _privateConstructorUsedError;
  Image? get userImage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PersonalInfoBlocStateCopyWith<PersonalInfoBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalInfoBlocStateCopyWith<$Res> {
  factory $PersonalInfoBlocStateCopyWith(PersonalInfoBlocState value,
          $Res Function(PersonalInfoBlocState) then) =
      _$PersonalInfoBlocStateCopyWithImpl<$Res>;
  $Res call(
      {String name,
      String surname,
      String email,
      String phone,
      bool saveChangesVisible,
      String userImageRef,
      Image? userImage});
}

/// @nodoc
class _$PersonalInfoBlocStateCopyWithImpl<$Res>
    implements $PersonalInfoBlocStateCopyWith<$Res> {
  _$PersonalInfoBlocStateCopyWithImpl(this._value, this._then);

  final PersonalInfoBlocState _value;
  // ignore: unused_field
  final $Res Function(PersonalInfoBlocState) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? surname = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? saveChangesVisible = freezed,
    Object? userImageRef = freezed,
    Object? userImage = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: surname == freezed
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      saveChangesVisible: saveChangesVisible == freezed
          ? _value.saveChangesVisible
          : saveChangesVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      userImageRef: userImageRef == freezed
          ? _value.userImageRef
          : userImageRef // ignore: cast_nullable_to_non_nullable
              as String,
      userImage: userImage == freezed
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as Image?,
    ));
  }
}

/// @nodoc
abstract class _$PersonalInfoBlocStateCopyWith<$Res>
    implements $PersonalInfoBlocStateCopyWith<$Res> {
  factory _$PersonalInfoBlocStateCopyWith(_PersonalInfoBlocState value,
          $Res Function(_PersonalInfoBlocState) then) =
      __$PersonalInfoBlocStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {String name,
      String surname,
      String email,
      String phone,
      bool saveChangesVisible,
      String userImageRef,
      Image? userImage});
}

/// @nodoc
class __$PersonalInfoBlocStateCopyWithImpl<$Res>
    extends _$PersonalInfoBlocStateCopyWithImpl<$Res>
    implements _$PersonalInfoBlocStateCopyWith<$Res> {
  __$PersonalInfoBlocStateCopyWithImpl(_PersonalInfoBlocState _value,
      $Res Function(_PersonalInfoBlocState) _then)
      : super(_value, (v) => _then(v as _PersonalInfoBlocState));

  @override
  _PersonalInfoBlocState get _value => super._value as _PersonalInfoBlocState;

  @override
  $Res call({
    Object? name = freezed,
    Object? surname = freezed,
    Object? email = freezed,
    Object? phone = freezed,
    Object? saveChangesVisible = freezed,
    Object? userImageRef = freezed,
    Object? userImage = freezed,
  }) {
    return _then(_PersonalInfoBlocState(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      surname: surname == freezed
          ? _value.surname
          : surname // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      saveChangesVisible: saveChangesVisible == freezed
          ? _value.saveChangesVisible
          : saveChangesVisible // ignore: cast_nullable_to_non_nullable
              as bool,
      userImageRef: userImageRef == freezed
          ? _value.userImageRef
          : userImageRef // ignore: cast_nullable_to_non_nullable
              as String,
      userImage: userImage == freezed
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as Image?,
    ));
  }
}

/// @nodoc

class _$_PersonalInfoBlocState implements _PersonalInfoBlocState {
  const _$_PersonalInfoBlocState(
      {required this.name,
      required this.surname,
      required this.email,
      required this.phone,
      required this.saveChangesVisible,
      required this.userImageRef,
      this.userImage});

  @override
  final String name;
  @override
  final String surname;
  @override
  final String email;
  @override
  final String phone;
  @override
  final bool saveChangesVisible;
  @override
  final String userImageRef;
  @override
  final Image? userImage;

  @override
  String toString() {
    return 'PersonalInfoBlocState(name: $name, surname: $surname, email: $email, phone: $phone, saveChangesVisible: $saveChangesVisible, userImageRef: $userImageRef, userImage: $userImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PersonalInfoBlocState &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.surname, surname) ||
                const DeepCollectionEquality()
                    .equals(other.surname, surname)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.saveChangesVisible, saveChangesVisible) ||
                const DeepCollectionEquality()
                    .equals(other.saveChangesVisible, saveChangesVisible)) &&
            (identical(other.userImageRef, userImageRef) ||
                const DeepCollectionEquality()
                    .equals(other.userImageRef, userImageRef)) &&
            (identical(other.userImage, userImage) ||
                const DeepCollectionEquality()
                    .equals(other.userImage, userImage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(surname) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(saveChangesVisible) ^
      const DeepCollectionEquality().hash(userImageRef) ^
      const DeepCollectionEquality().hash(userImage);

  @JsonKey(ignore: true)
  @override
  _$PersonalInfoBlocStateCopyWith<_PersonalInfoBlocState> get copyWith =>
      __$PersonalInfoBlocStateCopyWithImpl<_PersonalInfoBlocState>(
          this, _$identity);
}

abstract class _PersonalInfoBlocState implements PersonalInfoBlocState {
  const factory _PersonalInfoBlocState(
      {required String name,
      required String surname,
      required String email,
      required String phone,
      required bool saveChangesVisible,
      required String userImageRef,
      Image? userImage}) = _$_PersonalInfoBlocState;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get surname => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get phone => throw _privateConstructorUsedError;
  @override
  bool get saveChangesVisible => throw _privateConstructorUsedError;
  @override
  String get userImageRef => throw _privateConstructorUsedError;
  @override
  Image? get userImage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PersonalInfoBlocStateCopyWith<_PersonalInfoBlocState> get copyWith =>
      throw _privateConstructorUsedError;
}
