import 'package:trobify/domain/entities/chat.dart';
import 'package:trobify/presentation/core/constants.dart';
import 'package:flutter/material.dart';

class InputNewMessage extends StatefulWidget {
  final Chat? chat;

  const InputNewMessage({
    required this.chat,
  });

  @override
  _InputNewMessageState createState() => _InputNewMessageState();
}

class _InputNewMessageState extends State<InputNewMessage> {
  final TextEditingController _textController = TextEditingController();
  String _message = '';

  void _sendMessage() async {
    FocusScope.of(context).unfocus();

    await widget.chat!.uploadMessage(_message);

    setState(() {
      _message = '';
    });
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textController,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[100],
                hintText: 'Escriba su mensaje',
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0),
                  gapPadding: 10,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onChanged: (text) {
                setState(() {
                  _message = text;
                });
              },
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01),
          Material(
            shape: CircleBorder(),
            color: trobifyColor[1],
            child: IconButton(
              icon: Icon(Icons.send),
              color: Colors.white,
              onPressed: () {
                setState(() {
                  if (_message.trim().isNotEmpty) _sendMessage();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
