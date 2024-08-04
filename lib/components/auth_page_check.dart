import 'package:flutter/material.dart';
import '/pages/auth/login.dart';
import '/pages/auth/register.dart';

class AuthPageCheck extends StatefulWidget {
  const AuthPageCheck({super.key});

  @override
  State<AuthPageCheck> createState() => _AuthPageCheckState();
}

class _AuthPageCheckState extends State<AuthPageCheck> {
  bool auth = true;
  void toggle() {
    setState(() {
      auth = !auth;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (auth) {
      return LoginPage(
        toggleregister: toggle,
      );
    } else {
      return RegisterPage(
        togglelogin: toggle,
      );
    }
  }
}
