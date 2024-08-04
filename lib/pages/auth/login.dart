import 'package:flutter/material.dart';
import '/auth/auth_service.dart';

import '../../components/auth_button.dart';
import '../../components/auth_text_field.dart';
import 'forget_password.dart';

class LoginPage extends StatelessWidget {
  //focus nodes
  final FocusNode _emailfocusnode = FocusNode();
  final FocusNode _pwfocusnode = FocusNode();
  //parent defined
  final void Function()? toggleregister;

  void onSubmitted(BuildContext context) {
    FocusScope.of(context).requestFocus(_pwfocusnode);
  }

  void firebaseLogin(BuildContext context) async {
    //get authservice
    final AuthService auth = AuthService();
    try {
      await auth.signInWithEmailandPassword(
          _emailController.text, _pwController.text);
    } catch (e) {
      _emailController.text = '';
      _pwController.text = '';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Invalid Credentials',
          ),
        ),
      );
    }
  }

  LoginPage({
    super.key,
    required this.toggleregister,
  });

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
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
                textInputAction: TextInputAction.next,
                onSubmitted: (p0) => onSubmitted(context),
                focusNode: _emailfocusnode,
                hintText: 'Email',
                obscureText: false,
                controller: _emailController,
              ),
              //Password Text Field
              SizedBox(
                height: 10,
              ),
              TextInputComponent(
                textInputAction: TextInputAction.done,
                onSubmitted: (p0) => firebaseLogin(context),
                focusNode: _pwfocusnode,
                hintText: 'Password',
                obscureText: true,
                controller: _pwController,
              ),

              //Login Buttom
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                child: MyButton(
                  onTap: () => firebaseLogin(context),
                  btnText: "Login Now",
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
                    'Not a member!',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: toggleregister,
                    child: Text(
                      ' Register now',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Forget Password!',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => ForgetPassword(),
                      ),
                    ),
                    child: Text(
                      ' Click Here',
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
