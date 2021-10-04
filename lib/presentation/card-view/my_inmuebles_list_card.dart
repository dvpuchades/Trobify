import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:trobify/domain/entities/inmuebles.dart';
import 'package:trobify/domain/entities/user.dart';
import 'package:trobify/presentation/card-view/card_template.dart';
import 'package:trobify/presentation/core/constants.dart';
import 'package:trobify/presentation/profile-view/modif-view.dart';
import 'package:trobify/presentation/profile-view/my-inmuebles-view.dart';

class MyInmueblesListCard extends CardTemplate {
  @override
  final Inmueble inmueble;
  final userData = User();
  MyInmueblesListCard({required this.inmueble}) : super(inmueble: inmueble);

  @override
  Widget getEditButtons(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: IconButton(
              icon: Icon(Icons.create_rounded),
              alignment: Alignment.centerRight,
              color: Colors.black,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ModificarInmueble(inmueble)));
              },
            ),
          ),
          Expanded(
            child: IconButton(
              icon: Icon(Icons.delete_rounded),
              alignment: Alignment.centerLeft,
              color: Colors.black,
              onPressed: () {
                Dialogs.materialDialog(
                    msg: 'Se eliminará el anuncio ¿Está seguro?',
                    title: 'Eliminar',
                    titleStyle: TitleTextStyle,
                    msgStyle: Body1TextStyle,
                    color: Colors.white,
                    context: context,
                    actions: [
                      IconsOutlineButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        text: 'Cancelar',
                        iconData: Icons.cancel_outlined,
                        textStyle: TextStyle(color: Colors.grey),
                        iconColor: Colors.grey,
                      ),
                      IconsButton(
                        onPressed: () {
                          userData.removePropiedad(inmueble);
                          Inmueble.removeOnFirebase(inmueble);
                          Navigator.of(context)
                            ..pop()
                            ..pop()
                            ..push(MaterialPageRoute(builder: (context) => MyInmueblesView()));
                        },
                        text: 'Eliminar',
                        iconData: Icons.delete,
                        color: Colors.red,
                        textStyle: TextStyle(color: Colors.white),
                        iconColor: Colors.white,
                      ),
                    ]);
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  int getFlex() {
    return 5;
  }

  @override
  double? getHeightCard(BuildContext context) {
    return MediaQuery.of(context).size.height / 3.75;
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
  double getPriceContainerWidth(BuildContext context) {
    return MediaQuery.of(context).size.width / 3.8;
  }

  @override
  double getWidthCard(BuildContext context) {
    return MediaQuery.of(context).size.width / 1.2;
  }
}
