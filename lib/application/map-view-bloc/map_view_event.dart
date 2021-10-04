part of 'map_view_bloc.dart';

@freezed
class MapViewEvent with _$MapViewEvent {
  const factory MapViewEvent.onMapCreated(GoogleMapController mapController, BuildContext context) = OnMapCreated;
  const factory MapViewEvent.goToMap(bool onmap) = GoToMap;
  const factory MapViewEvent.onMapMoved() = OnMapMoved;
  const factory MapViewEvent.refreshItems(BuildContext context, FiltrosState state) = RefreshItems;
  const factory MapViewEvent.setStartLocation(String placeId) = SetStartLocation;
}
