// ignore_for_file: lines_longer_than_80_chars, strict_raw_type, directives_ordering

import 'package:emerson/app/modules/anged/page/anged_page.dart';
import 'package:flutter/material.dart';
import 'package:emerson/app/modules/duoling_page.dart';
import 'package:emerson/app/modules/home/page/home_page.dart';
import 'package:emerson/app/modules/movie/model/movie_response_model2.dart';
import 'package:emerson/app/modules/movie/page/movie_page.dart';
import 'package:emerson/app/modules/movie_detail/page/movie_detail_page.dart';
import 'package:emerson/app/modules/splash/page/splash_page.dart';
import 'package:emerson/app/modules/user/page/login_page.dart';

class RoutesApp {
  static const splash = '/';
  static const login = '/login';
  static const home = '/home';
  static const movie = '/movie';
  static const movieDetail = '/movie-detail';
  static const duolingo = '/duolingo';
  static const anged = '/anged'; //ahorcado

  static Route routes(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (context) => const SplashPage());
      case login:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
          transitionDuration: const Duration(milliseconds: 1000),
          transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
        );
      case home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case movie:
        return MaterialPageRoute(builder: MoviePage.create);
      case movieDetail:
        return MaterialPageRoute(
          builder: (_) => MovieDetailPage(
            movie: args! as Results,
          ),
        );
      case duolingo:
        return MaterialPageRoute(builder: (context) => const DuolingoPage());
      case anged:
        return MaterialPageRoute(builder: (context) => const AngedPage());
    }
    throw Exception('This route does not exists');
  }
}
