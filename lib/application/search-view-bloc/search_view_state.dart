part of 'search_view_bloc.dart';

@freezed
class SearchViewState with _$SearchViewState {
  const factory SearchViewState({
    required String searchAddress,
    required dynamic historial,
    required dynamic progress,
  }) = _SearchViewState;

  factory SearchViewState.initial() => SearchViewState(
        searchAddress: '',
        historial: <PlaceSearch>[],
        progress: false,
      );
}
