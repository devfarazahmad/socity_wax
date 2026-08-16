import 'package:flutter/material.dart';
import 'gallery_image_viewer_screen.dart';

class GalleryDetailScreen extends StatelessWidget {
  const GalleryDetailScreen({super.key});

  static const List<Map<String, String>> galleryImages = [
    {
      'image': 'assets/images/society_wax_logo.jpg',
      'title': 'Annual Dinner',
      'description': 'Community members enjoying the annual dinner.',
    },
    {
      'image': 'assets/images/society_wax_logo.jpg',
      'title': 'Sports Gala',
      'description': 'A memorable day full of sports and activities.',
    },
    {
      'image': 'assets/images/society_wax_logo.jpg',
      'title': 'Community Gathering',
      'description': 'Community members gathered together.',
    },
    {
      'image': 'assets/images/society_wax_logo.jpg',
      'title': 'Cultural Night',
      'description': 'A beautiful evening celebrating our culture.',
    },
    {
      'image': 'assets/images/society_wax_logo.jpg',
      'title': 'Family Gathering',
      'description': 'Families coming together for a special occasion.',
    },
    {
      'image': 'assets/images/society_wax_logo.jpg',
      'title': 'Award Ceremony',
      'description': 'Recognizing outstanding community members.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'Gallery',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            const Text(
              'Community Gallery',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Explore memories and special moments from our community.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 20),

            // ==================================================
            // DIFFERENT SIZE IMAGE LAYOUT
            // ==================================================

            GridView.builder(
              shrinkWrap: true,

              physics:
                  const NeverScrollableScrollPhysics(),

              itemCount: galleryImages.length,

              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.82,
              ),

              itemBuilder: (context, index) {
                return _buildGalleryCard(
                  context,
                  index,
                  galleryImages[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // GALLERY CARD
  // ==========================================================

  Widget _buildGalleryCard(
    BuildContext context,
    int index,
    Map<String, String> gallery,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                GalleryImageViewerScreen(
              images: galleryImages,
              initialIndex: index,
            ),
          ),
        );
      },

      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),

          border: Border.all(
            color: Colors.grey.shade200,
          ),

          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            // ==================================================
            // IMAGE
            // ==================================================

            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),

                child: Image.asset(
                  gallery['image']!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // ==================================================
            // TEXT
            // ==================================================

            Padding(
              padding: const EdgeInsets.all(10),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,

                children: [
                  Text(
                    gallery['title']!,

                    maxLines: 1,

                    overflow:
                        TextOverflow.ellipsis,

                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    gallery['description']!,

                    maxLines: 2,

                    overflow:
                        TextOverflow.ellipsis,

                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                      height: 1.3,
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
}