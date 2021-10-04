import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trobify/application/chat-observer/observer.dart';
import 'package:trobify/application/chat-observer/subject.dart';
import 'package:trobify/domain/entities/inmuebles.dart';
import 'package:trobify/domain/entities/mensaje.dart';
import 'package:trobify/domain/entities/user.dart';

class Chat implements Subject {
  late String chatID;
  late String clientID;
  late Inmueble inmueble;
  late DateTime lastMessageTime;
  late String ownerID;
  late List<Mensaje> mensajes;
  late User userData = User();

  List<Observer> observers = <Observer>[];

  Chat({
    required this.chatID,
    required this.clientID,
    required this.inmueble,
    required this.lastMessageTime,
    required this.ownerID,
    required this.mensajes,
  });

  Future uploadMessage(String texto) async {
    var chatid = chatID;
    var userid = userData.getID();
    var datenow = DateTime.now();
    var mensaje = Mensaje(senderID: userid, texto: texto, time: datenow);

    mensajes.insert(0, mensaje);
    lastMessageTime = datenow;

    final _firestore = FirebaseFirestore.instance;

    await _firestore.collection('chats/$chatid/mensajes').add({
      'texto': texto,
      'time': Timestamp.fromDate(datenow),
      'senderID': userid,
    }).then((value) {
      _firestore.collection('chats').doc(chatid).update({
        'lastMessageTime': Timestamp.fromDate(datenow),
      });
    });
  }

  void updateMessages() {
    FirebaseFirestore.instance
        .collection('chats/$chatID/mensajes')
        .orderBy('time', descending: true)
        .snapshots()
        .listen((querySnapshot) {
      mensajes.clear();
      querySnapshot.docs.forEach((doc) {
        var aux = mensajefromJson(doc);
        mensajes.add(aux);
      });
      notifyObservers();
    });
  }

  Future removeChatOnFirebase() async {
    await FirebaseFirestore.instance.collection('chats').doc(chatID).delete();
  }

  Future<String> getLastMessage() async {
    var userName = '';
    await FirebaseFirestore.instance.collection('users').doc(mensajes.first.senderID).get().then((user) {
      if (user.exists) {
        userName = user['name'];
      } else {
        userName = 'Error Null';
      }
    });
    return userName + ': ' + mensajes.first.texto;
  }

  Future<String> getContactInfo() async {
    var res = '';
    if (userData.getID() == ownerID) {
      await FirebaseFirestore.instance.collection('users').doc(clientID).get().then((user) {
        if (user.exists) {
          res += user['name'] + ' ';
          res += user['surname'] + ' \n';
          res += user['email'];
        } else {
          res = 'Error Null';
        }
      });
    } else {
      await FirebaseFirestore.instance.collection('users').doc(ownerID).get().then((user) {
        if (user.exists) {
          res += user['name'] + ' ';
          res += user['surname'] + ' \n';
          res += user['email'];
        } else {
          res = 'Error Null';
        }
      });
    }
    return res;
  }

  Future<String> getUserName() async {
    var res = '';
    if (userData.getID() == ownerID) {
      await FirebaseFirestore.instance.collection('users').doc(clientID).get().then((user) {
        if (user.exists) {
          res = user['name'];
        } else {
          res = 'Error Null';
        }
      });
    } else {
      await FirebaseFirestore.instance.collection('users').doc(ownerID).get().then((user) {
        if (user.exists) {
          res = user['name'];
        } else {
          res = 'Error Null';
        }
      });
    }
    return res;
  }

  @override
  void addObserver(Observer obs) {
    observers.add(obs);
  }

  @override
  void removeObserver(Observer obs) {
    observers.remove(obs);
  }

  @override
  void notifyObservers() {
    observers.forEach((obs) {
      obs.update();
    });
  }
}
