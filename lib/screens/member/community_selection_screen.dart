import 'package:flutter/material.dart';

class CommunitySelectionScreen extends StatelessWidget {
  const CommunitySelectionScreen({super.key});

  final List<String> communities = const [
    'Hayatian Community',
    'Software Engineering Community',
    'Flutter Developers Community',
    'Technology Community',
    'Sports Community',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Selection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            const Text(
              'Select Community',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Choose the community you want to join.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: ListView.builder(
                itemCount: communities.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.orange,
                        child: Text(
                          '${index + 1}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        communities[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: const Icon(
                        Icons.arrow_forward_ios,
                        size: 18,
                        color: Colors.orange,
                      ),
                      onTap: () {
                        // Community selection functionality
                        // will be added later.
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}