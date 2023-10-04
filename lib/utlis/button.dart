import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String lable;
  VoidCallback onPressed;

  CustomButton({required this.lable, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(
        lable,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
