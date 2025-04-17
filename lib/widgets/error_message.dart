import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(
        Icons.error,
        size: 40,
      ),
      iconColor: Colors.red,
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil("home", (route)=>false) ,
          child: const Text(
            'Close',
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
