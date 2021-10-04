import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:trobify/infrastructure/core/firebase_inmueble.dart';

class Inmueble {
  late String inmuebleID;
  late GeoFirePoint ubicacion;
  late String ciudad;
  late int codigoPostal;
  late String descripcion;
  late String direccion;
  late DateTime disponibilidad;
  late int formatoPrecio;
  late List<String?> fotos;
  late List<String> servicios;
  late double superficie;
  late double precio;
  late String idPropietario;
  late int nBanyos;
  late int nDormitorios;
  late String tipoOperacion;
  late String tipoInmueble;

  Inmueble({
    required this.inmuebleID,
    required this.ubicacion,
    required this.ciudad,
    required this.codigoPostal,
    required this.descripcion,
    required this.direccion,
    required this.disponibilidad,
    required this.formatoPrecio,
    required this.fotos,
    required this.servicios,
    required this.superficie,
    required this.precio,
    required this.idPropietario,
    required this.nBanyos,
    required this.nDormitorios,
    required this.tipoOperacion,
    required this.tipoInmueble,
  });

  static void removeOnFirebase(Inmueble removed) {
    FirebaseInmueble(firestore: FirebaseFirestore.instance).removeInmuebleOnFirebase(removed);
  }

  static void modifyInmueble(Inmueble modInmueble) {
    FirebaseInmueble(firestore: FirebaseFirestore.instance).modifyInmuebleOnFirebase(modInmueble);
  }

  static void insertInmueble(Inmueble newInmueble) {
    FirebaseInmueble(firestore: FirebaseFirestore.instance).insertInmuebleOnFirebase(newInmueble);
  }

  static void removePhotoOnFirebase(Inmueble inmueble, String photoURL) {
    FirebaseInmueble(firestore: FirebaseFirestore.instance).removePhotoOnFirebase(inmueble, photoURL);
  }
}
