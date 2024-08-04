import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/components/auth_page_check.dart';

import '../pages/home/home_page.dart';

class AuthStateCheck extends StatelessWidget {
  const AuthStateCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return AuthPageCheck();
          }
        },
      ),
    );
  }
}
