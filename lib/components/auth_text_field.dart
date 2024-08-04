import 'package:flutter/material.dart';

class TextInputComponent extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final focusNode;
  final TextInputAction? textInputAction;

  final void Function(String)? onSubmitted;
  TextInputComponent({
    super.key,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    required this.focusNode,
    required this.onSubmitted, required this.textInputAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        textInputAction: textInputAction,
        onSubmitted: onSubmitted,
        focusNode: focusNode,
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.tertiary)),
            focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: Theme.of(context).colorScheme.primary)),
            fillColor: Theme.of(context).colorScheme.secondary,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary)),
      ),
    );
  }
}
