import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'filtros_event.dart';
part 'filtros_state.dart';
part 'filtros_bloc.freezed.dart';

class FiltrosBloc extends Bloc<FiltrosEvent, FiltrosState> {
  FiltrosBloc() : super(FiltrosState.initial());

  @override
  Stream<FiltrosState> mapEventToState(
    FiltrosEvent event,
  ) async* {
    yield* event.map(
      chosenDateChanged: (e) async* {
        yield state.copyWith(chosenDate: e.newDate);
      },
      dormitorioFilterTagsChanged: (e) async* {
        yield state.copyWith(dormitorioFilterTags: e.newDormitorioFilterTags);
      },
      tipoInmuebleFilterTagsChanged: (e) async* {
        yield state.copyWith(tipoInmuebleFilterTags: e.newTipoInmuebleFilterTags);
      },
      tipoOperacionFilterTagsChanged: (e) async* {
        yield state.copyWith(tipoOperacionFilterTags: e.newTipoOperacionFilterTags);
      },
      nBanyosFilterTagsChanged: (e) async* {
        yield state.copyWith(nBanyosFilterTags: e.newNBanyosFilterTags);
      },
      minValuePriceChanged: (e) async* {
        yield state.copyWith(minValuePrice: e.newMinValuePrice);
      },
      maxValuePriceChanged: (e) async* {
        yield state.copyWith(maxValuePrice: e.newMaxValuePrice);
      },
      minValueSuperficieChanged: (e) async* {
        yield state.copyWith(minValueSuperficie: e.newMinValueSuperficie);
      },
      maxValueSuperficieChanged: (e) async* {
        yield state.copyWith(maxValueSuperficie: e.newMaxValueSuperficie);
      },
      aplicarFiltros: (e) async* {},
    );
  }
}
