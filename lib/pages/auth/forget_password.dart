import 'package:flutter/material.dart';
import '/components/auth_page_check.dart';
import '/components/auth_text_field.dart';

import '../../auth/auth_service.dart';
import '../../components/auth_button.dart';

class ForgetPassword extends StatelessWidget {
  //COntroller and focus Nodes
  final _emailController = TextEditingController();
  final _emailFocusNode = FocusNode();
  //Child user defined functions
  Future<dynamic>? getLink(BuildContext context) {
    final auth = AuthService();
    if (_emailController.text.isNotEmpty) {
      auth.sendPasswordResetLink(_emailController.text);
      const snackMsg = SnackBar(content: Text('Link Sent!!'));
      ScaffoldMessenger.of(context).showSnackBar(snackMsg);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => AuthPageCheck(),
      ));
    } else {
      const snackBar = SnackBar(
        content: Text('Oops! no mail id '),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    return null;
  }

  ForgetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Logo
              Icon(
                Icons.chat,
                color: Theme.of(context).colorScheme.primary,
                size: 100,
              ),

              //Sign In
              SizedBox(
                height: 25,
              ),
              Text(
                "Welcome Back!! You've been missed",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              //Email Text Field
              SizedBox(
                height: 25,
              ),
              TextInputComponent(
                textInputAction: TextInputAction.done,
                onSubmitted: (p0) => getLink(context),
                focusNode: _emailFocusNode,
                hintText: 'Email',
                obscureText: false,
                controller: _emailController,
              ),
              //Password Text Field
              SizedBox(
                height: 10,
              ),

              GestureDetector(
                child: MyButton(
                  onTap: () => getLink(context),
                  btnText: "Send Link",
                ),
              ),
              //Register Button
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Know password',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => AuthPageCheck(),
                    )),
                    child: Text(
                      ' Login now',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
