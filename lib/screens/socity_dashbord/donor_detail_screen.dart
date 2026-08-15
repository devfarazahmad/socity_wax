import 'package:flutter/material.dart';

class DonorDetailScreen extends StatelessWidget {
  const DonorDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Donor Details'),
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

            const SizedBox(height: 10),

            const Text(
              'Total Donation',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'PKR 50,000',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}