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

class MapCard extends StatefulWidget {
  final Inmueble inmueble;
  const MapCard({
    Key? key,
    required this.inmueble,
  }) : super(key: key);

  @override
  _MapCardState createState() => _MapCardState();
}

class _MapCardState extends State<MapCard> {
  late Icon _favIcon;
  final userData = User();

  @override
  void initState() {
    if (userData.getID().isNotEmpty) {
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
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 8),
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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
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
                  flex: 5,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          flex: 5,
                          child: Text(
                            '${widget.inmueble.tipoInmueble} en ${widget.inmueble.ciudad}',
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text(
                            '${widget.inmueble.direccion}',
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '${compactarPrecio(widget.inmueble.precio)}€${formatoPrecio[widget.inmueble.formatoPrecio]}',
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return state.map(
                        initial: (_) => Container(),
                        authenticated: (_) => Expanded(
                            flex: 2,
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
          ),
        ));
  }
}
