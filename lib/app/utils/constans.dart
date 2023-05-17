// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';

class ConstantsApp {
  //colors
  static const primaryColor = Color.fromARGB(255, 34, 125, 209);
  static const buttonColorPrimary = Color.fromRGBO(20, 135, 173, 0.4);
  static const buttonColorSecondary = Color.fromRGBO(141, 26, 26, 0.4);
  static const buttonColorTertiary = Color.fromRGBO(67, 201, 85, 0.4);

  static const textColorPrimary = Color.fromRGBO(8, 8, 8, 0.4);
  static const textColorSecondary = Color.fromRGBO(61, 63, 63, 0.4);
  static const textColorTertiary = Color.fromRGBO(179, 180, 180, 0.4);

  //images
  static String logoApp = 'assets/logo.app';
  static String iconAdd = 'assets/icons/add.png';
  static String iconDelete = 'assets/icons/delete.png';
  static String iconSend = 'assets/icons/send.png';
  static String icondownload = 'assets/icons/download.png';

  //text
  static const labelStyle = TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 40);
  static const unselectedLabelStyle = TextStyle(color: Color.fromARGB(96, 95, 92, 92), fontWeight: FontWeight.w600, fontSize: 24);
}
