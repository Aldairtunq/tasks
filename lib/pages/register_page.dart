import 'package:flutter/material.dart';
import 'package:tasks/ui/widgets/general/colors.dart';
import 'dart:html';
import 'dart:ui';
import 'package:tasks/pages/register_page.dart';
import 'package:tasks/ui/widgets/button_custom_widget.dart';
import 'package:tasks/ui/widgets/button_normal_widget.dart';
import 'package:tasks/ui/widgets/general_widgets.dart';
import 'package:tasks/ui/widgets/textfield_Normal_widgets.dart';
import 'package:tasks/ui/widgets/textfield_password_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            divider30(),
            svgPicture.asset(
              'assets/images/register.svg',
              height: 180.0,
            ),
            divider30(),
            Text(
              "Registrate",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
                color: kBrandPrimaryColor,
              ),
            ),
            divider20(),
            TextFliedNormalWidget(
              hintText: "Nombre Completo",
              icon: Icons.email,
              controller: _emailController,
            ),
            divider10(),
            divider6(),
            TextFliedNormalWidget(
              hintText: "correo electronico",
              icon: Icons.email,
              controller: _emailController,
            ),
            divider10(),
            divider6(),
            TextFieldPasswordWidget(
              controller: _passwordController,
            ),
            divider20(),
            ButtonCustomWidget(
              text: "Registrate Ahora ",
              icon: "check",
              color: kBrandPrimaryColor,
            ),
          ],
        ),
      )),
    );
  }
}
