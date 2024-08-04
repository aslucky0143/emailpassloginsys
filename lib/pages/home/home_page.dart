import 'package:flutter/material.dart';
import '/auth/auth_service.dart';

class HomePage extends StatelessWidget {
  void signOut() {
    // Get auth service
    final auth = AuthService();
    auth.signOut();
  }

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: signOut,
          child: Text(
            'Sign Out',
          ),
        ),
      ),
    );
  }
}
// aslucky0143@gmail.com
// Pravivalli@143
