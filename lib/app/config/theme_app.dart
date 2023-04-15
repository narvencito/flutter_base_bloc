import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movie/utils/constans.dart';

class ThemeApp {
  final light = ThemeData(
    appBarTheme: const AppBarTheme(
      elevation: 0,
      foregroundColor: Colors.black,
      centerTitle: true,
      color: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    useMaterial3: false,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: ConstantsApp.primaryColor,
    fontFamily: 'OpenSans',
    brightness: Brightness.light,
    textTheme: const TextTheme(),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.green,
    ).copyWith(secondary: const Color.fromARGB(255, 34, 125, 209)).copyWith(
          background: const Color.fromARGB(255, 34, 125, 209),
        ),
    scaffoldBackgroundColor: Colors.white,
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.black,
      labelStyle: ConstantsApp.labelStyle,
      unselectedLabelStyle: ConstantsApp.unselectedLabelStyle,
    ),
  );
}
