// ignore_for_file: avoid_dynamic_calls, directives_ordering

import 'package:flutter/material.dart';
import 'package:emerson/app/utils/constans.dart';

// ignore: must_be_immutable
class AppConfirmDialog extends StatelessWidget {
  AppConfirmDialog({
    super.key,
    required this.title,
    //String content,
    required this.yesOnPressed,
    required this.noOnPressed,
    this.yes = 'Yes',
    this.no = 'No',
  });
  final Color _color = Colors.white;
  String title;
  //String _content;
  String yes;
  String no;
  Function yesOnPressed;
  Function noOnPressed;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(fontSize: 15),
      ),
      //content: new Text(this._content),
      backgroundColor: _color,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      actions: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.3,
                  padding: const EdgeInsets.all(5),
                  //decoration: Constants().boxDecorationApp,
                  child: Text(
                    no,
                    style: const TextStyle(
                      color: ConstantsApp.textColorPrimary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // textColor: Colors.white,
                onPressed: () {
                  noOnPressed();
                },
              ),
              TextButton(
                child: Container(
                  height: 30,
                  width: MediaQuery.of(context).size.width * 0.3,
                  padding: const EdgeInsets.all(5),
                  // decoration: Constants().boxDecorationApp,
                  child: Text(
                    yes,
                    style: const TextStyle(
                      color: ConstantsApp.textColorSecondary,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // textColor: Colors.white,
                onPressed: () {
                  yesOnPressed();
                },
              ),
            ],
          ),
        )
      ],
    );
  }
}
