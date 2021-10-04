import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:trobify/domain/core/i_user_facade.dart';
import 'package:trobify/domain/entities/inmuebles.dart';
import 'package:trobify/domain/entities/user.dart' as model;
import 'package:trobify/domain/map/place_search.dart';

import 'firebase_auth_facade.dart';
import 'firebase_inmueble.dart';

class FirebaseUser extends IUserFacade {
  final FirebaseFirestore firestore;

  FirebaseUser({required this.firestore});

  void createUser(
    User userCredential,
  ) {
    var userData = model.User();

    firestore.collection('users').doc(userCredential.uid).set({
      'name': userData.getName(),
      'surname': userData.getSurname(),
      'phone': userData.getPhone(),
      'email': userCredential.email,
      'userImageRef': userData.getImageRef(),
      'favoritos': [],
      'propiedades': [],
    });
  }

  @override
  Future<void> updateUserOnDB() async {
    var userData = model.User();

    if (userData.getImage() != null && userData.getFile() != null) {
      final fileName = userData.getID() + '/' + basename(userData.getFile()!.path);
      final storageReference = FirebaseStorage.instance.ref().child(fileName);
      final uploadTask = storageReference.putFile(userData.getFile()!);
      await uploadTask.then((result) {
        userData.setImageRef(fileName);
      }).onError(
        (error, stackTrace) {
          userData.setImageRef('');
        },
      );
    }
    await firestore.collection('users').doc(userData.getID()).update({
      'name': userData.getName(),
      'surname': userData.getSurname(),
      'phone': userData.getPhone(),
      'userImageRef': userData.getImageRef(),
    });
  }

  @override
  void addFavoriteToDB(Inmueble newFav) {
    var userData = model.User();

    firestore.collection('users').doc(userData.getID()).update({
      'favoritos': FieldValue.arrayUnion(['inmuebles/${newFav.inmuebleID}'])
    });
  }

  @override
  void addPropiedadToDB(Inmueble newProp) {
    var userData = model.User();

    firestore.collection('users').doc(userData.getID()).update({
      'propiedades': FieldValue.arrayRemove(['inmuebles/${newProp.inmuebleID}'])
    });
  }

  @override
  void removeFavoriteFromDB(Inmueble removed) {
    var userData = model.User();

    firestore.collection('users').doc(userData.getID()).update({
      'favoritos': FieldValue.arrayRemove(['inmuebles/${removed.inmuebleID}'])
    });
  }

  @override
  void removePropiedadFromDB(Inmueble removed) {
    var userData = model.User();

    firestore.collection('users').doc(userData.getID()).update({
      'propiedades': FieldValue.arrayRemove(['inmuebles/${removed.inmuebleID}'])
    });
  }

  @override
  void updateHistorialBusquedaInDB(List<PlaceSearch> historialBusqueda) {
    var userData = model.User();
    var _suggDescriptions = [];
    var _suggPlaceIds = [];
    for (var i = historialBusqueda.length - 1; i > -1; i--) {
      _suggDescriptions.insert(0, historialBusqueda[i].description);
      _suggPlaceIds.insert(0, historialBusqueda[i].placeId);
    }
    firestore.collection('users').doc(userData.getID()).update({
      'suggDescriptions': _suggDescriptions,
      'suggPlaceIds': _suggPlaceIds,
    });
  }

  @override
  void getUserFromDB() {
    var credentials = AuthFacade(
      firebaseAuth: FirebaseAuth.instance,
    ).getUserAuth();
    var userData = model.User();

    if (credentials != null) {
      userData.setID(credentials.uid);
      userData.setEmail(credentials.email!);

      firestore.collection('users').doc(userData.getID()).snapshots().listen((user) {
        if (user['suggDescriptions'].isNotEmpty && user['suggPlaceIds'].isNotEmpty) {
          userData.clearHistorial();
          var _suggDescriptions = user['suggDescriptions'];
          var _suggPlaceIds = user['suggPlaceIds'];
          if (_suggDescriptions.length == _suggPlaceIds.length) {
            for (var i = 0; i < _suggDescriptions.length; i++) {
              userData.addSearchToHistorial(PlaceSearch(description: _suggDescriptions[i], placeId: _suggPlaceIds[i]));
            }
          }
        }
        userData.setName(user['name']);
        userData.setSurname(user['surname']);
        userData.setPhone(user['phone']);
        userData.setImageRef(user['userImageRef']);
        userData.setImage(null);
        if (user['favoritos'].isNotEmpty) {
          userData.clearFavoritos();
          user['favoritos'].forEach((element) {
            if (userData.getFavList().where((myfavs) => myfavs.inmuebleID == element._id).isEmpty) {
              firestore.doc(element).snapshots().listen((event) {
                if (userData.getFavList().where((element) => element.inmuebleID == event.id).isEmpty) {
                  if (event.exists) {
                    userData.addInmuebleToFavs(FirebaseInmueble.inmueblefromJson(event));
                  } else {
                    firestore.collection('users').doc(userData.getID()).update({
                      'favoritos': FieldValue.arrayRemove(['inmuebles/${event.id}'])
                    });
                  }
                }
              });
            }
          });
        }
        if (user['propiedades'].isNotEmpty) {
          userData.clearPropiedades();
          user['propiedades'].forEach((element) {
            if (userData.getPropList().where((myProp) => myProp.inmuebleID == element._id).isEmpty) {
              firestore.doc(element).snapshots().listen((event) {
                if (userData.getPropList().where((element) => element.inmuebleID == event.id).isEmpty) {
                  if (event.exists) {
                    userData.addPropiedad(FirebaseInmueble.inmueblefromJson(event));
                  } else {
                    firestore.collection('users').doc(model.User().getID()).update({
                      'favoritos': FieldValue.arrayRemove(['inmuebles/${event.id}'])
                    });
                  }
                }
              });
            }
          });
        }
        if (userData.getImageRef() != '') {
          FirebaseStorage.instance.ref().child(userData.getImageRef()).getDownloadURL().then((downloadUrl) {
            userData.setImage(Image.network(
              downloadUrl,
              fit: BoxFit.cover,
            ));
          });
        }
      });
    }
  }
}
