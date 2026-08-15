import 'package:flutter/material.dart';

class EventDetailScreen extends StatelessWidget {
  const EventDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              'assets/images/society_wax_logo.jpg',
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Annual Community Event',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  _info(
                    Icons.calendar_month,
                    '20 August 2026',
                  ),

                  _info(
                    Icons.access_time,
                    '10:00 AM',
                  ),

                  _info(
                    Icons.location_on_outlined,
                    'Hayatian Campus',
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'About Event',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    'Join us for our annual community event '
                    'where members, families and friends come '
                    'together to celebrate and share memories.',
                    style: TextStyle(
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 30),

                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Join Event',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _info(
    IconData icon,
    String text,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.orange,
          ),
          const SizedBox(width: 12),
          Text(text),
        ],
      ),
    );
  }
}