import 'package:flutter/material.dart';
import 'package:trobify/domain/entities/mensaje.dart';
import 'package:trobify/presentation/core/constants.dart';

class MessageWidget extends StatelessWidget {
  final Mensaje mensaje;
  final bool isMe;
  const MessageWidget({
    Key? key,
    required this.mensaje,
    required this.isMe,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radius = Radius.circular(12);
    final borderRadius = BorderRadius.all(radius);

    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.all(6).copyWith(left: 2, right: 2),
          constraints: BoxConstraints(maxWidth: 350),
          decoration: BoxDecoration(
            color: isMe ? trobifyColor[1] : Colors.grey[100],
            borderRadius: isMe
                ? borderRadius.subtract(BorderRadius.only(bottomRight: radius))
                : borderRadius.subtract(BorderRadius.only(bottomLeft: radius)),
          ),
          child: _buildMessage(mensaje.texto),
        ),
      ],
    );
  }

  Widget _buildMessage(String message) {
    return Text(message,
        style: TextStyle(
          fontSize: 16,
        ),
        textAlign: TextAlign.justify);
  }
}
