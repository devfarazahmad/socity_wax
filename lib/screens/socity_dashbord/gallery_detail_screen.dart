import 'package:flutter/material.dart';

class GalleryDetailScreen extends StatelessWidget {
  const GalleryDetailScreen({super.key});

  final List<String> images = const [
    'assets/images/society_wax_logo.jpg',
    'assets/images/society_wax_logo.jpg',
    'assets/images/society_wax_logo.jpg',
    'assets/images/society_wax_logo.jpg',
    'assets/images/society_wax_logo.jpg',
    'assets/images/society_wax_logo.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: images.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              images[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}