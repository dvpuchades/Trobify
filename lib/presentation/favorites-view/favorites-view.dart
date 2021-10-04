import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trobify/application/auth/auth_bloc.dart';
import 'package:trobify/domain/entities/user.dart';
import 'package:trobify/presentation/card-view/list_card.dart';
import 'package:trobify/presentation/core/constants.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = User();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Favoritos',
            style: Body2TextStyle,
            textScaleFactor: 1.75,
            textAlign: TextAlign.center,
          ),
        ),
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return state.map(
                initial: (_) => Container(),
                authenticated: (_) => ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: userData.getFavList().length,
                      itemBuilder: (context, index) {
                        return Container(
                            padding: EdgeInsets.symmetric(vertical: 4),
                            child: ListCard(inmueble: userData.getFavList()[index]));
                      },
                    ),
                unauthenticated: (_) => Center(child: const Text('Inicia sesión para guardar tus sitios favoritos')));
          },
        ));
  }
}
