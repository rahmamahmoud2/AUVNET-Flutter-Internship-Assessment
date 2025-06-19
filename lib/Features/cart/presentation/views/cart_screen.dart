import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8900FE),
        title: const Text('Cart'),
        centerTitle: true,
      ),
      body: Center(child: Text('Cart will be displayed here')),
    );
  }
}
