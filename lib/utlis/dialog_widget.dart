import 'package:flutter/material.dart';
import 'button.dart';

class DialogWidget extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancelled;

  DialogWidget({
    required this.controller,
    required this.onSave,
    required this.onCancelled,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow.shade200,
      title: const Text("Add Task"),
      content: SizedBox(
        height: 70,
        child: TextField(
          controller: controller,
          cursorColor: Colors.black54,
          decoration: InputDecoration(
            hintText: "Add a new task",
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
      ),
      actions: [
        CustomButton(
          lable: "Add",
          onPressed: onSave,
        ),
        CustomButton(
          lable: "Cancel",
          onPressed: onCancelled,
        ),
      ],
    );
  }
}
