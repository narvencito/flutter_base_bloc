// ignore_for_file: use_super_parameters, lines_longer_than_80_chars, strict_raw_type

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:movie/app/config/routes_app.dart';
import 'package:movie/utils/constans.dart';
// import 'package:movie/utils/constans.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final colorizeColors = const [
    ConstantsApp.primaryColor,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  final colorizeTextStyle = const TextStyle(
    fontSize: 50, fontWeight: FontWeight.w700,
    // fontFamily: 'Horizon',
  );

  @override
  void initState() {
    gotoPage();
    super.initState();
  }

  void gotoPage() {
    Future.delayed(const Duration(milliseconds: 1550), () {
      Navigator.pushReplacementNamed(context, RoutesApp.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: AnimatedTextKit(
              pause: const Duration(microseconds: 100),
              animatedTexts: [
                ColorizeAnimatedText(
                  'Emerson Navarro',
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
