import 'package:flutter/material.dart';
import 'package:trobify/presentation/core/constants.dart';
import 'package:trobify/presentation/favorites-view/favorites-view.dart';
import 'package:trobify/presentation/messages-view/chat-list-view.dart';
import 'package:trobify/presentation/profile-view/profile-view.dart';
import 'package:trobify/presentation/start-view/start_view.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

int index = 0;

class _MyHomePageState extends State<MyHomePage> {
  final Pages = [StartView(), FavoritesView(), ChatListView(), ProfileView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Pages[index],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: trobifyColor[3],
        unselectedItemColor: trobifyColor[1],
        backgroundColor: trobifyColor[2],
        iconSize: iconSize,
        type: BottomNavigationBarType.shifting,
        elevation: defaultElevation,
        currentIndex: index,

        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(label: 'Mapa', icon: Icon(Icons.map_outlined), activeIcon: Icon(Icons.map_rounded)),
          BottomNavigationBarItem(
              label: 'Favoritos', icon: Icon(Icons.favorite_border), activeIcon: Icon(Icons.favorite)),
          BottomNavigationBarItem(
              label: 'Mensajes', icon: Icon(Icons.chat_bubble_outline), activeIcon: Icon(Icons.chat)),
          BottomNavigationBarItem(
              label: 'Perfil',
              icon: Icon(Icons.account_circle_outlined),
              activeIcon: Icon(Icons.account_circle_rounded)),
        ],
        //selectedLabelStyle: TextStyle,
      ),
    );
  }
}
