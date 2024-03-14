import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'WishList',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.blue,
            fontStyle: FontStyle.italic
          ),
        ),
        backgroundColor: Colors.yellow,
      ),
    );
  }
}