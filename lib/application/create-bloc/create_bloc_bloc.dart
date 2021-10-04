import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:trobify/domain/entities/inmuebles.dart';
import 'package:path/path.dart';
import 'package:trobify/domain/entities/user.dart';
import 'package:trobify/domain/map/place.dart';

part 'create_bloc_event.dart';
part 'create_bloc_state.dart';
part 'create_bloc_bloc.freezed.dart';

class CreateBlocBloc extends Bloc<CreateBlocEvent, CreateBlocState> {
  CreateBlocBloc() : super(CreateBlocState.initial());

  CreateBlocBloc.modif(Inmueble inmueble) : super(CreateBlocState.modif(inmueble));

  @override
  Stream<CreateBlocState> mapEventToState(
    CreateBlocEvent event,
  ) async* {
    yield* event.map(
      setInmueble: (e) async* {
        yield state.copyWith(
            inmuebleID: e.inmueble.inmuebleID,
            idPropietario: e.inmueble.idPropietario,
            ciudad: e.inmueble.ciudad,
            codigoPostal: e.inmueble.codigoPostal,
            descripcion: e.inmueble.descripcion,
            direccion: e.inmueble.direccion,
            disponibilidad: e.inmueble.disponibilidad,
            formatoPrecio: e.inmueble.formatoPrecio,
            fotos: e.inmueble.fotos,
            nBanyos: e.inmueble.nBanyos,
            nDormitorios: e.inmueble.nDormitorios,
            precio: e.inmueble.precio,
            servicios: e.inmueble.servicios,
            superficie: e.inmueble.superficie,
            tipoOperacion: e.inmueble.tipoOperacion,
            tipoInmueble: e.inmueble.tipoInmueble,
            ubicacion: e.inmueble.ubicacion);
      },
      inmuebleIDChanged: (e) async* {
        yield state.copyWith(
          inmuebleID: e.inmuebleID,
        );
      },
      idPropietarioChanged: (e) async* {
        yield state.copyWith(
          idPropietario: e.idPropietario,
        );
      },
      modifImageListChanged: (e) async* {
        await Future.forEach(e.imageList, (File element) async {
          final fileName = basename(element.path);
          final storageReference = FirebaseStorage.instance.ref().child(fileName);
          final uploadTask = storageReference.putFile(element);
          await uploadTask.then((result) async {
            await FirebaseStorage.instance
                .ref()
                .child(fileName)
                .getDownloadURL()
                .then((value) => e.photosRefList.add(value));
          }).onError(
            (error, stackTrace) {
              e.photosRefList.add('');
            },
          );
        });
        yield state.copyWith(imageList: e.imageList, fotos: e.photosRefList);
      },
      imageListChanged: (e) async* {
        var photosRefList = <String>[];

        await Future.forEach(e.imageList, (File element) async {
          final fileName = basename(element.path);
          final storageReference = FirebaseStorage.instance.ref().child(fileName);
          final uploadTask = storageReference.putFile(element);
          await uploadTask.then((result) async {
            await FirebaseStorage.instance
                .ref()
                .child(fileName)
                .getDownloadURL()
                .then((value) => photosRefList.add(value));
          }).onError(
            (error, stackTrace) {
              photosRefList.add('');
            },
          );
        });
        yield state.copyWith(imageList: e.imageList, fotos: photosRefList);
      },
      ciudadChanged: (e) async* {
        yield state.copyWith(
          ciudad: e.ciudad,
        );
      },
      direccionChanged: (e) async* {
        yield state.copyWith(
          direccion: e.direccion,
        );
      },
      codigoPostalChanged: (e) async* {
        yield state.copyWith(
          codigoPostal: e.codigoPostal,
        );
      },
      descripcionChanged: (e) async* {
        yield state.copyWith(
          descripcion: e.descripcion,
        );
      },
      disponibilidadChanged: (e) async* {
        yield state.copyWith(
          disponibilidad: e.disponibilidad,
        );
      },
      precioChanged: (e) async* {
        yield state.copyWith(
          precio: e.precio,
        );
      },
      superficieChanged: (e) async* {
        yield state.copyWith(
          superficie: e.superficie,
        );
      },
      serviciosChanged: (e) async* {
        var servicios = <String>[];
        e.servicios.forEach((element) {
          if (!servicios.contains(element)) {
            servicios.add(element);
          }
        });
        yield state.copyWith(
          servicios: servicios,
        );
      },
      nDormitoriosChanged: (e) async* {
        yield state.copyWith(
          nDormitorios: e.nDormitorios,
        );
      },
      nBanyosChanged: (e) async* {
        yield state.copyWith(
          nBanyos: e.nBanyos,
        );
      },
      tipoInmuebleChanged: (e) async* {
        yield state.copyWith(
          tipoInmueble: e.tipoInmueble,
        );
      },
      tipoOperacionChanged: (e) async* {
        yield state.copyWith(
          tipoOperacion: e.tipoOperacion,
        );
      },
      formatoPrecioChanged: (e) async* {
        yield state.copyWith(
          formatoPrecio: e.formatoPrecio,
        );
      },
      ubicacionChanged: (e) async* {
        yield state.copyWith(
          ubicacion: GeoFirePoint(
            e.place.geometry.location.lat,
            e.place.geometry.location.lng,
          ),
        );
      },
      submitChanges: (e) async* {
        Inmueble.insertInmueble(Inmueble(
          inmuebleID: state.inmuebleID,
          ubicacion: state.ubicacion,
          ciudad: state.ciudad,
          codigoPostal: state.codigoPostal,
          descripcion: state.descripcion,
          direccion: state.direccion,
          disponibilidad: state.disponibilidad,
          formatoPrecio: (state.tipoOperacion == 'Alquiler') ? 30 : 99,
          fotos: state.fotos,
          servicios: state.servicios,
          superficie: state.superficie,
          precio: state.precio,
          idPropietario: state.idPropietario,
          nBanyos: state.nBanyos,
          nDormitorios: state.nDormitorios,
          tipoOperacion: state.tipoOperacion,
          tipoInmueble: state.tipoInmueble,
        ));
      },
      replaceChanges: (e) async* {
        var userData = User();
        var modifiedInmueble = Inmueble(
          inmuebleID: state.inmuebleID,
          ubicacion: state.ubicacion,
          ciudad: state.ciudad,
          codigoPostal: state.codigoPostal,
          descripcion: state.descripcion,
          direccion: state.direccion,
          disponibilidad: state.disponibilidad,
          formatoPrecio: (state.tipoOperacion == 'Alquiler') ? 30 : 99,
          fotos: state.fotos,
          servicios: state.servicios,
          superficie: state.superficie,
          precio: state.precio,
          idPropietario: state.idPropietario,
          nBanyos: state.nBanyos,
          nDormitorios: state.nDormitorios,
          tipoOperacion: state.tipoOperacion,
          tipoInmueble: state.tipoInmueble,
        );
        Inmueble.modifyInmueble(modifiedInmueble);
        userData.getPropList().insert(0, modifiedInmueble);
      },
    );
  }
}
