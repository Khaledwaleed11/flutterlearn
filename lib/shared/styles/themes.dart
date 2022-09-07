import 'package:course/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';

ThemeData darkTheme =  ThemeData(
  scaffoldBackgroundColor: HexColor('333739'),
  primarySwatch:defaultColors,
  appBarTheme: AppBarTheme(
    titleSpacing: 20,
    backgroundColor: HexColor('333739'),
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: HexColor('333739'),
      statusBarIconBrightness: Brightness.light,
    ),
    titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.bold),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    elevation: 20,
    backgroundColor: HexColor('333739'),
    unselectedItemColor: Colors.grey,
  ),
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  fontFamily: 'Jannah',
);
ThemeData lightTheme =   ThemeData(
  primarySwatch:defaultColors,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,
  ),
  appBarTheme: const AppBarTheme(
    titleSpacing: 20,
    backgroundColor: Colors.white,
    elevation: 0,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.deepOrange,
    elevation: 20,
    backgroundColor: Colors.white,
    unselectedItemColor: Colors.grey,
  ),
  scaffoldBackgroundColor: Colors.white,
  textTheme: const TextTheme(
    bodyText1: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
  ),
  fontFamily: 'Jannah',

);
