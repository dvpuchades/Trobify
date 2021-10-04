part of 'create_bloc_bloc.dart';

@freezed
class CreateBlocEvent with _$CreateBlocEvent {
  const factory CreateBlocEvent.setInmueble(Inmueble inmueble) = SetInmueble;
  const factory CreateBlocEvent.inmuebleIDChanged(String inmuebleID) = InmuebleIDChanged;
  const factory CreateBlocEvent.idPropietarioChanged(String idPropietario) = IdPropietarioChanged;
  const factory CreateBlocEvent.imageListChanged(List<File> imageList) = ImageListChanged;
  const factory CreateBlocEvent.modifImageListChanged(List<File> imageList, List<String> photosRefList) =
      ModifImageListChanged;
  const factory CreateBlocEvent.ciudadChanged(String ciudad) = CiudadChanged;
  const factory CreateBlocEvent.direccionChanged(String direccion) = DireccionChanged;
  const factory CreateBlocEvent.codigoPostalChanged(int codigoPostal) = CodigoPostalChanged;
  const factory CreateBlocEvent.descripcionChanged(String descripcion) = DescripcionChanged;
  const factory CreateBlocEvent.disponibilidadChanged(DateTime disponibilidad) = DisponibilidadChanged;
  const factory CreateBlocEvent.precioChanged(double precio) = PrecioChanged;
  const factory CreateBlocEvent.superficieChanged(double superficie) = SuperficieChanged;
  const factory CreateBlocEvent.serviciosChanged(List<String> servicios) = ServiciosChanged;
  const factory CreateBlocEvent.nDormitoriosChanged(int nDormitorios) = NDormitoriosChanged;
  const factory CreateBlocEvent.nBanyosChanged(int nBanyos) = NBanyosChanged;
  const factory CreateBlocEvent.tipoInmuebleChanged(String tipoInmueble) = TipoInmuebleChanged;
  const factory CreateBlocEvent.tipoOperacionChanged(String tipoOperacion) = TipoOperacionChanged;
  const factory CreateBlocEvent.formatoPrecioChanged(int formatoPrecio) = FormatoPrecioChanged;
  const factory CreateBlocEvent.submitChanges() = SubmitChanges;
  const factory CreateBlocEvent.replaceChanges() = ReplaceChanges;
  const factory CreateBlocEvent.ubicacionChanged(Place place) = UbicacionChanged;
}
