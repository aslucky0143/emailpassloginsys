import 'package:flutter/material.dart';
import '/auth/auth_check_state.dart';
import '/auth/auth_service.dart';

import '../../components/auth_button.dart';
import '../../components/auth_text_field.dart';

class RegisterPage extends StatelessWidget {
  //focus nodes
  final FocusNode _emailfocusnode = FocusNode();
  final FocusNode _pwfocusnode = FocusNode();
  final FocusNode _cfmpwfocusnode = FocusNode();
  //parent defined functions
  final void Function()? togglelogin;
  //child defined functions
  void onSubmitted(BuildContext context, FocusNode focusNode) {
    FocusScope.of(context).requestFocus(focusNode);
  }

  void firebaseRegister(BuildContext context) {
    //get auth
    final auth = AuthService();
    if (_pwController.text == _cfmpwController.text) {
      auth
          .signUpWithEmailandPassword(_emailController.text, _pwController.text)
          .whenComplete(
        () {
          _cfmpwController.text = '';
          _pwController.text = '';
          _emailController.text = '';
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Account Created',
              ),
            ),
          );
        },
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AuthStateCheck(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password Not Matched'),
        ),
      );
    }
  }

  RegisterPage({
    super.key,
    required this.togglelogin,
  });

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _cfmpwController = TextEditingController();
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
                "Let's create an account for you",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              //Email Text Field
              SizedBox(
                height: 25,
              ),
              TextInputComponent(
                textInputAction: TextInputAction.next,
                focusNode: _emailfocusnode,
                onSubmitted: (p0) => onSubmitted(context, _pwfocusnode),
                hintText: 'Email',
                obscureText: false,
                controller: _emailController,
              ),
              //Password Text Field
              SizedBox(
                height: 10,
              ),
              TextInputComponent(
                textInputAction: TextInputAction.next,
                hintText: 'Password',
                onSubmitted: (p0) => onSubmitted(context, _pwfocusnode),
                focusNode: _pwfocusnode,
                obscureText: true,
                controller: _pwController,
              ),
              SizedBox(
                height: 10,
              ),
              TextInputComponent(
                textInputAction: TextInputAction.done,
                onSubmitted: (p0) => firebaseRegister(context),
                focusNode: _cfmpwfocusnode,
                hintText: 'Confirm Password',
                obscureText: true,
                controller: _cfmpwController,
              ),

              //Login Buttom
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: MyButton(
                  btnText: "Register",
                  onTap: () => firebaseRegister(context),
                ),
              ),
              //Register Button
              SizedBox(
                height: 25,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already a member? ',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: togglelogin,
                    child: Text(
                      'Login now',
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
