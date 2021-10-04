import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:trobify/application/filtros-bloc/filtros_bloc.dart';
import 'package:trobify/domain/map/place_search.dart';
import 'package:trobify/domain/map/places_service.dart';
import 'package:trobify/application/map-view-bloc/map_view_bloc.dart';

part 'search_view_event.dart';
part 'search_view_state.dart';
part 'search_view_bloc.freezed.dart';

const HERE_API_KEY = 'lYN2gtrfIN1z8W3vRrKrkjjuA9YMBb6wR2eJRFhY_P0';

class SearchViewBloc extends Bloc<SearchViewEvent, SearchViewState> {
  SearchViewBloc() : super(SearchViewState.initial());

  @override
  Stream<SearchViewState> mapEventToState(
    SearchViewEvent event,
  ) async* {
    yield* event.map(
      searchAddressChanged: (e) async* {
        yield state.copyWith(
          searchAddress: e.address,
        );
      },
      historialChanged: (e) async* {
        yield state.copyWith(
          historial: e.hist,
        );
      },
      progressChanged: (e) async* {
        yield state.copyWith(
          progress: e.prog,
        );
      },
      searchAndNavigate: (e) async* {
        await searchAndNavigate(e.mapController, e.searchBarController, e.mapblocContext, e.mapblocState, e.mapContext,
            e.searchAddress, e.filtrosblocState);
      },
      queryChanged: (e) async* {
        await handleSearchQueryChanged(e.searchAddress, e.suggestionsSet);
        yield state.copyWith(
          searchAddress: e.searchAddress,
          progress: false,
        );
      },
    );
  }

  Future<void> searchAndNavigate(
      GoogleMapController? mapController,
      FloatingSearchBarController? searchBarController,
      BuildContext mapblocContext,
      MapViewState mapblocState,
      BuildContext mapContext,
      String searchAddress,
      FiltrosState filtrosblocState) async {
    if (searchBarController != null) searchBarController.close();
    if (searchAddress.isEmpty) return;

    await PlacesService().getPlace(searchAddress).then((value) {
      var auxLoc = LatLng(value.geometry.location.lat, value.geometry.location.lng);
      mapController!.animateCamera(
        CameraUpdate.newLatLng(auxLoc),
      );
      mapblocContext.read<MapViewBloc>().add(MapViewEvent.setStartLocation(searchAddress));
    }).whenComplete(() {
      Future.delayed(Duration(seconds: 2)).then((value) {
        mapblocState.copyWith(refreshOpacity: 0.0);
        mapblocContext.read<MapViewBloc>().add(MapViewEvent.refreshItems(mapContext, filtrosblocState));
      });
    });
  }

  Future<void> handleSearchQueryChanged(String searchAddress, Set<PlaceSearch> suggestionsSet) async {
    suggestionsSet.clear();
    if (searchAddress.isNotEmpty) {
      suggestionsSet.addAll(await PlacesService().getAutocomplete(searchAddress));
    }
  }
}
