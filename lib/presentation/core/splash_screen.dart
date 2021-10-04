import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:trobify/application/filtros-bloc/filtros_bloc.dart';
import 'package:trobify/application/map-view-bloc/map_view_bloc.dart';
import 'package:trobify/application/search-view-bloc/search_view_bloc.dart';
import 'package:trobify/presentation/core/constants.dart';
import 'package:trobify/presentation/home-view/home.dart';

GlobalKey homepage = GlobalKey();

class TrobifySplashScreen extends StatelessWidget {
  const TrobifySplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: SplashScreenView(
        navigateRoute: MultiBlocProvider(
          providers: [
            BlocProvider<MapViewBloc>(
              create: (context) => MapViewBloc(),
            ),
            BlocProvider<FiltrosBloc>(
              create: (filtrosblocContext) => FiltrosBloc(),
            ),
            BlocProvider<SearchViewBloc>(
              create: (searchblovContext) => SearchViewBloc(),
            ),
          ],
          child: MyHomePage(
            key: homepage,
          ),
        ),
        duration: 1500,
        imageSize: 600,
        imageSrc: 'assets/images/logo-letra.png',
        backgroundColor: trobifyColor[1],
      ),
      duration: 3000,
      imageSize: 100,
      imageSrc: 'assets/images/logo1.png',
      text: 'Trobify',
      textType: TextType.TyperAnimatedText,
      textStyle: TextStyle(
        fontSize: 50.0,
      ),
      backgroundColor: Colors.white,
    );
  }
}
