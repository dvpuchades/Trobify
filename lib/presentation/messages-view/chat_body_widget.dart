import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trobify/application/chat-observer/observer.dart';
import 'package:trobify/domain/entities/chat.dart';
import 'package:trobify/domain/entities/user.dart';
import 'package:trobify/presentation/card-view/card_template.dart';
import 'package:trobify/presentation/core/constants.dart';

import 'individual_chat.dart';

class ChatBodyWidget extends StatefulWidget {
  final List<Chat> chats;
  const ChatBodyWidget({Key? key, required this.chats}) : super(key: key);

  @override
  _ChatBodyWidgetState createState() => _ChatBodyWidgetState();
}

class _ChatBodyWidgetState extends State<ChatBodyWidget> implements Observer {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: _buildChats(context),
    );
  }

  Widget _buildChats(BuildContext context) {
    var userData = User();
    return ListView(
        physics: BouncingScrollPhysics(),
        children: widget.chats.map((chat) {
          final subject = chat;
          subject.addObserver(this);
          var inmueble = chat.inmueble;
          return Container(
            height: MediaQuery.of(context).size.height / 7,
            padding: EdgeInsets.all(2),
            color: Colors.grey.shade100,
            child: ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => IndividualChat(chat: chat, inmueble: inmueble)));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                      radius: 35,
                      backgroundImage: AssetImage(
                        'assets/images/media_not_found.jpg',
                      ),
                      foregroundImage: inmueble.fotos.first != null
                          ? NetworkImage(
                              inmueble.fotos.first!,
                            )
                          : null),
                  VerticalDivider(
                    width: 10,
                    color: Colors.white,
                  ),
                  Expanded(
                    flex: 8,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.10,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('${inmueble.tipoInmueble} en ${inmueble.ciudad}',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 15, color: trobifyColor[1], fontWeight: FontWeight.bold)),
                              Text(
                                '${inmueble.precio.round()}€${formatoPrecio[inmueble.formatoPrecio]}',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 20, color: trobifyColor[1], fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FutureBuilder(
                                  initialData: '',
                                  future: chat.getLastMessage(),
                                  builder: (context, AsyncSnapshot<String> snapshot) {
                                    return Text(
                                      snapshot.data!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
                                    );
                                  }),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        inmueble.idPropietario == userData.getID()
                            ? Tooltip(
                                message: 'Eres el propietario',
                                showDuration: Duration(seconds: 1),
                                waitDuration: Duration(milliseconds: 1),
                                child: Icon(
                                  Icons.vpn_key,
                                  size: 18,
                                  color: Colors.black,
                                ),
                              )
                            : Divider(
                                color: Colors.white,
                              ),
                        FutureBuilder(
                            initialData: '',
                            future: chat.getContactInfo(),
                            builder: (context, AsyncSnapshot<String> snapshot) {
                              return Tooltip(
                                message: snapshot.data!,
                                padding: EdgeInsets.all(12),
                                textStyle:
                                    const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.normal),
                                showDuration: Duration(seconds: 1),
                                waitDuration: Duration(milliseconds: 1),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.contact_mail_outlined,
                                      color: Colors.black,
                                      size: 28,
                                    ),
                                    FutureBuilder(
                                      initialData: '',
                                      future: chat.getUserName(),
                                      builder: (context, AsyncSnapshot<String> snapshot) {
                                        return Text(
                                          snapshot.data!,
                                          textAlign: TextAlign.center,
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
                            }),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }).toList());
  }

  @override
  void update() {
    if (mounted) {
      setState(() {});
    }
  }
}
