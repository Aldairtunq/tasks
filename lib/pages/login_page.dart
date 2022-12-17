import 'dart:html';
import 'dart:ui';
import 'package:tasks/ui/widgets/button_normal_widget.dart';
import 'package:tasks/ui/widgets/general_widgets.dart';
import 'package:tasks/ui/widgets/textfield_Normal_widgets.dart';
import 'package:tasks/ui/widgets/textfield_password_widget.dart';

import 'package:flutter/material.dart';
import 'package:tasks/ui/widgets/general/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  divider30(),
                  svgPicture.asset(
                    'assets/images/login.svg',
                    height: 180.0,
                  ),
                  divider30(),
                  Text(
                    "iniciar sesion",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      color: kBrandPrimaryColor,
                    ),
                  ),
                  divider10(),
                  TextFliedNormalWidget(
                    hintText: "correo electronico",
                    icon: Icons.email,
                    controller: _emailController,
                  ),
                  divider20(),
                  divider6(),
                  TextFieldPasswordWidget(
                    controller: _passwordController,
                  ),
                  divider20(),
                  ButtonNormalWidget(onPressed: () {}),
                ],
              )),
        ));
  }
}
