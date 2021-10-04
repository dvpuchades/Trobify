import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:trobify/domain/entities/chat.dart';
import 'package:trobify/domain/entities/inmuebles.dart';
import 'package:trobify/domain/entities/mensaje.dart';
import 'package:trobify/infrastructure/core/firebase_inmueble.dart';
import 'package:trobify/presentation/messages-view/individual_chat.dart';

class FirebaseChat {
  static Future openChat(BuildContext context, Inmueble inmueble, String userid) async {
    var flag = false;
    var chataux;
    var chats = await getChatListFromUser(userid);

    for (var chat in chats) {
      if (chat.inmueble.inmuebleID == inmueble.inmuebleID) {
        chataux = chat;
        flag = true;
        break;
      }
    }

    if (flag) {
      await Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => IndividualChat(chat: chataux, inmueble: inmueble)));
    } else {
      await createNewChat(context, inmueble, userid);
    }
  }

  static Future createNewChat(BuildContext context, Inmueble inmueble, String userid) async {
    final _firestore = FirebaseFirestore.instance;

    await _firestore.collection('chats').add({
      'clientID': userid,
      'inmueble': _firestore.collection('inmuebles').doc(inmueble.inmuebleID),
      'lastMessageTime': Timestamp.fromDate(DateTime.now()),
      'ownerID': inmueble.idPropietario,
    }).then((value) async {
      var chataux = await chatfromJson(await value.get());
      await Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => IndividualChat(chat: chataux, inmueble: inmueble)));
    });
  }

  static Future<List<Chat>> getChatListFromUser(String id) async {
    var chats = <Chat>[];
    var chatListAsClient = <Chat>[];
    var chatListAsOwner = <Chat>[];
    chatListAsClient = await getChatListFromRol(id, 'clientID');
    chatListAsOwner = await getChatListFromRol(id, 'ownerID');
    chats..addAll(chatListAsClient)..addAll(chatListAsOwner);
    chats.sort((a, b) => b.lastMessageTime.compareTo(a.lastMessageTime));
    return chats;
  }

  static Future<List<Chat>> getChatListFromRol(String id, String rol) async {
    var chatListFromRol = <Chat>[];
    await FirebaseFirestore.instance.collection('chats').where(rol, isEqualTo: id).get().then((querySnapshot) async {
      for (DocumentSnapshot doc in querySnapshot.docs) {
        var aux = await chatfromJson(doc);
        chatListFromRol.add(aux);
      }
    });

    return chatListFromRol;
  }

  static Future<Chat> chatfromJson(DocumentSnapshot doc) async {
    var id = doc.id;
    var mensajes = <Mensaje>[];
    await FirebaseFirestore.instance
        .collection('chats/$id/mensajes')
        .orderBy('time', descending: true)
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        var aux = mensajefromJson(doc);
        mensajes.add(aux);
      });
    });

    DocumentSnapshot snapshot = await doc['inmueble'].get();
    var inmueble = FirebaseInmueble.inmueblefromJson(snapshot);
    var chat = Chat(
      chatID: id,
      clientID: doc['clientID'],
      inmueble: inmueble,
      lastMessageTime: doc['lastMessageTime'].toDate(),
      ownerID: doc['ownerID'],
      mensajes: mensajes,
    );
    chat.updateMessages();

    return chat;
  }
}
