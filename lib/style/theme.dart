import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Colors {

  const Colors();

  static const Color appLight = const Color(0xffff6090);
  static const Color appDark = const Color(0xFFb0003a);
  static const Color appPrimary = const Color(0xFFb0003a);
  static const Color black = const Color.fromRGBO(73, 68, 64, 1.0);
  static const Color blueDeep = const Color.fromRGBO(39, 53, 84, 1.0);

  static const primaryGradient = const LinearGradient(
    colors: const [appPrimary, appDark],
    stops: const [0.0, 1.0],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

class Style {
  static final baseTextStyle = const TextStyle(
      fontFamily: 'Poppins'
  );
  static final smallTextStyle = commonTextStyle.copyWith(
    fontSize: 9.0,
  );
  static final commonTextStyle = baseTextStyle.copyWith(
      color: const Color(0xffb6b2df),
      fontSize: 14.0,
      fontWeight: FontWeight.w400
  );
  static final titleTextStyle = baseTextStyle.copyWith(
      color: const Color(4294967295),
      fontSize: 18.0,
      fontWeight: FontWeight.w600
  );
  static final headerTextStyle = baseTextStyle.copyWith(
      color: const Color(4294967295),
      fontSize: 20.0,
      fontWeight: FontWeight.w400
  );
}