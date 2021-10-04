import 'package:flutter/material.dart';

//Colors
MaterialColor trobifyColor = MaterialColor(
  _trobifyPrimaryValue,
  <int, Color>{
    1: Color(0xFFFDC503), //primaryColor
    2: Colors.white, //Color(0xFFFFFFFF),    //backgroundColor
    3: Color(0xFF083663), //selectColor
    4: Color(0xFF1D1D1B), //textColor
  },
);

int _trobifyPrimaryValue = 0xFFFDC503;

const double defaultPadding = 20.0;

const double iconSize = 25;

const double defaultElevation = 10;

//Text
const LargeTextSize = 26.0;
const MediumTextSize = 20.0;
const Body1TextSize = 16.0;
const Body2TextSize = 14.0;

const String FontNameDefault = 'Roboto';

TextStyle AppBarTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w700,
  fontSize: MediumTextSize,
  color: trobifyColor[1],
);

TextStyle TitleTextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w700,
  fontSize: LargeTextSize,
  color: trobifyColor[4],
);

TextStyle Body1TextStyle = TextStyle(
  fontFamily: FontNameDefault,
  //fontWeight: FontWeight.w300,
  fontSize: Body1TextSize,
  color: trobifyColor[4],
);

TextStyle Body2TextStyle = TextStyle(
  fontFamily: FontNameDefault,
  fontWeight: FontWeight.w300,
  fontSize: Body2TextSize,
  color: trobifyColor[4],
);
