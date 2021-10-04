part of 'search_view_bloc.dart';

@freezed
class SearchViewEvent with _$SearchViewEvent {
  const factory SearchViewEvent.searchAddressChanged(String address) = SearchAddressChanged;
  const factory SearchViewEvent.historialChanged(dynamic hist) = HistorialChanged;
  const factory SearchViewEvent.progressChanged(dynamic prog) = ProgressChanged;
  const factory SearchViewEvent.queryChanged(String searchAddress, dynamic suggestionsSet) = QueryChanged;
  const factory SearchViewEvent.searchAndNavigate(
      GoogleMapController? mapController,
      FloatingSearchBarController? searchBarController,
      BuildContext mapblocContext,
      MapViewState mapblocState,
      BuildContext mapContext,
      String searchAddress,
      FiltrosState filtrosblocState) = SearchAndNavigate;
}
