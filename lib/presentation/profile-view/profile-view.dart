import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trobify/application/auth/auth_bloc.dart';
import 'package:trobify/presentation/profile-view/login-screen-pro.dart';
import 'package:trobify/presentation/profile-view/profile-menu.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state.map(
            initial: (_) {
              return Container();
            },
            authenticated: (_) => ProfileMenu(),
            unauthenticated: (_) => LoginScreenPro());
      },
    );
  }
}
