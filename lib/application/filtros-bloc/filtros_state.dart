part of 'filtros_bloc.dart';

@freezed
class FiltrosState with _$FiltrosState {
  const factory FiltrosState({
    required DateTime chosenDate,
    required List<String> dormitorioFilterTags,
    required List<String> tipoInmuebleFilterTags,
    required List<String> tipoOperacionFilterTags,
    required List<String> nBanyosFilterTags,
    required String minValuePrice,
    required String maxValuePrice,
    required String minValueSuperficie,
    required String maxValueSuperficie,
  }) = _FiltrosState;
  factory FiltrosState.initial() => FiltrosState(
        chosenDate: DateTime(1900),
        dormitorioFilterTags: ['0', '1', '2', '3', '4', '5+'],
        tipoInmuebleFilterTags: [
          'Vivienda',
          'Trastero',
          'Parcela',
          'Habitación',
          'Local',
          'Garaje',
        ],
        tipoOperacionFilterTags: ['Alquiler', 'Venta'],
        nBanyosFilterTags: ['0', '1', '2', '3', '4+'],
        minValuePrice: '',
        maxValuePrice: '',
        minValueSuperficie: '',
        maxValueSuperficie: '',
      );
}
