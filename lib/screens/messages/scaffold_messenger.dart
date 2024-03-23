import 'package:flutter/material.dart';

snackbarMessage(String text, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(milliseconds: 1500),
    behavior: SnackBarBehavior.floating,
    backgroundColor:Colors.black,
    margin: const EdgeInsets.all(30),
    elevation: 5,
    content: Text(
      text,
      style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w200),
    ),
  ));
}
