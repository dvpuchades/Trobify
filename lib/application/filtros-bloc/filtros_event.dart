part of 'filtros_bloc.dart';

@freezed
class FiltrosEvent with _$FiltrosEvent {
  const factory FiltrosEvent.chosenDateChanged(DateTime newDate) = ChosenDateChanged;
  const factory FiltrosEvent.dormitorioFilterTagsChanged(List<String> newDormitorioFilterTags) =
      DormitorioFilterTagsChanged;
  const factory FiltrosEvent.tipoInmuebleFilterTagsChanged(List<String> newTipoInmuebleFilterTags) =
      TipoInmuebleFilterTagsChanged;
  const factory FiltrosEvent.tipoOperacionFilterTagsChanged(List<String> newTipoOperacionFilterTags) =
      TipoOperacionFilterTagsChanged;
  const factory FiltrosEvent.nBanyosFilterTagsChanged(List<String> newNBanyosFilterTags) = NBanyosFilterTagsChanged;
  const factory FiltrosEvent.minValuePriceChanged(String newMinValuePrice) = MinValuePriceChanged;
  const factory FiltrosEvent.maxValuePriceChanged(String newMaxValuePrice) = MaxValuePriceChanged;
  const factory FiltrosEvent.minValueSuperficieChanged(String newMinValueSuperficie) = MinValueSuperficieChanged;
  const factory FiltrosEvent.maxValueSuperficieChanged(String newMaxValueSuperficie) = MaxValueSuperficieChanged;
  const factory FiltrosEvent.aplicarFiltros() = AplicarFiltros;
}
