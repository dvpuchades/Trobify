import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trobify/application/auth/auth_bloc.dart';
import 'package:trobify/domain/entities/user.dart';
import 'package:trobify/presentation/card-view/my_inmuebles_list_card.dart';
import 'package:trobify/presentation/core/constants.dart';

class MyInmueblesView extends StatelessWidget {
  const MyInmueblesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = User();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mis inmuebles',
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
                    itemCount: userData.getPropList().length,
                    itemBuilder: (context, index) {
                      return Container(
                          padding: EdgeInsets.symmetric(vertical: 4),
                          child: MyInmueblesListCard(
                            inmueble: userData.getPropList()[index],
                          ));
                    },
                  ),
              unauthenticated: (_) => Center(child: const Text('Inicia sesión para visualizar tus inmuebles')));
        },
      ),
    );
  }
}
