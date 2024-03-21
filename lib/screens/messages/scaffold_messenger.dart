import 'package:flutter/material.dart';

snackbarMessage(String text, context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    duration: const Duration(milliseconds: 1500 ),
    behavior: SnackBarBehavior.floating,
    backgroundColor: const Color.fromARGB(255, 46, 46, 46),
    margin: const EdgeInsets.all(30),
    clipBehavior: Clip.hardEdge,
    content: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
          color: Color.fromARGB(255, 255, 255, 255),
          fontWeight: FontWeight.w200),
    ),
  ));
}