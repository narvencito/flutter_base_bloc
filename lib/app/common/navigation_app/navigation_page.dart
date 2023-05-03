// ignore_for_file: must_be_immutable, lines_longer_than_80_chars, unnecessary_lambdas, cascade_invocations

import 'package:emerson/app/common/navigation_app/app_tab_bar.dart';
import 'package:emerson/app/modules/anged/page/anged_page.dart';
import 'package:emerson/app/modules/duolingo/duolingo_page.dart';
import 'package:emerson/app/modules/movie/page/movie_page.dart';
import 'package:emerson/app/modules/user/page/profile_page.dart';
import 'package:emerson/utils/constans.dart';

import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  NavigationPage({super.key, this.selectedIndex});
  int? selectedIndex;

  @override
  State<NavigationPage> createState() => NavigationPageState();
}

class NavigationPageState extends State<NavigationPage> {
  GlobalKey<AppTapBarState> tapbarKey = GlobalKey<AppTapBarState>();
  // BottonNavigationController navigationController = Get.put(BottonNavigationController());

  final pageController = PageController();
  int currentIndex = 0;
  final screens = [];

  @override
  void initState() {
    super.initState();
    screens.add(const DuolingoPage());
    screens.add(MoviePage.create(context));
    screens.add(const AngedPage());
    screens.add(const ProfilePage());
  }

  void onChangePageFromSelectedIndex() {
    currentIndex = widget.selectedIndex!;
    // navigationController.changeIndex(currentIndex);
    onChangePageApp(currentIndex);
    tapbarKey.currentState!.onChangeSelectedTab(currentIndex);
  }

  void onChangePageApp(int index) {
    setState(() {
      currentIndex = index;
    });
    pageController.jumpToPage(currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: screens.length,
          controller: pageController,
          // index: navigationController.selectedIndex.value,
          itemBuilder: (context, index) {
            return screens[index] as Widget;
          },
        ),
        bottomNavigationBar: AppTapBar(
          key: tapbarKey,
          selectedColor: ConstantsApp.primaryColor,
          //backGroundColor: Colors.white,
          // initialIndex: navigationController.selectedIndex.value,
          initialIndex: currentIndex,
          onTapChanged: (index) async {
            // navigationController.changeIndex(index);
            onChangePageApp(index);
          },
          items: [
            ItemTapBar(
              iconData: Icons.home,
              label: 'Duolingo',
            ),
            ItemTapBar(
              iconData: Icons.movie,
              label: 'Películas',
            ),
            ItemTapBar(
              iconData: Icons.play_arrow,
              label: 'Ahorcado',
            ),
            ItemTapBar(
              iconData: Icons.person,
              label: 'Perfil',
            ),
          ],
        ),
      ),
    );
  }
}
