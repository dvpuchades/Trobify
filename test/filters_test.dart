// @dart = 2.9
import 'dart:math';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trobify/domain/entities/inmuebles.dart';
import 'package:trobify/domain/filters/filters.dart';

final fakeFirestore = FakeFirebaseFirestore();
void main() {
  group('Test Filtro Precio', () {
    generateData();

    test('Filtro de Precio Vacio', () async {
      fakeFirestore.collection('inmuebles').snapshots().listen((docs) {
        var filterTest = Filter(documentList: docs.docs);
        filterTest.filtrarPrecio('', '');
        //Si hay el mismo numero de inmuebles antes y despues de filtrar
        //significa que no se ha filtrado ningun inmueble, como debería ser
        expectLater(filterTest.getFilteredDocumentList().length == docs.docs.length, true);
      });
    });

    test('Rango Precio', () async {
      fakeFirestore.collection('inmuebles').snapshots().listen((docs) {
        var filterTest = Filter(documentList: docs.docs);
        filterTest.filtrarPrecio('10', '200');
        filterTest.getFilteredDocumentList().forEach((element) {
          var precio = element['precio'];
          expectLater(precio >= 10 && precio <= 200, true);
        });
      });
    });

    test('Rango Precio [x, infinito)', () async {
      fakeFirestore.collection('inmuebles').snapshots().listen((docs) {
        var filterTest = Filter(documentList: docs.docs);
        filterTest.filtrarPrecio('40', '');
        filterTest.getFilteredDocumentList().forEach((element) {
          var precio = element['precio'];
          expectLater(precio >= 40, true);
        });
      });
    });

    test('Rango Precio (0, x]', () async {
      fakeFirestore.collection('inmuebles').snapshots().listen((docs) {
        var filterTest = Filter(documentList: docs.docs);
        filterTest.filtrarPrecio('', '250');
        filterTest.getFilteredDocumentList().forEach((element) {
          var precio = element['precio'];
          expectLater(precio >= 0 && precio <= 250, true);
        });
      });
    });
    test('Rango Precio Inexistente', () async {
      fakeFirestore.collection('inmuebles').snapshots().listen((docs) {
        var filterTest = Filter(documentList: docs.docs);
        //fuera del rango de valores que genera el generateData(): [10, 1000)
        filterTest.filtrarPrecio('0', '9');
        expectLater(filterTest.getFilteredDocumentList().isEmpty, true);
      });
    });

    test('Precio Específico Existente', () async {
      fakeFirestore.collection('inmuebles').snapshots().listen((docs) {
        var filterTest = Filter(documentList: docs.docs);
        //el precio del primer inmueble, aseguras que al menos uno va a tener ese precio
        var precioEspecifico = docs.docs.first.get('precio').round().toString();
        filterTest.filtrarPrecio(precioEspecifico, precioEspecifico);
        filterTest.getFilteredDocumentList().forEach((element) {
          var precio = element['precio'].round().toString();
          expectLater(precio == precioEspecifico, true);
        });
      });
    });

    test('Precio Específico no Existente', () async {
      fakeFirestore.collection('inmuebles').snapshots().listen((docs) {
        var filterTest = Filter(documentList: docs.docs);
        //no pueden existir inmuebles con un precio de 9e porque está fuera del rango que le
        //he puesto en el generateData(): [10, 1000)
        filterTest.filtrarPrecio('9', '9');
        expectLater(filterTest.getFilteredDocumentList().isEmpty, true);
      });
    });
  });
  group('Test Filtro Superficie', () {
    generateData();

    test('Filtro de Superficie Vacio', () async {
      fakeFirestore.collection('inmuebles').snapshots().listen((docs) {
        var filterTest = Filter(documentList: docs.docs);
        filterTest.filtrarSuperficie('', '');
        //Si el tamaño antes y despues de filtrar es el mismos
        //significa que no se ha filtrado ningun inmueble,
        //como debería ser
        expectLater(filterTest.getFilteredDocumentList().length == docs.docs.length, true);
      });
    });

    test('Rango Superficie', () async {
      fakeFirestore.collection('inmuebles').snapshots().listen((docs) {
        var filterTest = Filter(documentList: docs.docs);
        filterTest.filtrarSuperficie('10', '200');
        filterTest.getFilteredDocumentList().forEach((element) {
          var superficie = element['superficie'];
          expectLater(superficie >= 10 && superficie <= 200, true);
        });
      });
    });

    test('Rango Superficie[x, infinito)', () async {
      fakeFirestore.collection('inmuebles').snapshots().listen((docs) {
        var filterTest = Filter(documentList: docs.docs);
        filterTest.filtrarSuperficie('35', '');
        filterTest.getFilteredDocumentList().forEach((element) {
          var superficie = element['superficie'];
          expectLater(superficie >= 35, true);
        });
      });
    });

    test('Rango Superficie(0, x]', () async {
      fakeFirestore.collection('inmuebles').snapshots().listen((docs) {
        var filterTest = Filter(documentList: docs.docs);
        filterTest.filtrarSuperficie('', '97');
        filterTest.getFilteredDocumentList().forEach((element) {
          var superficie = element['superficie'];
          expectLater(superficie >= 0 && superficie <= 97, true);
        });
      });
    });

    test('Rango Superficie Inexistente', () async {
      fakeFirestore.collection('inmuebles').snapshots().listen((docs) {
        var filterTest = Filter(documentList: docs.docs);
        //fuera del rango de valores que genera el generateData(): [10, 1000)
        filterTest.filtrarSuperficie('0', '9');
        expectLater(filterTest.getFilteredDocumentList().isEmpty, true);
      });
    });

    test('Superficie Específica existente', () async {
      fakeFirestore.collection('inmuebles').snapshots().listen((docs) {
        var filterTest = Filter(documentList: docs.docs);
        //la superficie del primer inmueble, aseguras que al menos uno va a tener esa superfice
        var superficieEspecifica = docs.docs.first.get('superficie').round().toString();
        filterTest.filtrarSuperficie(superficieEspecifica, superficieEspecifica);
        filterTest.getFilteredDocumentList().forEach((element) {
          var superficie = element['superficie'].round().toString();
          expectLater(superficie == superficieEspecifica, true);
        });
      });
    });

    test('Superficie Específica No Existente', () async {
      fakeFirestore.collection('inmuebles').snapshots().listen((docs) {
        var filterTest = Filter(documentList: docs.docs);
        //no pueden existir inmuebles con una Superfie de 9m2 porque está fuera del rango que le
        //he puesto en el generateData(): [10, 1000)
        filterTest.filtrarSuperficie('9', '9');
        expectLater(filterTest.getFilteredDocumentList().isEmpty, true);
      });
    });
  });
}

void generateData() {
  var _tipoInmuebleFilterOptions = [
    'Vivienda',
    'Trastero',
    'Parcela',
    'Habitación',
    'Local',
    'Garaje',
  ];
  var _tipoOperacionFilterOptions = ['Alquiler', 'Venta'];
  var _randomizer = Random();
  double generarNumero(num a, num b) => _randomizer.nextDouble() * (a - b) + b;
  var inmuebles = [];
  for (var i = 0; i < 50; i++) {
    var fechaMin = DateTime(2021, 5, 12, 19, 0, 0);
    var fechaMax = DateTime(2023, 1, 1, 0, 0, 0);
    var difEnSeg = fechaMax.difference(fechaMin).inSeconds;

    var inmueble = Inmueble(
        inmuebleID: i.toString(),
        ubicacion: null,
        ciudad: i.toString(),
        codigoPostal: i,
        descripcion: i.toString(),
        direccion: i.toString(),
        disponibilidad: fechaMin.add(Duration(seconds: _randomizer.nextInt(difEnSeg))),
        formatoPrecio: i % 2 == 0 ? 30 : 99,
        fotos: [null],
        servicios: null,
        superficie: generarNumero(10, 1000).truncateToDouble(),
        precio: generarNumero(10, 1000).truncateToDouble(),
        idPropietario: i.toString(),
        nBanyos: generarNumero(0, 5).truncate(),
        nDormitorios: generarNumero(0, 8).truncate(),
        tipoOperacion: _tipoOperacionFilterOptions[_randomizer.nextInt(_tipoOperacionFilterOptions.length)],
        tipoInmueble: _tipoInmuebleFilterOptions[_randomizer.nextInt(_tipoInmuebleFilterOptions.length)]);
    inmuebles.add(inmueble);
  }
  inmuebles.forEach((newInmueble) async {
    await fakeFirestore.collection('inmuebles').add({
      'ubicacion': newInmueble.ubicacion,
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
      'tipoInmueble': newInmueble.tipoInmueble
    });
  });
}
