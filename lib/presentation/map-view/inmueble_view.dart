import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:sliding_sheet/sliding_sheet.dart';
import 'package:trobify/domain/entities/inmuebles.dart';
import 'package:flutter/material.dart';
import 'package:trobify/domain/entities/user.dart';
import 'package:trobify/infrastructure/core/firebase_chat.dart';
import 'package:trobify/presentation/core/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

Map<int, String> formatoMes = {
  1: 'Enero',
  2: 'Febrero',
  3: 'Marzo',
  4: 'Abril',
  5: 'Mayo',
  6: 'Junio',
  7: 'Julio',
  8: 'Agosto',
  9: 'Septiembre',
  10: 'Octubre',
  11: 'Noviembre',
  12: 'Diciembre'
};

class Inmueble_view extends StatefulWidget {
  final Inmueble inmueble;

  const Inmueble_view({
    Key? key,
    required this.inmueble,
  }) : super(key: key);

  @override
  _Inmueble_viewState createState() => _Inmueble_viewState();
}

class _Inmueble_viewState extends State<Inmueble_view> {
  late Icon _favIcon;
  final Icon _fav_checked = Icon(
    Icons.favorite,
    size: 35,
  );
  final Icon _fav_unchecked = Icon(
    Icons.favorite_outline,
    size: 35,
  );
  List<Image> loadedImages = [];
  var userData = User();

  @override
  void initState() {
    if (userData.getID().isNotEmpty) {
      if (userData.getFavList().isNotEmpty) {
        _favIcon = userData.getFavList().where((element) => element.inmuebleID == widget.inmueble.inmuebleID).isEmpty
            ? _fav_unchecked
            : _fav_checked;
      } else {
        _favIcon = _fav_unchecked;
      }
    }
    if (widget.inmueble.fotos.isNotEmpty && widget.inmueble.fotos[0] == null) {
      loadedImages.add(Image.asset(
        'assets/images/media_not_found.jpg',
        fit: BoxFit.cover,
      ));
    } else {
      widget.inmueble.fotos.forEach((element) {
        loadedImages.add(
          Image(image: Image.network(element!).image),
        );
      });
    }

    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(child: sheet()), bottomNavigationBar: priceBar());
  }

  Widget photoSlider() {
    return CarouselSlider(
      items: loadedImages,
      options: CarouselOptions(
        height: MediaQuery.of(context).size.height * 0.4,
        enableInfiniteScroll: false,
        viewportFraction: 1.0,
        pageSnapping: true,
      ),
    );
  }

  Widget sheet() {
    return SlidingSheet(
        snapSpec: SnapSpec(
            positioning: SnapPositioning.relativeToAvailableSpace,
            initialSnap: 0.60,
            snap: false,
            snappings: [0.60, 1.0]),
        elevation: 3,
        cornerRadius: 25,
        body: photoSlider(),
        builder: (context, state) {
          return Container(child: Column(children: generateInformationList()));
        });
  }

  Widget priceBar() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        height: MediaQuery.of(context).size.height * 0.10,
        color: Colors.amber,
        child: Row(
          children: [
            Expanded(
                flex: (widget.inmueble.formatoPrecio == 30) ? 5 : 4,
                child: Text(
                  (widget.inmueble.formatoPrecio == 30)
                      ? '${widget.inmueble.precio.round()}€/mes'
                      : '${widget.inmueble.precio.round()}€',
                  style: TextStyle(color: Colors.white, fontSize: 26.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                )),
            userData.getID().isNotEmpty
                ? Expanded(
                    flex: 4,
                    child: IconButton(
                      icon: _favIcon,
                      onPressed: () {
                        if (_favIcon.icon == _fav_unchecked.icon) {
                          userData.addInmuebleToFavs(widget.inmueble);
                          setState(() {
                            _favIcon = _fav_checked;
                          });
                        } else {
                          Dialogs.materialDialog(
                              msg: '¿Quieres quitar este inmueble de tu lista de favoritos?',
                              title: '¿Quitar favorito?',
                              titleStyle: TitleTextStyle,
                              msgStyle: Body1TextStyle,
                              color: Colors.white,
                              context: context,
                              actions: [
                                IconsOutlineButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  text: 'No',
                                  iconData: Icons.cancel_outlined,
                                  textStyle: TextStyle(color: Colors.grey),
                                  iconColor: Colors.grey,
                                ),
                                IconsButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    userData.removeInmuebleFromFavs(widget.inmueble);
                                    setState(() {
                                      _favIcon = _fav_unchecked;
                                    });
                                  },
                                  text: 'Sí',
                                  iconData: Icons.check,
                                  color: Colors.blue,
                                  textStyle: TextStyle(color: Colors.white),
                                  iconColor: Colors.white,
                                ),
                              ]);
                        }
                      },
                    ))
                : Container(),
            Expanded(
              flex: 4,
              child: userData.getID().isEmpty
                  ? Container()
                  : widget.inmueble.idPropietario != userData.getID()
                      ? IconButton(
                          icon: Icon(
                            Icons.mail_outline,
                            size: 35,
                          ),
                          onPressed: () {
                            if (userData.getName() != '' && userData.getSurname() != '' && userData.getPhone() != '') {
                              FirebaseChat.openChat(context, widget.inmueble, userData.getID());
                            } else {
                              Dialogs.materialDialog(
                                  msg:
                                      'Para poder chatear tienes que ir a tu información personal en tu perfil y añadir tu datos personales restantes',
                                  title: 'Necesitas añadir tu información personal',
                                  titleStyle: TitleTextStyle,
                                  msgStyle: Body1TextStyle,
                                  color: Colors.white,
                                  context: context,
                                  actions: [
                                    IconsButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      text: 'Entendido',
                                      iconData: Icons.check,
                                      color: Colors.blue,
                                      textStyle: TextStyle(color: Colors.white),
                                      iconColor: Colors.white,
                                    ),
                                  ]);
                            }
                          },
                        )
                      : Tooltip(
                          message: 'Eres el propietario',
                          waitDuration: Duration(milliseconds: 1),
                          showDuration: Duration(seconds: 1),
                          child: Icon(
                            Icons.vpn_key_outlined,
                            size: 35,
                            color: Colors.black,
                          ),
                        ),
            )
          ],
        ));
  }

  List<Widget> generateInformationList() {
    var widgetList = <Widget>[
      ListTile(
          title: Text('Inmueble en ' + widget.inmueble.ciudad, style: TitleTextStyle, textAlign: TextAlign.center)),
      ListTile(title: Text(widget.inmueble.descripcion, style: Body1TextStyle, textAlign: TextAlign.justify)),
      ListTile(title: Text(widget.inmueble.tipoInmueble, style: Body1TextStyle), leading: Icon(Icons.house)),
      ListTile(
          title: Text('Se ofrece para ' + widget.inmueble.tipoOperacion, style: Body1TextStyle),
          leading: Icon(Icons.assignment_outlined)),
      ListTile(
          title: Text(widget.inmueble.nDormitorios.toString() + choosePluralHab(widget.inmueble.nDormitorios),
              style: Body1TextStyle),
          leading: Icon(Icons.king_bed_outlined)),
      ListTile(
          title: Text(widget.inmueble.nBanyos.toString() + choosePluralBat(widget.inmueble.nBanyos),
              style: Body1TextStyle),
          leading: Icon(Icons.bathtub)),
      ListTile(title: Text(widget.inmueble.direccion, style: Body1TextStyle), leading: Icon(Icons.place)),
      ListTile(
          title: Text(
              'Disponible desde el ${widget.inmueble.disponibilidad.day} de ${formatoMes[widget.inmueble.disponibilidad.month]} del ${widget.inmueble.disponibilidad.year}',
              style: Body1TextStyle),
          leading: Icon(Icons.calendar_today)),
      ListTile(
          title: Text('${widget.inmueble.superficie.round()} m²', style: Body1TextStyle),
          leading: Icon(Icons.apartment)),
    ];
    if (widget.inmueble.servicios.isNotEmpty) {
      var service = '';
      widget.inmueble.servicios.forEach((String element) {
        service += '#' + element + ' ';
      });
      widgetList.add(ListTile(
        title: Text(service, style: Body1TextStyle),
        leading: Icon(Icons.room_service_sharp),
      ));
    }
    return widgetList;
  }

  String choosePluralHab(int hab) {
    if (hab == 1) return ' dormitorio';
    return ' dormitorios';
  }

  String choosePluralBat(int bat) {
    if (bat == 1) return ' lavabo';
    return ' lavabos';
  }
}
