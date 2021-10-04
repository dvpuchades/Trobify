import 'package:trobify/domain/entities/chat.dart';
import 'package:trobify/domain/entities/inmuebles.dart';
import 'package:flutter/material.dart';

import 'individual_chat_header.dart';
import 'input_new_message.dart';
import 'messages_widget.dart';

class IndividualChat extends StatefulWidget {
  final Chat? chat;
  final Inmueble inmueble;

  const IndividualChat({
    required this.chat,
    required this.inmueble,
  });

  @override
  _IndividualChatState createState() => _IndividualChatState();
}

class _IndividualChatState extends State<IndividualChat> {
  @override
  void dispose() async {
    super.dispose();
    if (widget.chat!.mensajes.isEmpty) {
      await widget.chat!.removeChatOnFirebase();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            IndividualChatHeader(chat: widget.chat, inmueble: widget.inmueble),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: MessagesWidget(chat: widget.chat),
              ),
            ),
            InputNewMessage(chat: widget.chat),
          ],
        ),
      ),
    );
  }
}
