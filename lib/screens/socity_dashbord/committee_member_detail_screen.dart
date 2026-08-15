import 'package:flutter/material.dart';

class CommitteeMemberDetailScreen
    extends StatelessWidget {
  final String name;
  final String phone;
  final String position;
  final String image;

  const CommitteeMemberDetailScreen({
    super.key,
    required this.name,
    required this.phone,
    required this.position,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text(
          'Committee Member',
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // ==================================================
            // COVER PHOTO + PROFILE
            // ==================================================

            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  'assets/images/society_wax_logo.jpg',
                  width: double.infinity,
                  height: 190,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  bottom: -50,
                  left: 0,
                  right: 0,

                  child: Center(
                    child: Container(
                      padding:
                          const EdgeInsets.all(4),

                      decoration:
                          const BoxDecoration(
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
            // BASIC DETAILS
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
                    position,
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
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 15),

                  Text(
                    'An active community leader dedicated to '
                    'serving members, organizing activities and '
                    'building a stronger community.',
                    style: TextStyle(
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),

                  SizedBox(height: 15),

                  Text(
                    'Date of Birth',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(
                    '10 January 1987',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(height: 12),

                  Text(
                    'Interests',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(
                    'Leadership, Sports, Social Activities',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // ==================================================
            // FAMILY LIFE
            // ==================================================

            _whiteContainer(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Family Life',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 15),

                  Text(
                    'Values family relationships and enjoys '
                    'spending time with family members. '
                    'Family participation in community events '
                    'is also encouraged.',
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
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Social Life',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 15),

                  Text(
                    'Regularly participates in community '
                    'meetings, social gatherings, sports '
                    'activities and welfare initiatives.',
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
        borderRadius:
            BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),

      child: child,
    );
  }
}