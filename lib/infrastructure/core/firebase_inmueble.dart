import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geoflutterfire/geoflutterfire.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trobify/domain/entities/inmuebles.dart';
import 'package:trobify/domain/entities/user.dart';

class FirebaseInmueble {
  FirebaseFirestore firestore;
  FirebaseInmueble({required this.firestore});

  static Inmueble inmueblefromJson(DocumentSnapshot doc) {
    var position = LatLng(
      doc['ubicacion']['geopoint'].latitude,
      doc['ubicacion']['geopoint'].longitude,
    );
    return Inmueble(
      inmuebleID: doc.id,
      ubicacion: GeoFirePoint(
        position.latitude,
        position.longitude,
      ),
      ciudad: doc['ciudad'],
      codigoPostal: doc['codigoPostal'],
      descripcion: doc['descripcion'],
      direccion: doc['direccion'],
      disponibilidad: doc['disponibilidad'].toDate(),
      formatoPrecio: doc['formatoPrecio'],
      fotos: List.from(doc['fotos']),
      servicios: List.from(doc['servicios']),
      superficie: doc['superficie'],
      precio: doc['precio'].toDouble(),
      idPropietario: doc['idPropietario'],
      nBanyos: doc['nBanyos'],
      nDormitorios: doc['nDormitorios'],
      tipoOperacion: doc['tipoOperacion'],
      tipoInmueble: doc['tipoInmueble'],
    );
  }

  void insertInmuebleOnFirebase(Inmueble newInmueble) {
    var userData = User();

    firestore.collection('inmuebles').add({
      'ubicacion': newInmueble.ubicacion.data,
      'ciudad': newInmueble.ciudad,
      'codigoPostal': newInmueble.codigoPostal,
      'descripcion': newInmueble.descripcion,
      'direccion': newInmueble.direccion,
      'disponibilidad': newInmueble.disponibilidad,
      'formatoPrecio': newInmueble.formatoPrecio,
      'fotos': newInmueble.fotos,
      'servicios': newInmueble.servicios,
      'superficie': newInmueble.superficie,
      'precio': newInmueble.precio,
      'idPropietario': newInmueble.idPropietario,
      'nBanyos': newInmueble.nBanyos,
      'nDormitorios': newInmueble.nDormitorios,
      'tipoOperacion': newInmueble.tipoOperacion,
      'tipoInmueble': newInmueble.tipoInmueble,
    }).then((value) {
      firestore.collection('users').doc(userData.getID()).update({
        'propiedades': FieldValue.arrayUnion(['inmuebles/${value.id}']),
      });
    });
  }

  void modifyInmuebleOnFirebase(Inmueble modInmueble) {
    firestore.collection('inmuebles').doc(modInmueble.inmuebleID).update({
      'ubicacion': modInmueble.ubicacion.data,
      'ciudad': modInmueble.ciudad,
      'codigoPostal': modInmueble.codigoPostal,
      'descripcion': modInmueble.descripcion,
      'direccion': modInmueble.direccion,
      'disponibilidad': modInmueble.disponibilidad,
      'formatoPrecio': modInmueble.formatoPrecio,
      'fotos': modInmueble.fotos,
      'servicios': modInmueble.servicios,
      'superficie': modInmueble.superficie,
      'precio': modInmueble.precio,
      'idPropietario': modInmueble.idPropietario,
      'nBanyos': modInmueble.nBanyos,
      'nDormitorios': modInmueble.nDormitorios,
      'tipoOperacion': modInmueble.tipoOperacion,
      'tipoInmueble': modInmueble.tipoInmueble,
    });
  }

  void removeInmuebleOnFirebase(Inmueble removed) {
    firestore.collection('inmuebles').doc(removed.inmuebleID).delete();
  }

  void removePhotoOnFirebase(Inmueble inmueble, String photoUrl) {
    final _firestore = FirebaseFirestore.instance;
    inmueble.fotos.remove(photoUrl);
    _firestore.collection('inmuebles').doc(inmueble.inmuebleID).update({
      'fotos': inmueble.fotos,
    });
  }
}
