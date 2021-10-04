import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trobify/application/auth/auth_bloc.dart';
import 'package:trobify/domain/entities/chat.dart';
import 'package:trobify/domain/entities/user.dart';
import 'package:trobify/infrastructure/core/firebase_chat.dart';
import 'package:trobify/presentation/core/constants.dart';
import 'chat_body_widget.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userData = User();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Chat',
            style: Body2TextStyle,
            textScaleFactor: 1.75,
            textAlign: TextAlign.center,
          ),
        ),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (userData.getName() != '' && userData.getSurname() != '' && userData.getPhone() != '') {
              return state.map(
                  initial: (_) => Container(),
                  authenticated: (_) => FutureBuilder<List<Chat>>(
                        future: FirebaseChat.getChatListFromUser(userData.getID()),
                        builder: (context, chatListSnapshot) {
                          if (!chatListSnapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return ChatBodyWidget(chats: chatListSnapshot.data!);
                          }
                        },
                      ),
                  unauthenticated: (_) => Center(child: const Text('Inicia sesión para chatear')));
            } else {
              return Center(child: const Text('Necesitas añadir tu información personal para poder chatear.'));
            }
          },
        ));
  }
}
