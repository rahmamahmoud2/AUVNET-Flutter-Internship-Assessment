import 'package:flutter/material.dart';

class DeliverScreen extends StatelessWidget {
  const DeliverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8900FE),
        title: const Text('Deliver'),
        centerTitle: true,
      ),
      body: Center(child: Text('Deliver will be displayed here')),
    );
  }
}
