import 'package:flutter/material.dart';
import 'package:trobify/domain/entities/inmuebles.dart';
import 'package:trobify/presentation/card-view/card_template.dart';

class ListCard extends CardTemplate {
  @override
  final Inmueble inmueble;
  ListCard({required this.inmueble}) : super(inmueble: inmueble);

  @override
  int getFlex() {
    return 6;
  }

  @override
  double getHeightCard(BuildContext context) {
    return MediaQuery.of(context).size.height / 4;
  }

  @override
  double getWidthCard(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  @override
  Widget getInmuebleInfoIconRow() {
    return Expanded(
        flex: 2,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Icon(Icons.bathtub),
                  Text(' ${inmueble.nBanyos}'),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Icon(Icons.king_bed),
                  Text(' ${inmueble.nDormitorios}'),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Icon(Icons.apartment),
                  Text(' ${inmueble.superficie.round()}m²'),
                ],
              ),
            ),
          ],
        ));
  }

  @override
  Widget getEditButtons(BuildContext context) => Container();

  @override
  double getPriceContainerWidth(BuildContext context) {
    return MediaQuery.of(context).size.width / 2.2;
  }
}
