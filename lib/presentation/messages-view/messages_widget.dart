import 'package:flutter/material.dart';
import 'package:trobify/application/chat-observer/observer.dart';
import 'package:trobify/domain/entities/chat.dart';
import 'package:trobify/domain/entities/mensaje.dart';
import 'package:trobify/domain/entities/user.dart';
import 'message_widget.dart';

class MessagesWidget extends StatefulWidget {
  final Chat? chat;
  const MessagesWidget({
    Key? key,
    required this.chat,
  }) : super(key: key);

  @override
  _MessagesWidgetState createState() => _MessagesWidgetState();
}

class _MessagesWidgetState extends State<MessagesWidget> implements Observer {
  User userData = User();

  @override
  Widget build(BuildContext context) {
    final subject = widget.chat!;
    subject.addObserver(this);

    return Container(
      child:
          (widget.chat!.mensajes.isEmpty) ? Text('Comienza con un saludo...') : _buildMessages(widget.chat!.mensajes),
    );
  }

  @override
  void update() {
    if (mounted) {
      setState(() {});
    }
  }

  Widget _buildMessages(List<Mensaje> mensajes) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      reverse: true,
      itemCount: mensajes.length,
      itemBuilder: (BuildContext context, int index) {
        return MessageWidget(mensaje: mensajes[index], isMe: userData.getID() == mensajes[index].senderID);
      },
    );
  }
}
