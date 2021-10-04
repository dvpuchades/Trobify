part of 'map_view_bloc.dart';

@freezed
class MapViewState with _$MapViewState {
  const factory MapViewState(
      {required Set<Marker> markers,
      required List<Inmueble> inmuebles,
      required double refreshOpacity,
      required LatLng myLocation,
      required ScrollController scrollController,
      GoogleMapController? mapController,
      StreamSubscription? subscription,
      required bool onmap}) = _MapViewState;

  factory MapViewState.initial() => MapViewState(
        markers: {},
        onmap: false,
        inmuebles: [],
        refreshOpacity: 0.0,
        scrollController: ScrollController(),
        myLocation: LatLng(10, -10),
      );
}
