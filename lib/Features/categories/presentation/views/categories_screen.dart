import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF8900FE),
        title: const Text('Categories'),
        centerTitle: true,
      ),
      body: Center(child: Text('Categories will be displayed here')),
    );
  }
}
