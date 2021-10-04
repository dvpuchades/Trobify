// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'search_view_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SearchViewEventTearOff {
  const _$SearchViewEventTearOff();

  SearchAddressChanged searchAddressChanged(String address) {
    return SearchAddressChanged(
      address,
    );
  }

  HistorialChanged historialChanged(dynamic hist) {
    return HistorialChanged(
      hist,
    );
  }

  ProgressChanged progressChanged(dynamic prog) {
    return ProgressChanged(
      prog,
    );
  }

  QueryChanged queryChanged(String searchAddress, dynamic suggestionsSet) {
    return QueryChanged(
      searchAddress,
      suggestionsSet,
    );
  }

  SearchAndNavigate searchAndNavigate(
      GoogleMapController? mapController,
      FloatingSearchBarController? searchBarController,
      BuildContext mapblocContext,
      MapViewState mapblocState,
      BuildContext mapContext,
      String searchAddress,
      FiltrosState filtrosblocState) {
    return SearchAndNavigate(
      mapController,
      searchBarController,
      mapblocContext,
      mapblocState,
      mapContext,
      searchAddress,
      filtrosblocState,
    );
  }
}

/// @nodoc
const $SearchViewEvent = _$SearchViewEventTearOff();

/// @nodoc
mixin _$SearchViewEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String address) searchAddressChanged,
    required TResult Function(dynamic hist) historialChanged,
    required TResult Function(dynamic prog) progressChanged,
    required TResult Function(String searchAddress, dynamic suggestionsSet)
        queryChanged,
    required TResult Function(
            GoogleMapController? mapController,
            FloatingSearchBarController? searchBarController,
            BuildContext mapblocContext,
            MapViewState mapblocState,
            BuildContext mapContext,
            String searchAddress,
            FiltrosState filtrosblocState)
        searchAndNavigate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String address)? searchAddressChanged,
    TResult Function(dynamic hist)? historialChanged,
    TResult Function(dynamic prog)? progressChanged,
    TResult Function(String searchAddress, dynamic suggestionsSet)?
        queryChanged,
    TResult Function(
            GoogleMapController? mapController,
            FloatingSearchBarController? searchBarController,
            BuildContext mapblocContext,
            MapViewState mapblocState,
            BuildContext mapContext,
            String searchAddress,
            FiltrosState filtrosblocState)?
        searchAndNavigate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchAddressChanged value) searchAddressChanged,
    required TResult Function(HistorialChanged value) historialChanged,
    required TResult Function(ProgressChanged value) progressChanged,
    required TResult Function(QueryChanged value) queryChanged,
    required TResult Function(SearchAndNavigate value) searchAndNavigate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchAddressChanged value)? searchAddressChanged,
    TResult Function(HistorialChanged value)? historialChanged,
    TResult Function(ProgressChanged value)? progressChanged,
    TResult Function(QueryChanged value)? queryChanged,
    TResult Function(SearchAndNavigate value)? searchAndNavigate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchViewEventCopyWith<$Res> {
  factory $SearchViewEventCopyWith(
          SearchViewEvent value, $Res Function(SearchViewEvent) then) =
      _$SearchViewEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SearchViewEventCopyWithImpl<$Res>
    implements $SearchViewEventCopyWith<$Res> {
  _$SearchViewEventCopyWithImpl(this._value, this._then);

  final SearchViewEvent _value;
  // ignore: unused_field
  final $Res Function(SearchViewEvent) _then;
}

/// @nodoc
abstract class $SearchAddressChangedCopyWith<$Res> {
  factory $SearchAddressChangedCopyWith(SearchAddressChanged value,
          $Res Function(SearchAddressChanged) then) =
      _$SearchAddressChangedCopyWithImpl<$Res>;
  $Res call({String address});
}

/// @nodoc
class _$SearchAddressChangedCopyWithImpl<$Res>
    extends _$SearchViewEventCopyWithImpl<$Res>
    implements $SearchAddressChangedCopyWith<$Res> {
  _$SearchAddressChangedCopyWithImpl(
      SearchAddressChanged _value, $Res Function(SearchAddressChanged) _then)
      : super(_value, (v) => _then(v as SearchAddressChanged));

  @override
  SearchAddressChanged get _value => super._value as SearchAddressChanged;

  @override
  $Res call({
    Object? address = freezed,
  }) {
    return _then(SearchAddressChanged(
      address == freezed
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchAddressChanged implements SearchAddressChanged {
  const _$SearchAddressChanged(this.address);

  @override
  final String address;

  @override
  String toString() {
    return 'SearchViewEvent.searchAddressChanged(address: $address)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SearchAddressChanged &&
            (identical(other.address, address) ||
                const DeepCollectionEquality().equals(other.address, address)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(address);

  @JsonKey(ignore: true)
  @override
  $SearchAddressChangedCopyWith<SearchAddressChanged> get copyWith =>
      _$SearchAddressChangedCopyWithImpl<SearchAddressChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String address) searchAddressChanged,
    required TResult Function(dynamic hist) historialChanged,
    required TResult Function(dynamic prog) progressChanged,
    required TResult Function(String searchAddress, dynamic suggestionsSet)
        queryChanged,
    required TResult Function(
            GoogleMapController? mapController,
            FloatingSearchBarController? searchBarController,
            BuildContext mapblocContext,
            MapViewState mapblocState,
            BuildContext mapContext,
            String searchAddress,
            FiltrosState filtrosblocState)
        searchAndNavigate,
  }) {
    return searchAddressChanged(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String address)? searchAddressChanged,
    TResult Function(dynamic hist)? historialChanged,
    TResult Function(dynamic prog)? progressChanged,
    TResult Function(String searchAddress, dynamic suggestionsSet)?
        queryChanged,
    TResult Function(
            GoogleMapController? mapController,
            FloatingSearchBarController? searchBarController,
            BuildContext mapblocContext,
            MapViewState mapblocState,
            BuildContext mapContext,
            String searchAddress,
            FiltrosState filtrosblocState)?
        searchAndNavigate,
    required TResult orElse(),
  }) {
    if (searchAddressChanged != null) {
      return searchAddressChanged(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchAddressChanged value) searchAddressChanged,
    required TResult Function(HistorialChanged value) historialChanged,
    required TResult Function(ProgressChanged value) progressChanged,
    required TResult Function(QueryChanged value) queryChanged,
    required TResult Function(SearchAndNavigate value) searchAndNavigate,
  }) {
    return searchAddressChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchAddressChanged value)? searchAddressChanged,
    TResult Function(HistorialChanged value)? historialChanged,
    TResult Function(ProgressChanged value)? progressChanged,
    TResult Function(QueryChanged value)? queryChanged,
    TResult Function(SearchAndNavigate value)? searchAndNavigate,
    required TResult orElse(),
  }) {
    if (searchAddressChanged != null) {
      return searchAddressChanged(this);
    }
    return orElse();
  }
}

abstract class SearchAddressChanged implements SearchViewEvent {
  const factory SearchAddressChanged(String address) = _$SearchAddressChanged;

  String get address => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchAddressChangedCopyWith<SearchAddressChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistorialChangedCopyWith<$Res> {
  factory $HistorialChangedCopyWith(
          HistorialChanged value, $Res Function(HistorialChanged) then) =
      _$HistorialChangedCopyWithImpl<$Res>;
  $Res call({dynamic hist});
}

/// @nodoc
class _$HistorialChangedCopyWithImpl<$Res>
    extends _$SearchViewEventCopyWithImpl<$Res>
    implements $HistorialChangedCopyWith<$Res> {
  _$HistorialChangedCopyWithImpl(
      HistorialChanged _value, $Res Function(HistorialChanged) _then)
      : super(_value, (v) => _then(v as HistorialChanged));

  @override
  HistorialChanged get _value => super._value as HistorialChanged;

  @override
  $Res call({
    Object? hist = freezed,
  }) {
    return _then(HistorialChanged(
      hist == freezed
          ? _value.hist
          : hist // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$HistorialChanged implements HistorialChanged {
  const _$HistorialChanged(this.hist);

  @override
  final dynamic hist;

  @override
  String toString() {
    return 'SearchViewEvent.historialChanged(hist: $hist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is HistorialChanged &&
            (identical(other.hist, hist) ||
                const DeepCollectionEquality().equals(other.hist, hist)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(hist);

  @JsonKey(ignore: true)
  @override
  $HistorialChangedCopyWith<HistorialChanged> get copyWith =>
      _$HistorialChangedCopyWithImpl<HistorialChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String address) searchAddressChanged,
    required TResult Function(dynamic hist) historialChanged,
    required TResult Function(dynamic prog) progressChanged,
    required TResult Function(String searchAddress, dynamic suggestionsSet)
        queryChanged,
    required TResult Function(
            GoogleMapController? mapController,
            FloatingSearchBarController? searchBarController,
            BuildContext mapblocContext,
            MapViewState mapblocState,
            BuildContext mapContext,
            String searchAddress,
            FiltrosState filtrosblocState)
        searchAndNavigate,
  }) {
    return historialChanged(hist);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String address)? searchAddressChanged,
    TResult Function(dynamic hist)? historialChanged,
    TResult Function(dynamic prog)? progressChanged,
    TResult Function(String searchAddress, dynamic suggestionsSet)?
        queryChanged,
    TResult Function(
            GoogleMapController? mapController,
            FloatingSearchBarController? searchBarController,
            BuildContext mapblocContext,
            MapViewState mapblocState,
            BuildContext mapContext,
            String searchAddress,
            FiltrosState filtrosblocState)?
        searchAndNavigate,
    required TResult orElse(),
  }) {
    if (historialChanged != null) {
      return historialChanged(hist);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchAddressChanged value) searchAddressChanged,
    required TResult Function(HistorialChanged value) historialChanged,
    required TResult Function(ProgressChanged value) progressChanged,
    required TResult Function(QueryChanged value) queryChanged,
    required TResult Function(SearchAndNavigate value) searchAndNavigate,
  }) {
    return historialChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchAddressChanged value)? searchAddressChanged,
    TResult Function(HistorialChanged value)? historialChanged,
    TResult Function(ProgressChanged value)? progressChanged,
    TResult Function(QueryChanged value)? queryChanged,
    TResult Function(SearchAndNavigate value)? searchAndNavigate,
    required TResult orElse(),
  }) {
    if (historialChanged != null) {
      return historialChanged(this);
    }
    return orElse();
  }
}

abstract class HistorialChanged implements SearchViewEvent {
  const factory HistorialChanged(dynamic hist) = _$HistorialChanged;

  dynamic get hist => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HistorialChangedCopyWith<HistorialChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProgressChangedCopyWith<$Res> {
  factory $ProgressChangedCopyWith(
          ProgressChanged value, $Res Function(ProgressChanged) then) =
      _$ProgressChangedCopyWithImpl<$Res>;
  $Res call({dynamic prog});
}

/// @nodoc
class _$ProgressChangedCopyWithImpl<$Res>
    extends _$SearchViewEventCopyWithImpl<$Res>
    implements $ProgressChangedCopyWith<$Res> {
  _$ProgressChangedCopyWithImpl(
      ProgressChanged _value, $Res Function(ProgressChanged) _then)
      : super(_value, (v) => _then(v as ProgressChanged));

  @override
  ProgressChanged get _value => super._value as ProgressChanged;

  @override
  $Res call({
    Object? prog = freezed,
  }) {
    return _then(ProgressChanged(
      prog == freezed
          ? _value.prog
          : prog // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$ProgressChanged implements ProgressChanged {
  const _$ProgressChanged(this.prog);

  @override
  final dynamic prog;

  @override
  String toString() {
    return 'SearchViewEvent.progressChanged(prog: $prog)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ProgressChanged &&
            (identical(other.prog, prog) ||
                const DeepCollectionEquality().equals(other.prog, prog)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(prog);

  @JsonKey(ignore: true)
  @override
  $ProgressChangedCopyWith<ProgressChanged> get copyWith =>
      _$ProgressChangedCopyWithImpl<ProgressChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String address) searchAddressChanged,
    required TResult Function(dynamic hist) historialChanged,
    required TResult Function(dynamic prog) progressChanged,
    required TResult Function(String searchAddress, dynamic suggestionsSet)
        queryChanged,
    required TResult Function(
            GoogleMapController? mapController,
            FloatingSearchBarController? searchBarController,
            BuildContext mapblocContext,
            MapViewState mapblocState,
            BuildContext mapContext,
            String searchAddress,
            FiltrosState filtrosblocState)
        searchAndNavigate,
  }) {
    return progressChanged(prog);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String address)? searchAddressChanged,
    TResult Function(dynamic hist)? historialChanged,
    TResult Function(dynamic prog)? progressChanged,
    TResult Function(String searchAddress, dynamic suggestionsSet)?
        queryChanged,
    TResult Function(
            GoogleMapController? mapController,
            FloatingSearchBarController? searchBarController,
            BuildContext mapblocContext,
            MapViewState mapblocState,
            BuildContext mapContext,
            String searchAddress,
            FiltrosState filtrosblocState)?
        searchAndNavigate,
    required TResult orElse(),
  }) {
    if (progressChanged != null) {
      return progressChanged(prog);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchAddressChanged value) searchAddressChanged,
    required TResult Function(HistorialChanged value) historialChanged,
    required TResult Function(ProgressChanged value) progressChanged,
    required TResult Function(QueryChanged value) queryChanged,
    required TResult Function(SearchAndNavigate value) searchAndNavigate,
  }) {
    return progressChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchAddressChanged value)? searchAddressChanged,
    TResult Function(HistorialChanged value)? historialChanged,
    TResult Function(ProgressChanged value)? progressChanged,
    TResult Function(QueryChanged value)? queryChanged,
    TResult Function(SearchAndNavigate value)? searchAndNavigate,
    required TResult orElse(),
  }) {
    if (progressChanged != null) {
      return progressChanged(this);
    }
    return orElse();
  }
}

abstract class ProgressChanged implements SearchViewEvent {
  const factory ProgressChanged(dynamic prog) = _$ProgressChanged;

  dynamic get prog => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProgressChangedCopyWith<ProgressChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QueryChangedCopyWith<$Res> {
  factory $QueryChangedCopyWith(
          QueryChanged value, $Res Function(QueryChanged) then) =
      _$QueryChangedCopyWithImpl<$Res>;
  $Res call({String searchAddress, dynamic suggestionsSet});
}

/// @nodoc
class _$QueryChangedCopyWithImpl<$Res>
    extends _$SearchViewEventCopyWithImpl<$Res>
    implements $QueryChangedCopyWith<$Res> {
  _$QueryChangedCopyWithImpl(
      QueryChanged _value, $Res Function(QueryChanged) _then)
      : super(_value, (v) => _then(v as QueryChanged));

  @override
  QueryChanged get _value => super._value as QueryChanged;

  @override
  $Res call({
    Object? searchAddress = freezed,
    Object? suggestionsSet = freezed,
  }) {
    return _then(QueryChanged(
      searchAddress == freezed
          ? _value.searchAddress
          : searchAddress // ignore: cast_nullable_to_non_nullable
              as String,
      suggestionsSet == freezed
          ? _value.suggestionsSet
          : suggestionsSet // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$QueryChanged implements QueryChanged {
  const _$QueryChanged(this.searchAddress, this.suggestionsSet);

  @override
  final String searchAddress;
  @override
  final dynamic suggestionsSet;

  @override
  String toString() {
    return 'SearchViewEvent.queryChanged(searchAddress: $searchAddress, suggestionsSet: $suggestionsSet)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is QueryChanged &&
            (identical(other.searchAddress, searchAddress) ||
                const DeepCollectionEquality()
                    .equals(other.searchAddress, searchAddress)) &&
            (identical(other.suggestionsSet, suggestionsSet) ||
                const DeepCollectionEquality()
                    .equals(other.suggestionsSet, suggestionsSet)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(searchAddress) ^
      const DeepCollectionEquality().hash(suggestionsSet);

  @JsonKey(ignore: true)
  @override
  $QueryChangedCopyWith<QueryChanged> get copyWith =>
      _$QueryChangedCopyWithImpl<QueryChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String address) searchAddressChanged,
    required TResult Function(dynamic hist) historialChanged,
    required TResult Function(dynamic prog) progressChanged,
    required TResult Function(String searchAddress, dynamic suggestionsSet)
        queryChanged,
    required TResult Function(
            GoogleMapController? mapController,
            FloatingSearchBarController? searchBarController,
            BuildContext mapblocContext,
            MapViewState mapblocState,
            BuildContext mapContext,
            String searchAddress,
            FiltrosState filtrosblocState)
        searchAndNavigate,
  }) {
    return queryChanged(searchAddress, suggestionsSet);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String address)? searchAddressChanged,
    TResult Function(dynamic hist)? historialChanged,
    TResult Function(dynamic prog)? progressChanged,
    TResult Function(String searchAddress, dynamic suggestionsSet)?
        queryChanged,
    TResult Function(
            GoogleMapController? mapController,
            FloatingSearchBarController? searchBarController,
            BuildContext mapblocContext,
            MapViewState mapblocState,
            BuildContext mapContext,
            String searchAddress,
            FiltrosState filtrosblocState)?
        searchAndNavigate,
    required TResult orElse(),
  }) {
    if (queryChanged != null) {
      return queryChanged(searchAddress, suggestionsSet);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchAddressChanged value) searchAddressChanged,
    required TResult Function(HistorialChanged value) historialChanged,
    required TResult Function(ProgressChanged value) progressChanged,
    required TResult Function(QueryChanged value) queryChanged,
    required TResult Function(SearchAndNavigate value) searchAndNavigate,
  }) {
    return queryChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchAddressChanged value)? searchAddressChanged,
    TResult Function(HistorialChanged value)? historialChanged,
    TResult Function(ProgressChanged value)? progressChanged,
    TResult Function(QueryChanged value)? queryChanged,
    TResult Function(SearchAndNavigate value)? searchAndNavigate,
    required TResult orElse(),
  }) {
    if (queryChanged != null) {
      return queryChanged(this);
    }
    return orElse();
  }
}

abstract class QueryChanged implements SearchViewEvent {
  const factory QueryChanged(String searchAddress, dynamic suggestionsSet) =
      _$QueryChanged;

  String get searchAddress => throw _privateConstructorUsedError;
  dynamic get suggestionsSet => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $QueryChangedCopyWith<QueryChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchAndNavigateCopyWith<$Res> {
  factory $SearchAndNavigateCopyWith(
          SearchAndNavigate value, $Res Function(SearchAndNavigate) then) =
      _$SearchAndNavigateCopyWithImpl<$Res>;
  $Res call(
      {GoogleMapController? mapController,
      FloatingSearchBarController? searchBarController,
      BuildContext mapblocContext,
      MapViewState mapblocState,
      BuildContext mapContext,
      String searchAddress,
      FiltrosState filtrosblocState});

  $MapViewStateCopyWith<$Res> get mapblocState;
  $FiltrosStateCopyWith<$Res> get filtrosblocState;
}

/// @nodoc
class _$SearchAndNavigateCopyWithImpl<$Res>
    extends _$SearchViewEventCopyWithImpl<$Res>
    implements $SearchAndNavigateCopyWith<$Res> {
  _$SearchAndNavigateCopyWithImpl(
      SearchAndNavigate _value, $Res Function(SearchAndNavigate) _then)
      : super(_value, (v) => _then(v as SearchAndNavigate));

  @override
  SearchAndNavigate get _value => super._value as SearchAndNavigate;

  @override
  $Res call({
    Object? mapController = freezed,
    Object? searchBarController = freezed,
    Object? mapblocContext = freezed,
    Object? mapblocState = freezed,
    Object? mapContext = freezed,
    Object? searchAddress = freezed,
    Object? filtrosblocState = freezed,
  }) {
    return _then(SearchAndNavigate(
      mapController == freezed
          ? _value.mapController
          : mapController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
      searchBarController == freezed
          ? _value.searchBarController
          : searchBarController // ignore: cast_nullable_to_non_nullable
              as FloatingSearchBarController?,
      mapblocContext == freezed
          ? _value.mapblocContext
          : mapblocContext // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      mapblocState == freezed
          ? _value.mapblocState
          : mapblocState // ignore: cast_nullable_to_non_nullable
              as MapViewState,
      mapContext == freezed
          ? _value.mapContext
          : mapContext // ignore: cast_nullable_to_non_nullable
              as BuildContext,
      searchAddress == freezed
          ? _value.searchAddress
          : searchAddress // ignore: cast_nullable_to_non_nullable
              as String,
      filtrosblocState == freezed
          ? _value.filtrosblocState
          : filtrosblocState // ignore: cast_nullable_to_non_nullable
              as FiltrosState,
    ));
  }

  @override
  $MapViewStateCopyWith<$Res> get mapblocState {
    return $MapViewStateCopyWith<$Res>(_value.mapblocState, (value) {
      return _then(_value.copyWith(mapblocState: value));
    });
  }

  @override
  $FiltrosStateCopyWith<$Res> get filtrosblocState {
    return $FiltrosStateCopyWith<$Res>(_value.filtrosblocState, (value) {
      return _then(_value.copyWith(filtrosblocState: value));
    });
  }
}

/// @nodoc

class _$SearchAndNavigate implements SearchAndNavigate {
  const _$SearchAndNavigate(
      this.mapController,
      this.searchBarController,
      this.mapblocContext,
      this.mapblocState,
      this.mapContext,
      this.searchAddress,
      this.filtrosblocState);

  @override
  final GoogleMapController? mapController;
  @override
  final FloatingSearchBarController? searchBarController;
  @override
  final BuildContext mapblocContext;
  @override
  final MapViewState mapblocState;
  @override
  final BuildContext mapContext;
  @override
  final String searchAddress;
  @override
  final FiltrosState filtrosblocState;

  @override
  String toString() {
    return 'SearchViewEvent.searchAndNavigate(mapController: $mapController, searchBarController: $searchBarController, mapblocContext: $mapblocContext, mapblocState: $mapblocState, mapContext: $mapContext, searchAddress: $searchAddress, filtrosblocState: $filtrosblocState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SearchAndNavigate &&
            (identical(other.mapController, mapController) ||
                const DeepCollectionEquality()
                    .equals(other.mapController, mapController)) &&
            (identical(other.searchBarController, searchBarController) ||
                const DeepCollectionEquality()
                    .equals(other.searchBarController, searchBarController)) &&
            (identical(other.mapblocContext, mapblocContext) ||
                const DeepCollectionEquality()
                    .equals(other.mapblocContext, mapblocContext)) &&
            (identical(other.mapblocState, mapblocState) ||
                const DeepCollectionEquality()
                    .equals(other.mapblocState, mapblocState)) &&
            (identical(other.mapContext, mapContext) ||
                const DeepCollectionEquality()
                    .equals(other.mapContext, mapContext)) &&
            (identical(other.searchAddress, searchAddress) ||
                const DeepCollectionEquality()
                    .equals(other.searchAddress, searchAddress)) &&
            (identical(other.filtrosblocState, filtrosblocState) ||
                const DeepCollectionEquality()
                    .equals(other.filtrosblocState, filtrosblocState)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(mapController) ^
      const DeepCollectionEquality().hash(searchBarController) ^
      const DeepCollectionEquality().hash(mapblocContext) ^
      const DeepCollectionEquality().hash(mapblocState) ^
      const DeepCollectionEquality().hash(mapContext) ^
      const DeepCollectionEquality().hash(searchAddress) ^
      const DeepCollectionEquality().hash(filtrosblocState);

  @JsonKey(ignore: true)
  @override
  $SearchAndNavigateCopyWith<SearchAndNavigate> get copyWith =>
      _$SearchAndNavigateCopyWithImpl<SearchAndNavigate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String address) searchAddressChanged,
    required TResult Function(dynamic hist) historialChanged,
    required TResult Function(dynamic prog) progressChanged,
    required TResult Function(String searchAddress, dynamic suggestionsSet)
        queryChanged,
    required TResult Function(
            GoogleMapController? mapController,
            FloatingSearchBarController? searchBarController,
            BuildContext mapblocContext,
            MapViewState mapblocState,
            BuildContext mapContext,
            String searchAddress,
            FiltrosState filtrosblocState)
        searchAndNavigate,
  }) {
    return searchAndNavigate(mapController, searchBarController, mapblocContext,
        mapblocState, mapContext, searchAddress, filtrosblocState);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String address)? searchAddressChanged,
    TResult Function(dynamic hist)? historialChanged,
    TResult Function(dynamic prog)? progressChanged,
    TResult Function(String searchAddress, dynamic suggestionsSet)?
        queryChanged,
    TResult Function(
            GoogleMapController? mapController,
            FloatingSearchBarController? searchBarController,
            BuildContext mapblocContext,
            MapViewState mapblocState,
            BuildContext mapContext,
            String searchAddress,
            FiltrosState filtrosblocState)?
        searchAndNavigate,
    required TResult orElse(),
  }) {
    if (searchAndNavigate != null) {
      return searchAndNavigate(
          mapController,
          searchBarController,
          mapblocContext,
          mapblocState,
          mapContext,
          searchAddress,
          filtrosblocState);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SearchAddressChanged value) searchAddressChanged,
    required TResult Function(HistorialChanged value) historialChanged,
    required TResult Function(ProgressChanged value) progressChanged,
    required TResult Function(QueryChanged value) queryChanged,
    required TResult Function(SearchAndNavigate value) searchAndNavigate,
  }) {
    return searchAndNavigate(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SearchAddressChanged value)? searchAddressChanged,
    TResult Function(HistorialChanged value)? historialChanged,
    TResult Function(ProgressChanged value)? progressChanged,
    TResult Function(QueryChanged value)? queryChanged,
    TResult Function(SearchAndNavigate value)? searchAndNavigate,
    required TResult orElse(),
  }) {
    if (searchAndNavigate != null) {
      return searchAndNavigate(this);
    }
    return orElse();
  }
}

abstract class SearchAndNavigate implements SearchViewEvent {
  const factory SearchAndNavigate(
      GoogleMapController? mapController,
      FloatingSearchBarController? searchBarController,
      BuildContext mapblocContext,
      MapViewState mapblocState,
      BuildContext mapContext,
      String searchAddress,
      FiltrosState filtrosblocState) = _$SearchAndNavigate;

  GoogleMapController? get mapController => throw _privateConstructorUsedError;
  FloatingSearchBarController? get searchBarController =>
      throw _privateConstructorUsedError;
  BuildContext get mapblocContext => throw _privateConstructorUsedError;
  MapViewState get mapblocState => throw _privateConstructorUsedError;
  BuildContext get mapContext => throw _privateConstructorUsedError;
  String get searchAddress => throw _privateConstructorUsedError;
  FiltrosState get filtrosblocState => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SearchAndNavigateCopyWith<SearchAndNavigate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$SearchViewStateTearOff {
  const _$SearchViewStateTearOff();

  _SearchViewState call(
      {required String searchAddress,
      required dynamic historial,
      required dynamic progress}) {
    return _SearchViewState(
      searchAddress: searchAddress,
      historial: historial,
      progress: progress,
    );
  }
}

/// @nodoc
const $SearchViewState = _$SearchViewStateTearOff();

/// @nodoc
mixin _$SearchViewState {
  String get searchAddress => throw _privateConstructorUsedError;
  dynamic get historial => throw _privateConstructorUsedError;
  dynamic get progress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchViewStateCopyWith<SearchViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchViewStateCopyWith<$Res> {
  factory $SearchViewStateCopyWith(
          SearchViewState value, $Res Function(SearchViewState) then) =
      _$SearchViewStateCopyWithImpl<$Res>;
  $Res call({String searchAddress, dynamic historial, dynamic progress});
}

/// @nodoc
class _$SearchViewStateCopyWithImpl<$Res>
    implements $SearchViewStateCopyWith<$Res> {
  _$SearchViewStateCopyWithImpl(this._value, this._then);

  final SearchViewState _value;
  // ignore: unused_field
  final $Res Function(SearchViewState) _then;

  @override
  $Res call({
    Object? searchAddress = freezed,
    Object? historial = freezed,
    Object? progress = freezed,
  }) {
    return _then(_value.copyWith(
      searchAddress: searchAddress == freezed
          ? _value.searchAddress
          : searchAddress // ignore: cast_nullable_to_non_nullable
              as String,
      historial: historial == freezed
          ? _value.historial
          : historial // ignore: cast_nullable_to_non_nullable
              as dynamic,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$SearchViewStateCopyWith<$Res>
    implements $SearchViewStateCopyWith<$Res> {
  factory _$SearchViewStateCopyWith(
          _SearchViewState value, $Res Function(_SearchViewState) then) =
      __$SearchViewStateCopyWithImpl<$Res>;
  @override
  $Res call({String searchAddress, dynamic historial, dynamic progress});
}

/// @nodoc
class __$SearchViewStateCopyWithImpl<$Res>
    extends _$SearchViewStateCopyWithImpl<$Res>
    implements _$SearchViewStateCopyWith<$Res> {
  __$SearchViewStateCopyWithImpl(
      _SearchViewState _value, $Res Function(_SearchViewState) _then)
      : super(_value, (v) => _then(v as _SearchViewState));

  @override
  _SearchViewState get _value => super._value as _SearchViewState;

  @override
  $Res call({
    Object? searchAddress = freezed,
    Object? historial = freezed,
    Object? progress = freezed,
  }) {
    return _then(_SearchViewState(
      searchAddress: searchAddress == freezed
          ? _value.searchAddress
          : searchAddress // ignore: cast_nullable_to_non_nullable
              as String,
      historial: historial == freezed
          ? _value.historial
          : historial // ignore: cast_nullable_to_non_nullable
              as dynamic,
      progress: progress == freezed
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$_SearchViewState implements _SearchViewState {
  const _$_SearchViewState(
      {required this.searchAddress,
      required this.historial,
      required this.progress});

  @override
  final String searchAddress;
  @override
  final dynamic historial;
  @override
  final dynamic progress;

  @override
  String toString() {
    return 'SearchViewState(searchAddress: $searchAddress, historial: $historial, progress: $progress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SearchViewState &&
            (identical(other.searchAddress, searchAddress) ||
                const DeepCollectionEquality()
                    .equals(other.searchAddress, searchAddress)) &&
            (identical(other.historial, historial) ||
                const DeepCollectionEquality()
                    .equals(other.historial, historial)) &&
            (identical(other.progress, progress) ||
                const DeepCollectionEquality()
                    .equals(other.progress, progress)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(searchAddress) ^
      const DeepCollectionEquality().hash(historial) ^
      const DeepCollectionEquality().hash(progress);

  @JsonKey(ignore: true)
  @override
  _$SearchViewStateCopyWith<_SearchViewState> get copyWith =>
      __$SearchViewStateCopyWithImpl<_SearchViewState>(this, _$identity);
}

abstract class _SearchViewState implements SearchViewState {
  const factory _SearchViewState(
      {required String searchAddress,
      required dynamic historial,
      required dynamic progress}) = _$_SearchViewState;

  @override
  String get searchAddress => throw _privateConstructorUsedError;
  @override
  dynamic get historial => throw _privateConstructorUsedError;
  @override
  dynamic get progress => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SearchViewStateCopyWith<_SearchViewState> get copyWith =>
      throw _privateConstructorUsedError;
}
