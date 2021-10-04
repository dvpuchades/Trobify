import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trobify/application/auth/auth_bloc.dart';
import 'package:trobify/presentation/core/splash_screen.dart';
import 'package:trobify/domain/entities/user.dart' as model;
import 'package:trobify/presentation/core/constants.dart';

class TrobifyApp extends StatefulWidget {
  @override
  _TrobifyAppState createState() => _TrobifyAppState();
}

class _TrobifyAppState extends State<TrobifyApp> {
  @override
  void initState() {
    var userData = model.User();
    userData.getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc()..add(AuthEvent.authCheckRequested()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Trobify App',
        theme: ThemeData(

            //primarySwatch: kprimaryColor,
            scaffoldBackgroundColor: Colors.white,
            primaryColor: trobifyColor[1],
            visualDensity: VisualDensity.adaptivePlatformDensity,
            appBarTheme: AppBarTheme(
              textTheme: TextTheme(headline6: AppBarTextStyle),
            ),
            textTheme: TextTheme(
              headline6: TitleTextStyle,
              bodyText1: Body1TextStyle,
              bodyText2: Body2TextStyle,
            )),
        locale: Locale('es'),
        home: TrobifySplashScreen(),
      ),
    );
  }
}
