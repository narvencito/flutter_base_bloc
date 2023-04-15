// ignore_for_file: lines_longer_than_80_chars, inference_failure_on_function_invocation

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie/app/common/widgets/custom_painter.dart';
import 'package:movie/app/config/routes_app.dart';
import 'package:movie/app/modules/user/bloc/user_bloc.dart';
import 'package:movie/utils/constans.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  static Widget create(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (_) => UserBloc(),
      child: LoginPage(),
    );
  }

  final userNameController = TextEditingController();
  final userPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //appBar: AppBar(),
        resizeToAvoidBottomInset: false,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(constraints.maxWidth, constraints.maxHeight),
                    painter: CurvedPainterTopRigth(),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.07,
                    left: MediaQuery.of(context).size.width * 0.2,
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.2,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.77,
                      alignment: Alignment.topLeft,
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              height: 40,
                              margin: const EdgeInsets.all(5),
                              child: TextFormField(
                                controller: userNameController,
                                decoration: InputDecoration(
                                  label: const Text('User name'),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              margin: const EdgeInsets.all(5),
                              child: TextFormField(
                                controller: userPasswordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  label: const Text('Password'),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  suffixIcon: const Icon(Icons.remove_red_eye),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(top: 5, left: 7),
                                  child: const Text(
                                    'Forgot password',
                                    style: TextStyle(color: Colors.black38),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.43,
                    right: MediaQuery.of(context).size.width * 0.32,
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context, RoutesApp.home, (route) => false);
                        },
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.05,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.18,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  'OR',
                                  style: TextStyle(color: ConstantsApp.primaryColor, fontWeight: FontWeight.w700),
                                ),
                                const Text(
                                  'Login with social media',
                                  style: TextStyle(color: Colors.black38),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(FontAwesomeIcons.facebook, color: Colors.blue),
                                    Icon(FontAwesomeIcons.twitter, color: Colors.blue),
                                    Icon(FontAwesomeIcons.googlePlus, color: Colors.red),
                                    Icon(FontAwesomeIcons.linkedin, color: Colors.blue),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Already have an account?',
                                style: TextStyle(color: Colors.black38),
                              ),
                              Text(
                                ' Signup',
                                style: TextStyle(
                                  color: ConstantsApp.primaryColor,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // void openConfirmDialog(BuildContext context, String message, Function yesOnPressed, Function noOnPressed) {
  //   final confirmDialog = AppConfirmDialog(
  //     title: '¿Está seguro que desea cerrar sesión?',
  //     yesOnPressed: () {
  //       Navigator.pop(context);
  //     },
  //     noOnPressed: () {
  //       Navigator.pop(context);
  //     },
  //     yes: 'Aceptar',
  //     no: 'Cancelar',
  //   );
  //   showDialog(barrierColor: Colors.red, barrierDismissible: false, context: context, builder: (BuildContext context) => confirmDialog);
  // }
}
