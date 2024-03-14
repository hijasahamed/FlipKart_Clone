import 'package:flutter/material.dart';
import 'package:flutter_bloc_tutorial_app/screens/home/ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
       title: 'Bloc Tutorial',
       debugShowCheckedModeBanner: false,
       theme: ThemeData.light(),
       home: const HomeScreen(),
    );
  }
}

