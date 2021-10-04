import 'package:trobify/domain/entities/inmuebles.dart';
import 'package:trobify/domain/map/place_search.dart';

abstract class IUserFacade {
  void getUserFromDB();
  Future<void> updateUserOnDB();
  void addFavoriteToDB(Inmueble newFav);
  void removeFavoriteFromDB(Inmueble removed);
  void addPropiedadToDB(Inmueble newInmueble);
  void removePropiedadFromDB(Inmueble removed);
  void updateHistorialBusquedaInDB(List<PlaceSearch> historialBusqueda);
}
