// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DuolingoPage extends StatelessWidget {
  const DuolingoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                iconsNum('assets/images/appBar/flag.png', 0, Colors.white),
                iconsNum('assets/images/appBar/crown_stroke.png', 1, Colors.yellow[700]!),
                iconsNum('assets/images/appBar/navbar_fire.png', 0, Colors.grey),
                iconsNum('assets/images/appBar/navbar_diamont.png', 57, Colors.red),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Card(
                    elevation: 7,
                    color: Colors.blue,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        'TRY PLUS',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                elementCircleAvatar(context, 'assets/images/lesson_egg.png', 'Basics 1', 1),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                elementCircleAvatar(context, 'assets/images/store_item_8.png', 'General', 0.7),
                elementCircleAvatar(context, 'assets/images/lesson_baby.png', 'Basics 2', 0.3),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                elementCircleAvatar(context, 'assets/images/lesson_airplane.png', 'Basics 2', 0.5),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                elementCircleAvatar(context, 'assets/images/lesson_dialog.png', 'Basics 2', 1),
                elementCircleAvatar(context, 'assets/images/lesson_divisor_castle.png', 'Basics 2', 0.25),
                elementCircleAvatar(context, 'assets/images/lesson_hamburger.png', 'Basics 2', 0.6),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget iconsNum(String icon, int num, Color color) {
    return Row(
      children: [
        Image.asset(icon),
        Padding(
          padding: const EdgeInsets.only(left: 7),
          child: Text(
            num.toString(),
            style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }

  Widget elementCircleAvatar(BuildContext context, String icon, String text, double value) {
    return SizedBox(
      height: 145,
      // width: 150,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: Transform.rotate(
                    angle: 90.5,
                    child: CircularProgressIndicator(
                      value: value,
                      strokeWidth: 7,
                      color: Colors.yellow[500],
                      backgroundColor: Colors.grey[200],
                    ),
                  ),
                ),
              ),
              Center(
                child: CircleAvatar(
                  minRadius: 40,
                  backgroundColor: const Color.fromARGB(255, 227, 146, 241),
                  child: Image.asset(
                    width: 60,
                    icon,
                    // scale: 1.5,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: value == 1
                    ? Stack(
                        children: [
                          Image.asset(
                            'assets/images/appBar/crown_stroke.png',
                            scale: 1.6,
                          ),
                          Positioned(
                            bottom: 7,
                            right: 17,
                            child: Text(
                              '1',
                              style: TextStyle(
                                color: Colors.yellow[900],
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )
                        ],
                      )
                    : Icon(
                        FontAwesomeIcons.crown,
                        size: 35,
                        color: Colors.grey[300],
                      ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(text),
          )
        ],
      ),
    );
  }
}
