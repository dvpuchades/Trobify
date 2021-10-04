import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:core';

import 'package:trobify/application/filtros-bloc/filtros_bloc.dart';

class Filter {
  late List<DocumentSnapshot> documentList;

  Filter({
    required this.documentList,
  });

  void filtrarFecha(DateTime chosenDate) {
    if (chosenDate != DateTime(1900)) {
      var aux = Timestamp.fromDate(chosenDate);
      documentList.removeWhere((doc) => doc['disponibilidad'].compareTo(aux) > 0);
    }
  }

  void filtrarPrecio(String minLimit, String maxLimit) {
    if (minLimit != '' && int.tryParse(minLimit) != null) {
      documentList.removeWhere((doc) => doc['precio'] < int.parse(minLimit));
    }
    if (maxLimit != '' && int.tryParse(maxLimit) != null) {
      documentList.removeWhere((doc) => doc['precio'] > int.parse(maxLimit));
    }
  }

  void filtrarTipoInmueble(List<String> tipoInmuebleFilterTags) {
    documentList.removeWhere((doc) => !tipoInmuebleFilterTags.contains(doc['tipoInmueble']));
  }

  void filtrarNDormitorios(List<String> dormitorioFilterTags) {
    var tagsCopy = dormitorioFilterTags;
    if (!tagsCopy.contains('5+')) {
      documentList.removeWhere((doc) => doc['nDormitorios'] >= 5);
      tagsCopy.remove('5+');
    }
    documentList
        .removeWhere((doc) => !tagsCopy.contains(doc['nDormitorios'].toString()) && !(doc['nDormitorios'] >= 5));
  }

  void filtrarSuperficie(String minLimit, String maxLimit) {
    if (minLimit != '' && int.tryParse(minLimit) != null) {
      documentList.removeWhere((doc) => doc['superficie'] < int.parse(minLimit));
    }
    if (maxLimit != '' && int.tryParse(maxLimit) != null) {
      documentList.removeWhere((doc) => doc['superficie'] > int.parse(maxLimit));
    }
  }

  void filtrarNBanyos(List<String> nBanyosFilterTags) {
    var tagsCopy = nBanyosFilterTags;
    if (!tagsCopy.contains('4+')) {
      documentList.removeWhere((doc) => doc['nBanyos'] >= 4);
      tagsCopy.remove('4+');
    }
    documentList.removeWhere((doc) => !tagsCopy.contains(doc['nBanyos'].toString()) && !(doc['nBanyos'] >= 4));
  }

  void filtrarTipoOperacion(List<String> tipoOperacionFilterTags) {
    documentList.removeWhere((doc) => !tipoOperacionFilterTags.contains(doc['tipoOperacion']));
  }

  void filtrarServicios(List<String> servicies) {}

  void filtrarTodo(FiltrosState state) {
    filtrarFecha(state.chosenDate);
    filtrarPrecio(state.minValuePrice, state.maxValuePrice);
    filtrarTipoInmueble(state.tipoInmuebleFilterTags);
    filtrarNDormitorios(state.dormitorioFilterTags);
    filtrarSuperficie(state.minValueSuperficie, state.maxValueSuperficie);
    filtrarNBanyos(state.nBanyosFilterTags);
    filtrarTipoOperacion(state.tipoOperacionFilterTags);
    //filtrarServicios(List<String> servicies);
  }

  List<DocumentSnapshot> getFilteredDocumentList() => documentList;
}
