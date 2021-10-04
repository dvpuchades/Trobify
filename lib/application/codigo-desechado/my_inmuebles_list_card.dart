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
import '../../presentation/profile-view/modif-view.dart';
import 'map_card.dart';

class MyInmueblesListCard extends StatefulWidget {
  final Inmueble inmueble;
  const MyInmueblesListCard({
    Key? key,
    required this.inmueble,
  }) : super(key: key);

  @override
  _MyInmueblesListCardState createState() => _MyInmueblesListCardState();
}

class _MyInmueblesListCardState extends State<MyInmueblesListCard> {
  late Icon _editIcon;
  late Icon _deleteIcon;
  late Icon _favIcon;
  final userData = User();

  @override
  void initState() {
    if (userData.getID().isNotEmpty) {
      _editIcon = Icon(Icons.create_rounded);
      _deleteIcon = Icon(Icons.delete_rounded);
      if (userData.getFavList().isNotEmpty) {
        _favIcon = userData.getFavList().where((element) => element.inmuebleID == widget.inmueble.inmuebleID).isEmpty
            ? Icon(Icons.favorite_outline)
            : Icon(Icons.favorite);
      } else {
        _favIcon = Icon(Icons.favorite_outline);
      }
    }
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / 1.2,
        height: MediaQuery.of(context).size.height / 3.65,
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
        child: ElevatedButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
              backgroundColor: MaterialStateProperty.all<Color>(trobifyColor[1]!),
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
                    flex: 6,
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
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 5,
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
                                      authenticated: (_) => Expanded(
                                          flex: 1,
                                          child: Container(
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
                                                            color: Colors.blue,
                                                            textStyle: TextStyle(color: Colors.white),
                                                            iconColor: Colors.white,
                                                          ),
                                                        ]);
                                                  }
                                                },
                                              ))),
                                      unauthenticated: (_) => Container());
                                },
                              ),
                            ],
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              '${widget.inmueble.direccion}',
                              style: TextStyle(fontSize: 16),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Expanded(
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
                              )),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 3.8,
                                child: FittedBox(
                                  alignment: Alignment.centerLeft,
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    '${compactarPrecio(widget.inmueble.precio)}€${formatoPrecio[widget.inmueble.formatoPrecio]}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    icon: _editIcon,
                                    alignment: Alignment.centerRight,
                                    color: Colors.black,
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) => ModificarInmueble(widget.inmueble)))
                                          .then((_) {
                                        setState(() {});
                                      });
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
                            ],
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
