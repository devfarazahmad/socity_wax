import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage(
                'assets/images/society_wax_logo.jpg',
              ),
            ),

            const SizedBox(height: 15),

            const Text(
              'Faraz Ahmad',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            const Text(
              'Senior Community Member',
              style: TextStyle(
                color: Colors.orange,
                fontSize: 15,
              ),
            ),

            const SizedBox(height: 30),

            _profileItem(
              Icons.person_outline,
              'Name',
              'Faraz Ahmad',
            ),

            _profileItem(
              Icons.email_outlined,
              'Email',
              'faraz@example.com',
            ),

            _profileItem(
              Icons.phone_outlined,
              'Phone',
              '+92 300 1234567',
            ),

            _profileItem(
              Icons.location_on_outlined,
              'Location',
              'Punjab, Pakistan',
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileItem(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.orange,
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}