import 'package:flutter/material.dart';

class SurveyScreen extends StatelessWidget {
  const SurveyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Survey'),
      ),
      body: const Center(
        child: Text(
          'Survey Screen',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}