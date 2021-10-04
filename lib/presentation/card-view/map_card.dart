import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trobify/domain/entities/inmuebles.dart';
import 'package:trobify/presentation/card-view/card_template.dart';

class MapCard extends CardTemplate {
  @override
  final Inmueble inmueble;
  MapCard({required this.inmueble}) : super(inmueble: inmueble);

  @override
  Widget getEditButtons(BuildContext context) => Container();

  @override
  int getFlex() {
    return 6;
  }

  @override
  double? getHeightCard(BuildContext context) {
    return null;
  }

  @override
  Widget getInmuebleInfoIconRow() => Container();

  @override
  double getPriceContainerWidth(BuildContext context) {
    return MediaQuery.of(context).size.width / 2.2;
  }

  @override
  double getWidthCard(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }
}
