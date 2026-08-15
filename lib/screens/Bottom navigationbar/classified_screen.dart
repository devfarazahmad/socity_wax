import 'package:flutter/material.dart';

class ClassifiedScreen extends StatelessWidget {
  const ClassifiedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classified'),
      ),
      body: const Center(
        child: Text(
          'Classified Screen',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}