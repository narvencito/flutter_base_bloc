// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

enum Flavor {
  DEV,
  PROD,
}

class InitFlavorConfig {
  static Flavor? appFlavor;

  static String get building {
    return appFlavor.toString();
  }

  static String get urlApp {
    switch (appFlavor!) {
      case Flavor.DEV:
        return 'https://api.themoviedb.org/3/movie';
      case Flavor.PROD:
        return '';
    }
  }

  static String get imageUrl {
    switch (appFlavor!) {
      case Flavor.DEV:
        return 'https://image.tmdb.org/t/p/original';
      case Flavor.PROD:
        return '';
    }
  }

  static String get apiKey {
    switch (appFlavor!) {
      case Flavor.DEV:
        return '5927f7059d649ac95ab1e3196f25ec1c';
      case Flavor.PROD:
        return '';
    }
  }

  static String get userTest {
    switch (appFlavor!) {
      case Flavor.DEV:
        return '';
      case Flavor.PROD:
        return '';
    }
  }

  static String get passwordUserTest {
    switch (appFlavor!) {
      case Flavor.DEV:
        return '123456';
      case Flavor.PROD:
        return '';
    }
  }

  static Color get colorPrincipal {
    switch (appFlavor!) {
      case Flavor.DEV:
        return const Color.fromRGBO(103, 192, 83, 1);
      case Flavor.PROD:
        return const Color.fromRGBO(255, 80, 72, 1);
    }
  }
}
