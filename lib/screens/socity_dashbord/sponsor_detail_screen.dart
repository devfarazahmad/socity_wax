import 'package:flutter/material.dart';

class SponsorDetailScreen extends StatelessWidget {
  const SponsorDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sponsor Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 30),

            // Sponsor Image
            Image.asset(
              'assets/images/society_wax_logo.jpg',
              width: 120,
              height: 120,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 20),

            const Text(
              'Tech Solutions',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Community Sponsor',
              style: TextStyle(
                color: Colors.orange,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'This sponsor supports community activities, '
              'events and social initiatives.',
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