import 'package:flutter/material.dart';

class CommitteeMemberDetailScreen
    extends StatelessWidget {
  const CommitteeMemberDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Committee Member'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 30),

            const CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                'assets/images/society_wax_logo.jpg',
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Ali Raza',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Committee President',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              'Responsible for managing community activities '
              'and coordinating committee members.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}