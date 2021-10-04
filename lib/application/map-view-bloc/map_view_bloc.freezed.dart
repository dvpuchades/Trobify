// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'map_view_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$MapViewEventTearOff {
  const _$MapViewEventTearOff();

  OnMapCreated onMapCreated(
      GoogleMapController mapController, BuildContext context) {
    return OnMapCreated(
      mapController,
      context,
    );
  }

  GoToMap goToMap(bool onmap) {
    return GoToMap(
      onmap,
    );
  }

  OnMapMoved onMapMoved() {
    return const OnMapMoved();
  }

  RefreshItems refreshItems(BuildContext context, FiltrosState state) {
    return RefreshItems(
      context,
      state,
    );
  }

  SetStartLocation setStartLocation(String placeId) {
    return SetStartLocation(
      placeId,
    );
  }
}

/// @nodoc
const $MapViewEvent = _$MapViewEventTearOff();

/// @nodoc
mixin _$MapViewEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            GoogleMapController mapController, BuildContext context)
        onMapCreated,
    required TResult Function(bool onmap) goToMap,
    required TResult Function() onMapMoved,
    required TResult Function(BuildContext context, FiltrosState state)
        refreshItems,
    required TResult Function(String placeId) setStartLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GoogleMapController mapController, BuildContext context)?
        onMapCreated,
    TResult Function(bool onmap)? goToMap,
    TResult Function()? onMapMoved,
    TResult Function(BuildContext context, FiltrosState state)? refreshItems,
    TResult Function(String placeId)? setStartLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnMapCreated value) onMapCreated,
    required TResult Function(GoToMap value) goToMap,
    required TResult Function(OnMapMoved value) onMapMoved,
    required TResult Function(RefreshItems value) refreshItems,
    required TResult Function(SetStartLocation value) setStartLocation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnMapCreated value)? onMapCreated,
    TResult Function(GoToMap value)? goToMap,
    TResult Function(OnMapMoved value)? onMapMoved,
    TResult Function(RefreshItems value)? refreshItems,
    TResult Function(SetStartLocation value)? setStartLocation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapViewEventCopyWith<$Res> {
  factory $MapViewEventCopyWith(
          MapViewEvent value, $Res Function(MapViewEvent) then) =
      _$MapViewEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$MapViewEventCopyWithImpl<$Res> implements $MapViewEventCopyWith<$Res> {
  _$MapViewEventCopyWithImpl(this._value, this._then);

  final MapViewEvent _value;
  // ignore: unused_field
  final $Res Function(MapViewEvent) _then;
}

/// @nodoc
abstract class $OnMapCreatedCopyWith<$Res> {
  factory $OnMapCreatedCopyWith(
          OnMapCreated value, $Res Function(OnMapCreated) then) =
      _$OnMapCreatedCopyWithImpl<$Res>;
  $Res call({GoogleMapController mapController, BuildContext context});
}

/// @nodoc
class _$OnMapCreatedCopyWithImpl<$Res> extends _$MapViewEventCopyWithImpl<$Res>
    implements $OnMapCreatedCopyWith<$Res> {
  _$OnMapCreatedCopyWithImpl(
      OnMapCreated _value, $Res Function(OnMapCreated) _then)
      : super(_value, (v) => _then(v as OnMapCreated));

  @override
  OnMapCreated get _value => super._value as OnMapCreated;

  @override
  $Res call({
    Object? mapController = freezed,
    Object? context = freezed,
  }) {
    return _then(OnMapCreated(
      mapController == freezed
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController,
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class _$OnMapCreated implements OnMapCreated {
  const _$OnMapCreated(this.mapController, this.context);

  @override
  final GoogleMapController mapController;
  @override
  final BuildContext context;

  @override
  String toString() {
    return 'MapViewEvent.onMapCreated(mapController: $mapController, context: $context)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is OnMapCreated &&
            (identical(other.mapController, mapController) ||
                const DeepCollectionEquality()
                    .equals(other.mapController, mapController)) &&
            (identical(other.context, context) ||
                const DeepCollectionEquality().equals(other.context, context)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(mapController) ^
      const DeepCollectionEquality().hash(context);

  @JsonKey(ignore: true)
  @override
  $OnMapCreatedCopyWith<OnMapCreated> get copyWith =>
      _$OnMapCreatedCopyWithImpl<OnMapCreated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            GoogleMapController mapController, BuildContext context)
        onMapCreated,
    required TResult Function(bool onmap) goToMap,
    required TResult Function() onMapMoved,
    required TResult Function(BuildContext context, FiltrosState state)
        refreshItems,
    required TResult Function(String placeId) setStartLocation,
  }) {
    return onMapCreated(mapController, context);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GoogleMapController mapController, BuildContext context)?
        onMapCreated,
    TResult Function(bool onmap)? goToMap,
    TResult Function()? onMapMoved,
    TResult Function(BuildContext context, FiltrosState state)? refreshItems,
    TResult Function(String placeId)? setStartLocation,
    required TResult orElse(),
  }) {
    if (onMapCreated != null) {
      return onMapCreated(mapController, context);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnMapCreated value) onMapCreated,
    required TResult Function(GoToMap value) goToMap,
    required TResult Function(OnMapMoved value) onMapMoved,
    required TResult Function(RefreshItems value) refreshItems,
    required TResult Function(SetStartLocation value) setStartLocation,
  }) {
    return onMapCreated(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnMapCreated value)? onMapCreated,
    TResult Function(GoToMap value)? goToMap,
    TResult Function(OnMapMoved value)? onMapMoved,
    TResult Function(RefreshItems value)? refreshItems,
    TResult Function(SetStartLocation value)? setStartLocation,
    required TResult orElse(),
  }) {
    if (onMapCreated != null) {
      return onMapCreated(this);
    }
    return orElse();
  }
}

abstract class OnMapCreated implements MapViewEvent {
  const factory OnMapCreated(
      GoogleMapController mapController, BuildContext context) = _$OnMapCreated;

  GoogleMapController get mapController => throw _privateConstructorUsedError;
  BuildContext get context => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OnMapCreatedCopyWith<OnMapCreated> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoToMapCopyWith<$Res> {
  factory $GoToMapCopyWith(GoToMap value, $Res Function(GoToMap) then) =
      _$GoToMapCopyWithImpl<$Res>;
  $Res call({bool onmap});
}

/// @nodoc
class _$GoToMapCopyWithImpl<$Res> extends _$MapViewEventCopyWithImpl<$Res>
    implements $GoToMapCopyWith<$Res> {
  _$GoToMapCopyWithImpl(GoToMap _value, $Res Function(GoToMap) _then)
      : super(_value, (v) => _then(v as GoToMap));

  @override
  GoToMap get _value => super._value as GoToMap;

  @override
  $Res call({
    Object? onmap = freezed,
  }) {
    return _then(GoToMap(
      onmap == freezed
          ? _value.onmap
          : onmap // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GoToMap implements GoToMap {
  const _$GoToMap(this.onmap);

  @override
  final bool onmap;

  @override
  String toString() {
    return 'MapViewEvent.goToMap(onmap: $onmap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GoToMap &&
            (identical(other.onmap, onmap) ||
                const DeepCollectionEquality().equals(other.onmap, onmap)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(onmap);

  @JsonKey(ignore: true)
  @override
  $GoToMapCopyWith<GoToMap> get copyWith =>
      _$GoToMapCopyWithImpl<GoToMap>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            GoogleMapController mapController, BuildContext context)
        onMapCreated,
    required TResult Function(bool onmap) goToMap,
    required TResult Function() onMapMoved,
    required TResult Function(BuildContext context, FiltrosState state)
        refreshItems,
    required TResult Function(String placeId) setStartLocation,
  }) {
    return goToMap(onmap);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GoogleMapController mapController, BuildContext context)?
        onMapCreated,
    TResult Function(bool onmap)? goToMap,
    TResult Function()? onMapMoved,
    TResult Function(BuildContext context, FiltrosState state)? refreshItems,
    TResult Function(String placeId)? setStartLocation,
    required TResult orElse(),
  }) {
    if (goToMap != null) {
      return goToMap(onmap);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnMapCreated value) onMapCreated,
    required TResult Function(GoToMap value) goToMap,
    required TResult Function(OnMapMoved value) onMapMoved,
    required TResult Function(RefreshItems value) refreshItems,
    required TResult Function(SetStartLocation value) setStartLocation,
  }) {
    return goToMap(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnMapCreated value)? onMapCreated,
    TResult Function(GoToMap value)? goToMap,
    TResult Function(OnMapMoved value)? onMapMoved,
    TResult Function(RefreshItems value)? refreshItems,
    TResult Function(SetStartLocation value)? setStartLocation,
    required TResult orElse(),
  }) {
    if (goToMap != null) {
      return goToMap(this);
    }
    return orElse();
  }
}

abstract class GoToMap implements MapViewEvent {
  const factory GoToMap(bool onmap) = _$GoToMap;

  bool get onmap => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GoToMapCopyWith<GoToMap> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnMapMovedCopyWith<$Res> {
  factory $OnMapMovedCopyWith(
          OnMapMoved value, $Res Function(OnMapMoved) then) =
      _$OnMapMovedCopyWithImpl<$Res>;
}

/// @nodoc
class _$OnMapMovedCopyWithImpl<$Res> extends _$MapViewEventCopyWithImpl<$Res>
    implements $OnMapMovedCopyWith<$Res> {
  _$OnMapMovedCopyWithImpl(OnMapMoved _value, $Res Function(OnMapMoved) _then)
      : super(_value, (v) => _then(v as OnMapMoved));

  @override
  OnMapMoved get _value => super._value as OnMapMoved;
}

/// @nodoc

class _$OnMapMoved implements OnMapMoved {
  const _$OnMapMoved();

  @override
  String toString() {
    return 'MapViewEvent.onMapMoved()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is OnMapMoved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            GoogleMapController mapController, BuildContext context)
        onMapCreated,
    required TResult Function(bool onmap) goToMap,
    required TResult Function() onMapMoved,
    required TResult Function(BuildContext context, FiltrosState state)
        refreshItems,
    required TResult Function(String placeId) setStartLocation,
  }) {
    return onMapMoved();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GoogleMapController mapController, BuildContext context)?
        onMapCreated,
    TResult Function(bool onmap)? goToMap,
    TResult Function()? onMapMoved,
    TResult Function(BuildContext context, FiltrosState state)? refreshItems,
    TResult Function(String placeId)? setStartLocation,
    required TResult orElse(),
  }) {
    if (onMapMoved != null) {
      return onMapMoved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnMapCreated value) onMapCreated,
    required TResult Function(GoToMap value) goToMap,
    required TResult Function(OnMapMoved value) onMapMoved,
    required TResult Function(RefreshItems value) refreshItems,
    required TResult Function(SetStartLocation value) setStartLocation,
  }) {
    return onMapMoved(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnMapCreated value)? onMapCreated,
    TResult Function(GoToMap value)? goToMap,
    TResult Function(OnMapMoved value)? onMapMoved,
    TResult Function(RefreshItems value)? refreshItems,
    TResult Function(SetStartLocation value)? setStartLocation,
    required TResult orElse(),
  }) {
    if (onMapMoved != null) {
      return onMapMoved(this);
    }
    return orElse();
  }
}

abstract class OnMapMoved implements MapViewEvent {
  const factory OnMapMoved() = _$OnMapMoved;
}

/// @nodoc
abstract class $RefreshItemsCopyWith<$Res> {
  factory $RefreshItemsCopyWith(
          RefreshItems value, $Res Function(RefreshItems) then) =
      _$RefreshItemsCopyWithImpl<$Res>;
  $Res call({BuildContext context, FiltrosState state});

  $FiltrosStateCopyWith<$Res> get state;
}

/// @nodoc
class _$RefreshItemsCopyWithImpl<$Res> extends _$MapViewEventCopyWithImpl<$Res>
    implements $RefreshItemsCopyWith<$Res> {
  _$RefreshItemsCopyWithImpl(
      RefreshItems _value, $Res Function(RefreshItems) _then)
      : super(_value, (v) => _then(v as RefreshItems));

  @override
  RefreshItems get _value => super._value as RefreshItems;

  @override
  $Res call({
    Object? context = freezed,
    Object? state = freezed,
  }) {
    return _then(RefreshItems(
      context == freezed
          ? _value.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as FiltrosState,
    ));
  }

  @override
  $FiltrosStateCopyWith<$Res> get state {
    return $FiltrosStateCopyWith<$Res>(_value.state, (value) {
      return _then(_value.copyWith(state: value));
    });
  }
}

/// @nodoc

class _$RefreshItems implements RefreshItems {
  const _$RefreshItems(this.context, this.state);

  @override
  final BuildContext context;
  @override
  final FiltrosState state;

  @override
  String toString() {
    return 'MapViewEvent.refreshItems(context: $context, state: $state)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RefreshItems &&
            (identical(other.context, context) ||
                const DeepCollectionEquality()
                    .equals(other.context, context)) &&
            (identical(other.state, state) ||
                const DeepCollectionEquality().equals(other.state, state)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(context) ^
      const DeepCollectionEquality().hash(state);

  @JsonKey(ignore: true)
  @override
  $RefreshItemsCopyWith<RefreshItems> get copyWith =>
      _$RefreshItemsCopyWithImpl<RefreshItems>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            GoogleMapController mapController, BuildContext context)
        onMapCreated,
    required TResult Function(bool onmap) goToMap,
    required TResult Function() onMapMoved,
    required TResult Function(BuildContext context, FiltrosState state)
        refreshItems,
    required TResult Function(String placeId) setStartLocation,
  }) {
    return refreshItems(context, state);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GoogleMapController mapController, BuildContext context)?
        onMapCreated,
    TResult Function(bool onmap)? goToMap,
    TResult Function()? onMapMoved,
    TResult Function(BuildContext context, FiltrosState state)? refreshItems,
    TResult Function(String placeId)? setStartLocation,
    required TResult orElse(),
  }) {
    if (refreshItems != null) {
      return refreshItems(context, state);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnMapCreated value) onMapCreated,
    required TResult Function(GoToMap value) goToMap,
    required TResult Function(OnMapMoved value) onMapMoved,
    required TResult Function(RefreshItems value) refreshItems,
    required TResult Function(SetStartLocation value) setStartLocation,
  }) {
    return refreshItems(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnMapCreated value)? onMapCreated,
    TResult Function(GoToMap value)? goToMap,
    TResult Function(OnMapMoved value)? onMapMoved,
    TResult Function(RefreshItems value)? refreshItems,
    TResult Function(SetStartLocation value)? setStartLocation,
    required TResult orElse(),
  }) {
    if (refreshItems != null) {
      return refreshItems(this);
    }
    return orElse();
  }
}

abstract class RefreshItems implements MapViewEvent {
  const factory RefreshItems(BuildContext context, FiltrosState state) =
      _$RefreshItems;

  BuildContext get context => throw _privateConstructorUsedError;
  FiltrosState get state => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RefreshItemsCopyWith<RefreshItems> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetStartLocationCopyWith<$Res> {
  factory $SetStartLocationCopyWith(
          SetStartLocation value, $Res Function(SetStartLocation) then) =
      _$SetStartLocationCopyWithImpl<$Res>;
  $Res call({String placeId});
}

/// @nodoc
class _$SetStartLocationCopyWithImpl<$Res>
    extends _$MapViewEventCopyWithImpl<$Res>
    implements $SetStartLocationCopyWith<$Res> {
  _$SetStartLocationCopyWithImpl(
      SetStartLocation _value, $Res Function(SetStartLocation) _then)
      : super(_value, (v) => _then(v as SetStartLocation));

  @override
  SetStartLocation get _value => super._value as SetStartLocation;

  @override
  $Res call({
    Object? placeId = freezed,
  }) {
    return _then(SetStartLocation(
      placeId == freezed
          ? _value.placeId
          : placeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SetStartLocation implements SetStartLocation {
  const _$SetStartLocation(this.placeId);

  @override
  final String placeId;

  @override
  String toString() {
    return 'MapViewEvent.setStartLocation(placeId: $placeId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SetStartLocation &&
            (identical(other.placeId, placeId) ||
                const DeepCollectionEquality().equals(other.placeId, placeId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(placeId);

  @JsonKey(ignore: true)
  @override
  $SetStartLocationCopyWith<SetStartLocation> get copyWith =>
      _$SetStartLocationCopyWithImpl<SetStartLocation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            GoogleMapController mapController, BuildContext context)
        onMapCreated,
    required TResult Function(bool onmap) goToMap,
    required TResult Function() onMapMoved,
    required TResult Function(BuildContext context, FiltrosState state)
        refreshItems,
    required TResult Function(String placeId) setStartLocation,
  }) {
    return setStartLocation(placeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(GoogleMapController mapController, BuildContext context)?
        onMapCreated,
    TResult Function(bool onmap)? goToMap,
    TResult Function()? onMapMoved,
    TResult Function(BuildContext context, FiltrosState state)? refreshItems,
    TResult Function(String placeId)? setStartLocation,
    required TResult orElse(),
  }) {
    if (setStartLocation != null) {
      return setStartLocation(placeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnMapCreated value) onMapCreated,
    required TResult Function(GoToMap value) goToMap,
    required TResult Function(OnMapMoved value) onMapMoved,
    required TResult Function(RefreshItems value) refreshItems,
    required TResult Function(SetStartLocation value) setStartLocation,
  }) {
    return setStartLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnMapCreated value)? onMapCreated,
    TResult Function(GoToMap value)? goToMap,
    TResult Function(OnMapMoved value)? onMapMoved,
    TResult Function(RefreshItems value)? refreshItems,
    TResult Function(SetStartLocation value)? setStartLocation,
    required TResult orElse(),
  }) {
    if (setStartLocation != null) {
      return setStartLocation(this);
    }
    return orElse();
  }
}

abstract class SetStartLocation implements MapViewEvent {
  const factory SetStartLocation(String placeId) = _$SetStartLocation;

  String get placeId => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetStartLocationCopyWith<SetStartLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$MapViewStateTearOff {
  const _$MapViewStateTearOff();

  _MapViewState call(
      {required Set<Marker> markers,
      required List<Inmueble> inmuebles,
      required double refreshOpacity,
      required LatLng myLocation,
      required ScrollController scrollController,
      GoogleMapController? mapController,
      StreamSubscription<dynamic>? subscription,
      required bool onmap}) {
    return _MapViewState(
      markers: markers,
      inmuebles: inmuebles,
      refreshOpacity: refreshOpacity,
      myLocation: myLocation,
      scrollController: scrollController,
      mapController: mapController,
      subscription: subscription,
      onmap: onmap,
    );
  }
}

/// @nodoc
const $MapViewState = _$MapViewStateTearOff();

/// @nodoc
mixin _$MapViewState {
  Set<Marker> get markers => throw _privateConstructorUsedError;
  List<Inmueble> get inmuebles => throw _privateConstructorUsedError;
  double get refreshOpacity => throw _privateConstructorUsedError;
  LatLng get myLocation => throw _privateConstructorUsedError;
  ScrollController get scrollController => throw _privateConstructorUsedError;
  GoogleMapController? get mapController => throw _privateConstructorUsedError;
  StreamSubscription<dynamic>? get subscription =>
      throw _privateConstructorUsedError;
  bool get onmap => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapViewStateCopyWith<MapViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapViewStateCopyWith<$Res> {
  factory $MapViewStateCopyWith(
          MapViewState value, $Res Function(MapViewState) then) =
      _$MapViewStateCopyWithImpl<$Res>;
  $Res call(
      {Set<Marker> markers,
      List<Inmueble> inmuebles,
      double refreshOpacity,
      LatLng myLocation,
      ScrollController scrollController,
      GoogleMapController? mapController,
      StreamSubscription<dynamic>? subscription,
      bool onmap});
}

/// @nodoc
class _$MapViewStateCopyWithImpl<$Res> implements $MapViewStateCopyWith<$Res> {
  _$MapViewStateCopyWithImpl(this._value, this._then);

  final MapViewState _value;
  // ignore: unused_field
  final $Res Function(MapViewState) _then;

  @override
  $Res call({
    Object? markers = freezed,
    Object? inmuebles = freezed,
    Object? refreshOpacity = freezed,
    Object? myLocation = freezed,
    Object? scrollController = freezed,
    Object? mapController = freezed,
    Object? subscription = freezed,
    Object? onmap = freezed,
  }) {
    return _then(_value.copyWith(
      markers: markers == freezed
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      inmuebles: inmuebles == freezed
          ? _value.inmuebles
          : inmuebles // ignore: cast_nullable_to_non_nullable
              as List<Inmueble>,
      refreshOpacity: refreshOpacity == freezed
          ? _value.refreshOpacity
          : refreshOpacity // ignore: cast_nullable_to_non_nullable
              as double,
      myLocation: myLocation == freezed
          ? _value.myLocation
          : myLocation // ignore: cast_nullable_to_non_nullable
              as LatLng,
      scrollController: scrollController == freezed
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      mapController: mapController == freezed
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      subscription: subscription == freezed
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as StreamSubscription<dynamic>?,
      onmap: onmap == freezed
          ? _value.onmap
          : onmap // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$MapViewStateCopyWith<$Res>
    implements $MapViewStateCopyWith<$Res> {
  factory _$MapViewStateCopyWith(
          _MapViewState value, $Res Function(_MapViewState) then) =
      __$MapViewStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Set<Marker> markers,
      List<Inmueble> inmuebles,
      double refreshOpacity,
      LatLng myLocation,
      ScrollController scrollController,
      GoogleMapController? mapController,
      StreamSubscription<dynamic>? subscription,
      bool onmap});
}

/// @nodoc
class __$MapViewStateCopyWithImpl<$Res> extends _$MapViewStateCopyWithImpl<$Res>
    implements _$MapViewStateCopyWith<$Res> {
  __$MapViewStateCopyWithImpl(
      _MapViewState _value, $Res Function(_MapViewState) _then)
      : super(_value, (v) => _then(v as _MapViewState));

  @override
  _MapViewState get _value => super._value as _MapViewState;

  @override
  $Res call({
    Object? markers = freezed,
    Object? inmuebles = freezed,
    Object? refreshOpacity = freezed,
    Object? myLocation = freezed,
    Object? scrollController = freezed,
    Object? mapController = freezed,
    Object? subscription = freezed,
    Object? onmap = freezed,
  }) {
    return _then(_MapViewState(
      markers: markers == freezed
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as Set<Marker>,
      inmuebles: inmuebles == freezed
          ? _value.inmuebles
          : inmuebles // ignore: cast_nullable_to_non_nullable
              as List<Inmueble>,
      refreshOpacity: refreshOpacity == freezed
          ? _value.refreshOpacity
          : refreshOpacity // ignore: cast_nullable_to_non_nullable
              as double,
      myLocation: myLocation == freezed
          ? _value.myLocation
          : myLocation // ignore: cast_nullable_to_non_nullable
              as LatLng,
      scrollController: scrollController == freezed
          ? _value.scrollController
          : scrollController // ignore: cast_nullable_to_non_nullable
              as ScrollController,
      mapController: mapController == freezed
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      subscription: subscription == freezed
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as StreamSubscription<dynamic>?,
      onmap: onmap == freezed
          ? _value.onmap
          : onmap // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_MapViewState implements _MapViewState {
  const _$_MapViewState(
      {required this.markers,
      required this.inmuebles,
      required this.refreshOpacity,
      required this.myLocation,
      required this.scrollController,
      this.mapController,
      this.subscription,
      required this.onmap});

  @override
  final Set<Marker> markers;
  @override
  final List<Inmueble> inmuebles;
  @override
  final double refreshOpacity;
  @override
  final LatLng myLocation;
  @override
  final ScrollController scrollController;
  @override
  final GoogleMapController? mapController;
  @override
  final StreamSubscription<dynamic>? subscription;
  @override
  final bool onmap;

  @override
  String toString() {
    return 'MapViewState(markers: $markers, inmuebles: $inmuebles, refreshOpacity: $refreshOpacity, myLocation: $myLocation, scrollController: $scrollController, mapController: $mapController, subscription: $subscription, onmap: $onmap)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MapViewState &&
            (identical(other.markers, markers) ||
                const DeepCollectionEquality()
                    .equals(other.markers, markers)) &&
            (identical(other.inmuebles, inmuebles) ||
                const DeepCollectionEquality()
                    .equals(other.inmuebles, inmuebles)) &&
            (identical(other.refreshOpacity, refreshOpacity) ||
                const DeepCollectionEquality()
                    .equals(other.refreshOpacity, refreshOpacity)) &&
            (identical(other.myLocation, myLocation) ||
                const DeepCollectionEquality()
                    .equals(other.myLocation, myLocation)) &&
            (identical(other.scrollController, scrollController) ||
                const DeepCollectionEquality()
                    .equals(other.scrollController, scrollController)) &&
            (identical(other.mapController, mapController) ||
                const DeepCollectionEquality()
                    .equals(other.mapController, mapController)) &&
            (identical(other.subscription, subscription) ||
                const DeepCollectionEquality()
                    .equals(other.subscription, subscription)) &&
            (identical(other.onmap, onmap) ||
                const DeepCollectionEquality().equals(other.onmap, onmap)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(markers) ^
      const DeepCollectionEquality().hash(inmuebles) ^
      const DeepCollectionEquality().hash(refreshOpacity) ^
      const DeepCollectionEquality().hash(myLocation) ^
      const DeepCollectionEquality().hash(scrollController) ^
      const DeepCollectionEquality().hash(mapController) ^
      const DeepCollectionEquality().hash(subscription) ^
      const DeepCollectionEquality().hash(onmap);

  @JsonKey(ignore: true)
  @override
  _$MapViewStateCopyWith<_MapViewState> get copyWith =>
      __$MapViewStateCopyWithImpl<_MapViewState>(this, _$identity);
}

abstract class _MapViewState implements MapViewState {
  const factory _MapViewState(
      {required Set<Marker> markers,
      required List<Inmueble> inmuebles,
      required double refreshOpacity,
      required LatLng myLocation,
      required ScrollController scrollController,
      GoogleMapController? mapController,
      StreamSubscription<dynamic>? subscription,
      required bool onmap}) = _$_MapViewState;

  @override
  Set<Marker> get markers => throw _privateConstructorUsedError;
  @override
  List<Inmueble> get inmuebles => throw _privateConstructorUsedError;
  @override
  double get refreshOpacity => throw _privateConstructorUsedError;
  @override
  LatLng get myLocation => throw _privateConstructorUsedError;
  @override
  ScrollController get scrollController => throw _privateConstructorUsedError;
  @override
  GoogleMapController? get mapController => throw _privateConstructorUsedError;
  @override
  StreamSubscription<dynamic>? get subscription =>
      throw _privateConstructorUsedError;
  @override
  bool get onmap => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MapViewStateCopyWith<_MapViewState> get copyWith =>
      throw _privateConstructorUsedError;
}
