part of 'create_bloc_bloc.dart';

@freezed
class CreateBlocState with _$CreateBlocState {
  const factory CreateBlocState(
      {required String inmuebleID,
      required GeoFirePoint ubicacion,
      required String idPropietario,
      required List<File> imageList,
      required List<String?> fotos,
      required String direccion,
      required String ciudad,
      required int codigoPostal,
      required String descripcion,
      required DateTime disponibilidad,
      required double precio,
      required double superficie,
      required List<String> servicios,
      required int nDormitorios,
      required int nBanyos,
      required String tipoInmueble,
      required String tipoOperacion,
      required int formatoPrecio}) = _CreateBlocState;

  factory CreateBlocState.initial() {
    return CreateBlocState(
        idPropietario: '',
        inmuebleID: '',
        imageList: [],
        fotos: [],
        ubicacion: GeoFirePoint(0, 0),
        direccion: '',
        ciudad: '',
        codigoPostal: 0,
        descripcion: '',
        disponibilidad: DateTime.now(),
        precio: 0,
        superficie: 0,
        servicios: [],
        nDormitorios: 0,
        nBanyos: 0,
        tipoInmueble: 'Vivienda',
        tipoOperacion: 'Alquiler',
        formatoPrecio: 0);
  }
  factory CreateBlocState.modif(Inmueble inmueble) {
    return CreateBlocState(
      idPropietario: inmueble.idPropietario,
      inmuebleID: inmueble.inmuebleID,
      imageList: [],
      fotos: [],
      ubicacion: GeoFirePoint(0, 0),
      direccion: inmueble.direccion,
      ciudad: inmueble.ciudad,
      codigoPostal: inmueble.codigoPostal,
      descripcion: inmueble.descripcion,
      disponibilidad: inmueble.disponibilidad,
      precio: inmueble.precio,
      superficie: inmueble.superficie,
      servicios: inmueble.servicios,
      nDormitorios: inmueble.nDormitorios,
      nBanyos: inmueble.nBanyos,
      tipoInmueble: inmueble.tipoInmueble,
      tipoOperacion: inmueble.tipoOperacion,
      formatoPrecio: inmueble.formatoPrecio,
    );
  }
}
