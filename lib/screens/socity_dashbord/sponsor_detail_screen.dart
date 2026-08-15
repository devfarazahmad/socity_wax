import 'package:flutter/material.dart';

class SponsorDetailScreen extends StatelessWidget {
  final String name;
  final String phone;
  final String company;
  final String image;

  const SponsorDetailScreen({
    super.key,
    required this.name,
    required this.phone,
    required this.company,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text('Sponsor Details'),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // ==================================================
            // COVER PHOTO
            // ==================================================

            Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 190,
                  child: Image.asset(
                    'assets/images/society_wax_logo.jpg',
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  bottom: -50,
                  left: 0,
                  right: 0,

                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),

                      child: ClipOval(
                        child: Image.asset(
                          image,
                          width: 95,
                          height: 95,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 65),

            // ==================================================
            // BASIC INFORMATION
            // ==================================================

            _whiteContainer(
              child: Column(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    company,
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    phone,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // ==================================================
            // PROFILE
            // ==================================================

            _whiteContainer(
              child: _section(
                title: 'Profile',
                children: [
                  const Text(
                    'A passionate community supporter who believes '
                    'in creating opportunities for people to connect, '
                    'learn and grow together.',
                    style: TextStyle(
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 15),

                  _infoRow(
                    'Date of Birth',
                    '15 March 1990',
                  ),

                  _infoRow(
                    'Interest',
                    'Technology, Business, Community Development',
                  ),
                ],
              ),
            ),

            // ==================================================
            // FAMILY LIFE
            // ==================================================

            _whiteContainer(
              child: _section(
                title: 'Family Life',
                children: const [
                  Text(
                    'Family plays an important role in life. '
                    'Enjoys spending quality time with family '
                    'and participating in community activities '
                    'together.',
                    style: TextStyle(
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            // ==================================================
            // SOCIAL LIFE
            // ==================================================

            _whiteContainer(
              child: _section(
                title: 'Social Life',
                children: const [
                  Text(
                    'Actively involved in community activities, '
                    'social events and initiatives that help '
                    'connect and support people.',
                    style: TextStyle(
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _section({
    required String title,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 15),

        ...children,
      ],
    );
  }

  Widget _infoRow(
    String title,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _whiteContainer({
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),

      child: child,
    );
  }
}