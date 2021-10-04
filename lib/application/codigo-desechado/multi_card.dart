import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:material_dialogs/widgets/buttons/icon_button.dart';
import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
import 'package:trobify/application/auth/auth_bloc.dart';
import 'package:trobify/domain/entities/inmuebles.dart';
import 'package:trobify/domain/entities/user.dart';
import 'package:trobify/presentation/core/constants.dart';
import 'package:trobify/presentation/map-view/inmueble_view.dart';
import 'package:trobify/presentation/profile-view/modif-view.dart';

Map<int, String> formatoPrecio = {30: ' /mes', 1: ' /dia', 7: '/semana', 12: ' /año', 99: ''};

String compactarPrecio(double precio) {
  if (precio >= 1000000) {
    //1500000 -> 1'5M & 1000000 -> 1M
    var aux = ((precio / 100000).round()) / 10.0;
    return (aux * 10) % 10 == 0 ? aux.round().toString() + 'M' : aux.toString() + 'M';
  }
  if (precio >= 1000) {
    //1500 -> 1'5K & 100 -> 1K
    var aux = ((precio / 100).round()) / 10.0;
    return (aux * 10) % 10 == 0 ? aux.round().toString() + 'K' : aux.toString() + 'K';
  }
  return precio.round().toString();
}

var cardTypes = ['MapCard', 'ListCard', 'MyInmuebleListCard'];

class MultiCard extends StatefulWidget {
  final Inmueble inmueble;
  final String cardToCreate;
  const MultiCard({Key? key, required this.inmueble, required this.cardToCreate}) : super(key: key);

  @override
  _MultiCardState createState() => _MultiCardState();
}

class _MultiCardState extends State<MultiCard> {
  late Icon _editIcon;
  late Icon _deleteIcon;
  late Icon _favIcon;
  final userData = User();

  @override
  void initState() {
    if (userData.getID().isNotEmpty && widget.cardToCreate == cardTypes[2]) {
      _editIcon = Icon(Icons.create_rounded);
      _deleteIcon = Icon(Icons.delete_rounded);
    }
    if (userData.getFavList().isNotEmpty) {
      _favIcon = userData.getFavList().where((element) => element.inmuebleID == widget.inmueble.inmuebleID).isEmpty
          ? Icon(Icons.favorite_outline)
          : Icon(Icons.favorite);
    } else {
      _favIcon = Icon(Icons.favorite_outline);
    }

    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: widget.cardToCreate != cardTypes[0]
            ? MediaQuery.of(context).size.width / 1.2
            : MediaQuery.of(context).size.width,
        height: widget.cardToCreate == cardTypes[2]
            ? MediaQuery.of(context).size.height / 3.75
            : widget.cardToCreate == cardTypes[1]
                ? MediaQuery.of(context).size.height / 4
                : null,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow[700]!),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
            ),
            onPressed: () {
              Route route = MaterialPageRoute(builder: (context) => Inmueble_view(inmueble: widget.inmueble));
              Navigator.of(context).push(route);
            },
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    flex: widget.cardToCreate != cardTypes[0] ? 6 : 5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                      ),
                      child: widget.inmueble.fotos[0] != null
                          ? Image.network(
                              widget.inmueble.fotos[0]!,
                              fit: BoxFit.fill,
                              height: MediaQuery.of(context).size.width * 0.7,
                            )
                          : Image.asset(
                              'assets/images/media_not_found.jpg',
                              fit: BoxFit.fill,
                              height: MediaQuery.of(context).size.width * 0.7,
                            ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 5,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    alignment: Alignment.topLeft,
                                    padding: EdgeInsets.only(bottom: 16, top: 10),
                                    child: Text(
                                      '${widget.inmueble.tipoInmueble} en ${widget.inmueble.ciudad}',
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(fontSize: 17),
                                    ),
                                  ),
                                ),
                                BlocBuilder<AuthBloc, AuthState>(
                                  builder: (context, state) {
                                    return state.map(
                                        initial: (_) => Container(),
                                        authenticated: (_) => Container(
                                            alignment: Alignment.topRight,
                                            child: IconButton(
                                              icon: _favIcon,
                                              onPressed: () {
                                                if (_favIcon.icon == Icons.favorite_outline) {
                                                  userData.addInmuebleToFavs(widget.inmueble);
                                                  setState(() {
                                                    _favIcon = Icon(Icons.favorite);
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
                                                              _favIcon = Icon(Icons.favorite_outline);
                                                            });
                                                          },
                                                          text: 'Sí',
                                                          iconData: Icons.check,
                                                          color: Colors.green,
                                                          textStyle: TextStyle(color: Colors.white),
                                                          iconColor: Colors.white,
                                                        ),
                                                      ]);
                                                }
                                              },
                                            )),
                                        unauthenticated: (_) => Container());
                                  },
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              '${widget.inmueble.direccion}',
                              style: TextStyle(fontSize: 15),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          widget.cardToCreate != cardTypes[0]
                              ? Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          children: [
                                            Icon(Icons.bathtub),
                                            Text(' ${widget.inmueble.nBanyos}'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Row(
                                          children: [
                                            Icon(Icons.king_bed),
                                            Text(' ${widget.inmueble.nDormitorios}'),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            Icon(Icons.apartment),
                                            Text(' ${widget.inmueble.superficie.round()}m²'),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ))
                              : Container(),
                          Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: widget.cardToCreate == cardTypes[2]
                                      ? MediaQuery.of(context).size.width / 3.8
                                      : MediaQuery.of(context).size.width / 2.2,
                                  child: FittedBox(
                                    alignment: Alignment.centerLeft,
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      '${compactarPrecio(widget.inmueble.precio)}€${formatoPrecio[widget.inmueble.formatoPrecio]}',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                widget.cardToCreate == cardTypes[2]
                                    ? Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            icon: _editIcon,
                                            alignment: Alignment.centerRight,
                                            color: Colors.black,
                                            onPressed: () {
                                              Navigator.of(context).push(MaterialPageRoute(
                                                  builder: (context) => ModificarInmueble(widget.inmueble)));
                                            },
                                          ),
                                          IconButton(
                                            icon: _deleteIcon,
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
                                                        setState(() {
                                                          userData.removePropiedad(widget.inmueble);
                                                          Inmueble.removeOnFirebase(widget.inmueble);
                                                          Navigator.of(context).pop();
                                                        });
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
                                        ],
                                      )
                                    : Container(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
