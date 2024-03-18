import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'My Cart',
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
