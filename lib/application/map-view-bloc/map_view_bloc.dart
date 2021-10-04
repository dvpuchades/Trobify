import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trobify/application/filtros-bloc/filtros_bloc.dart';
import 'package:trobify/domain/entities/inmuebles.dart';
import 'package:trobify/domain/map/marker.dart';
import 'package:trobify/domain/filters/filters.dart';
import 'package:trobify/domain/map/places_service.dart';
import 'package:trobify/infrastructure/core/firebase_inmueble.dart';
import 'package:trobify/presentation/card-view/card_template.dart';

part 'map_view_event.dart';
part 'map_view_state.dart';
part 'map_view_bloc.freezed.dart';

class MapViewBloc extends Bloc<MapViewEvent, MapViewState> {
  MapViewBloc() : super(MapViewState.initial());
  var loc = LatLng(0, 0);

  @override
  Stream<MapViewState> mapEventToState(
    MapViewEvent event,
  ) async* {
    yield* event.map(
      goToMap: (e) async* {
        yield state.copyWith(
          onmap: e.onmap,
        );
      },
      onMapCreated: (e) async* {
        await e.mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: state.myLocation,
          zoom: 13,
        )));

        yield state.copyWith(
          refreshOpacity: 0.0,
          mapController: e.mapController,
        );
      },
      onMapMoved: (e) async* {
        yield state.copyWith(refreshOpacity: 1.0);
      },
      refreshItems: (e) async* {
        var docs = await query(e);
        var filtros = Filter(documentList: docs);
        filtros.filtrarTodo(e.state);

        yield state.copyWith(
          refreshOpacity: 0.0,
          myLocation: loc,
          markers: await _updateMarkers(docs, e.context),
          inmuebles: _updateList(docs),
        );
      },
      setStartLocation: (e) async* {
        var location = (await PlacesService().getPlace(e.placeId)).geometry.location;

        yield state.copyWith(
          myLocation: LatLng(location.lat, location.lng),
        );
      },
    );
  }

  Future<List<DocumentSnapshot>> query(dynamic e) async {
    final _firestore = FirebaseFirestore.instance;
    final geo = Geoflutterfire();

    var collectionRef = _firestore.collection('inmuebles').limit(15);
    var geoRef = geo.collection(collectionRef: collectionRef);

    var middleWith = (MediaQuery.of(e.context).size.width * MediaQuery.of(e.context).devicePixelRatio / 2).round();
    var middleHeight = (MediaQuery.of(e.context).size.height * MediaQuery.of(e.context).devicePixelRatio / 2).round();

    var cameraCenter = await state.mapController!.getLatLng(
      ScreenCoordinate(
        x: middleWith,
        y: middleHeight,
      ),
    );
    loc = cameraCenter;
    var cameraSide = await state.mapController!.getLatLng(
      ScreenCoordinate(x: 0, y: middleHeight),
    );

    var center = geo.point(latitude: cameraCenter.latitude, longitude: cameraCenter.longitude);
    var radius = center.distance(lat: cameraSide.latitude, lng: cameraSide.longitude);

    return await geoRef
        .within(
          center: center,
          radius: radius * 1.5,
          field: 'ubicacion',
          strictMode: true,
        )
        .first;
  }

  Future<Set<Marker>> _updateMarkers(List<DocumentSnapshot> documentList, BuildContext context) async {
    var markers = <Marker>{};

    await Future.forEach(documentList, (DocumentSnapshot doc) async {
      var bitmapData = await createPriceMarker(125, 90, compactarPrecio(doc['precio']) + '€');
      var position = LatLng(
        doc['ubicacion']['geopoint'].latitude,
        doc['ubicacion']['geopoint'].longitude,
      );

      markers.add(Marker(
        markerId: MarkerId(doc.id),
        position: position,
        visible: true,
        onTap: () {
          state.mapController!.animateCamera(CameraUpdate.newLatLngZoom(position, 16));

          var i = state.inmuebles.indexWhere((element) => element.inmuebleID == doc.id);

          state.scrollController.animateTo(MediaQuery.of(context).size.width * i,
              duration: Duration(milliseconds: 500), curve: Curves.easeIn);
        },
        icon: BitmapDescriptor.fromBytes(bitmapData),
      ));
    });
    return markers;
  }

  List<Inmueble> _updateList(List<DocumentSnapshot> docs) {
    var inmuebles = <Inmueble>[];
    docs.forEach((doc) {
      inmuebles.add(FirebaseInmueble.inmueblefromJson(doc));
    });

    return inmuebles;
  }
}
