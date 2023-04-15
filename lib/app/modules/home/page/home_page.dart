// ignore_for_file: cascade_invocations, lines_longer_than_80_chars, directives_ordering

import 'package:flutter/material.dart';
import 'package:emerson/app/common/navigation_app/navigation_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SafeArea(
        child: Scaffold(
          body: PageView(
            controller: pageController,
            onPageChanged: pageChanged,
            children: [
              Container(
                color: Colors.yellowAccent,
              ),
              Container(
                color: Colors.red,
              ),
              Container(
                color: Colors.blue,
              ),
            ],
          ),
          bottomNavigationBar: NavigationPage(),
          // bottomNavigationBar: BottomNavigationBar(
          //   elevation: 2,
          //   currentIndex: currentIndex,
          //   onTap: (index) {
          //     pageController.animateToPage(
          //       index,
          //       duration: const Duration(milliseconds: 500),
          //       curve: Curves.ease,
          //     );
          //     setState(() {
          //       currentIndex = index;
          //     });
          //   },
          //   items: const [
          //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          //     BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Películas'),
          //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
          //   ],
          // ),
        ),
      ),
    );
  }

  void pageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }
}
