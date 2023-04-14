// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:movie/app/modules/home/page/home_page.dart';
import 'package:movie/app/modules/movie/page/movie_page.dart';
import 'package:movie/app/modules/splash/page/splash_page.dart';
import 'package:movie/app/modules/user/page/login_page.dart';
// import 'package:page_animation_transition/animations/fade_animation_transition.dart';
// import 'package:page_animation_transition/animations/right_to_left_faded_transition.dart';
// import 'package:page_animation_transition/page_animation_transition.dart';
// import 'package:transition/transition.dart';

class RoutesApp {
  static const splash = '/';
  static const login = '/login';
  static const home = '/home';
  static const movie = '/movie';
  static const movieDetail = '/movie-detail';

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
      // return Transition(child: LoginPage(), transitionEffect: TransitionEffect.LEFT_TO_RIGHT);
      // return PageAnimationTransition(page: LoginPage(), pageAnimationType: RightToLeftFadedTransition());
      // return MaterialPageRoute(builder: (context) => LoginPage());
      case home:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case movie:
        return MaterialPageRoute(builder: MoviePage.create);
      //case newsDetails:
      //  return MaterialPageRoute(
      //      builder: (_) => NewsDetailScreen.create(args!));
    }
    throw Exception('This route does not exists');
  }
}
