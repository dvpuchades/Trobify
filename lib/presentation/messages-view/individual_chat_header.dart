import 'package:flutter/material.dart';
import 'package:trobify/domain/entities/chat.dart';
import 'package:trobify/domain/entities/inmuebles.dart';
import 'package:trobify/domain/entities/user.dart';
import 'package:trobify/presentation/card-view/card_template.dart';
import 'package:trobify/presentation/core/constants.dart';
import 'package:trobify/presentation/map-view/inmueble_view.dart';

class IndividualChatHeader extends StatefulWidget {
  final Inmueble inmueble;
  final Chat? chat;

  const IndividualChatHeader({
    Key? key,
    required this.chat,
    required this.inmueble,
  }) : super(key: key);

  @override
  _IndividualChatHeaderState createState() => _IndividualChatHeaderState();
}

class _IndividualChatHeaderState extends State<IndividualChatHeader> {
  User userData = User();

  @override
  void initState() {
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Route route = MaterialPageRoute(builder: (context) => Inmueble_view(inmueble: widget.inmueble));
        Navigator.of(context).push(route);
      },
      child: Container(
        height: MediaQuery.of(context).size.height / 8,
        padding: EdgeInsets.all(4).copyWith(left: 0, right: 14),
        color: trobifyColor[1],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.1, child: BackButton(color: Colors.white)),
            CircleAvatar(
                radius: 35,
                backgroundImage: AssetImage(
                  'assets/images/media_not_found.jpg',
                ),
                foregroundImage: widget.inmueble.fotos.first != null
                    ? NetworkImage(
                        widget.inmueble.fotos.first!,
                      )
                    : null),
            VerticalDivider(
              width: 14,
              color: trobifyColor[1],
            ),
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('${widget.inmueble.tipoInmueble} en ${widget.inmueble.ciudad}',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold)),
                  Text(widget.inmueble.direccion,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold)),
                  Text(
                    '${widget.inmueble.precio.round()}€${formatoPrecio[widget.inmueble.formatoPrecio]}',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  widget.inmueble.idPropietario == userData.getID()
                      ? Tooltip(
                          message: 'Eres el propietario',
                          showDuration: Duration(seconds: 1),
                          waitDuration: Duration(milliseconds: 1),
                          child: Icon(
                            Icons.vpn_key,
                            size: 20,
                            color: Colors.black,
                          ),
                        )
                      : Divider(
                          color: trobifyColor[1],
                        ),
                  FutureBuilder(
                    initialData: '',
                    future: widget.chat!.getContactInfo(),
                    builder: (context, AsyncSnapshot<String> snapshot) {
                      return Tooltip(
                        message: snapshot.data!,
                        padding: EdgeInsets.all(12),
                        textStyle: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
                        showDuration: Duration(seconds: 1),
                        waitDuration: Duration(milliseconds: 1),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.contact_mail_outlined,
                              color: Colors.black,
                              size: 30,
                            ),
                            FutureBuilder(
                              initialData: '',
                              future: widget.chat!.getUserName(),
                              builder: (context, AsyncSnapshot<String> snapshot) {
                                return Text(
                                  snapshot.data!,
                                  textAlign: TextAlign.right,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
