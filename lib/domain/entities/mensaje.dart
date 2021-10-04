import 'package:cloud_firestore/cloud_firestore.dart';

class Mensaje {
  String senderID;
  String texto;
  DateTime time;

  Mensaje({
    required this.senderID,
    required this.texto,
    required this.time,
  });
}

Mensaje mensajefromJson(DocumentSnapshot doc) {
  return Mensaje(
    senderID: doc['senderID'],
    texto: doc['texto'],
    time: doc['time'].toDate(),
  );
}
