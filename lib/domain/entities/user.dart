import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trobify/domain/core/i_user_facade.dart';
import 'package:trobify/domain/entities/inmuebles.dart';
import 'package:trobify/domain/map/place_search.dart';
import 'package:trobify/infrastructure/core/firebase_user.dart';

class User {
  late String _id;
  late String _userImageRef;
  late Image? _userImage;
  late File? _imageFile;
  late String _name;
  late String _surname;
  late String _email;
  late String _phone;
  late List<Inmueble> _favoritos;
  late List<Inmueble> _propiedades;
  late List<PlaceSearch> _historialBusqueda;

  final cantidadSugerencias = 3;
  
  static final User _user = User._internal();

  factory User() {
    return _user;
  }

  User._internal() {
    _id = '';
    _userImageRef = '';
    _email = '';
    _name = '';
    _surname = '';
    _phone = '';
    _userImage = null;
    _imageFile = null;
    _favoritos = <Inmueble>[];
    _propiedades = <Inmueble>[];
    _historialBusqueda = <PlaceSearch>[];
  }

  void getUser() {
    final IUserFacade _userFacade = FirebaseUser(firestore: FirebaseFirestore.instance);
    return _userFacade.getUserFromDB();
  }

  void clear() {
    _id = '';
    _userImageRef = '';
    _email = '';
    _name = '';
    _surname = '';
    _phone = '';
    _userImage = null;
    _imageFile = null;
    _favoritos = <Inmueble>[];
    _propiedades = <Inmueble>[];
    _historialBusqueda = <PlaceSearch>[];
  }

  void setID(String id) => _id = id;
  void setEmail(String email) => _email = email;
  void setName(String name) => _name = name;
  void setSurname(String surname) => _surname = surname;
  void setPhone(String phone) => _phone = phone;
  void setImageRef(String imageRef) => _userImageRef = imageRef;
  void setImage(Image? image) => _userImage = image;
  void setFile(File? imageFile) => _imageFile = imageFile;

  String getID() => _id;
  String getEmail() => _email;
  String getName() => _name;
  String getSurname() => _surname;
  String getPhone() => _phone;
  String getImageRef() => _userImageRef;
  Image? getImage() => _userImage;
  File? getFile() => _imageFile;

  List<Inmueble> getFavList() => _favoritos;
  List<Inmueble> getPropList() => _propiedades;
  List<PlaceSearch> getHistorial() => _historialBusqueda;

  void addInmuebleToFavs(Inmueble newFav) {
    IUserFacade _userFacade = FirebaseUser(firestore: FirebaseFirestore.instance);

    _favoritos.add(newFav);
    _userFacade.addFavoriteToDB(newFav);
  }

  void removeInmuebleFromFavs(Inmueble removed) {
    final IUserFacade _userFacade = FirebaseUser(firestore: FirebaseFirestore.instance);
    _favoritos.remove(removed);
    _userFacade.removeFavoriteFromDB(removed);
  }

  void addPropiedad(Inmueble newProp) {
    IUserFacade _userFacade = FirebaseUser(firestore: FirebaseFirestore.instance);
    _propiedades.add(newProp);
    _userFacade.addPropiedadToDB(newProp);
  }

  void removePropiedad(Inmueble removed) {
    IUserFacade _userFacade = FirebaseUser(firestore: FirebaseFirestore.instance);

    _propiedades.remove(removed);
    _userFacade.removePropiedadFromDB(removed);
  }

  void addSearchToHistorial(dynamic sugg) {
    IUserFacade _userFacade = FirebaseUser(firestore: FirebaseFirestore.instance);
    _historialBusqueda.insert(0, sugg);
    while (_historialBusqueda.length > cantidadSugerencias) {
      _historialBusqueda.removeLast();
    }
    _userFacade.updateHistorialBusquedaInDB(_historialBusqueda);
  }

  void clearFavoritos() => _favoritos.clear();
  void clearPropiedades() => _propiedades.clear();
  void clearHistorial() => _historialBusqueda.clear();
}
