import 'package:flutter/material.dart';

class DonorDetailScreen extends StatelessWidget {
  final String name;
  final String phone;
  final String club;
  final String image;

  const DonorDetailScreen({
    super.key,
    required this.name,
    required this.phone,
    required this.club,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text('Donor Details'),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // ==================================================
            // COVER + PROFILE IMAGE
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
                      padding: const EdgeInsets.all(4),

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
            // DONOR INFORMATION
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
                    phone,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 8),

                  Text(
                    club,
                    style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

            // ==================================================
            // DONATION HISTORY
            // ==================================================

            _whiteContainer(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Donation History',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 20),

                  _donationItem(
                    'Hayatian Community',
                    '20 August 2026',
                    'PKR 50,000',
                    false,
                  ),

                  _donationItem(
                    'Sports Community',
                    '15 June 2026',
                    'PKR 30,000',
                    false,
                  ),

                  _donationItem(
                    'Social Welfare Society',
                    '10 March 2026',
                    'PKR 20,000',
                    true,
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
                    'A dedicated community supporter who enjoys '
                    'helping people and contributing to social '
                    'development initiatives.',
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
                    '12 February 1988',
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
                    'Community Service, Sports, Education',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // ==================================================
            // ACHIEVEMENTS & AWARDS
            // ==================================================

            _whiteContainer(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Achievements & Awards',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  SizedBox(
                    height: 140,

                    child: ListView(
                      scrollDirection:
                          Axis.horizontal,

                      children: [
                        _awardCard(
                          'Community Service Award',
                        ),

                        _awardCard(
                          'Best Donor Award',
                        ),

                        _awardCard(
                          'Social Impact Award',
                        ),
                      ],
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

  Widget _donationItem(
    String society,
    String date,
    String amount,
    bool isLast,
  ) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 25,

            child: Column(
              children: [
                Container(
                  width: 13,
                  height: 13,

                  decoration:
                      const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                ),

                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: Colors.orange,
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(
                bottom: 25,
              ),

              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    society,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    date,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    amount,
                    style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _awardCard(String title) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 12),

      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius:
            BorderRadius.circular(12),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),

      child: Column(
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(
                top: Radius.circular(12),
              ),

              child: Image.asset(
                'assets/images/society_wax_logo.jpg',
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8),

            child: Text(
              title,
              maxLines: 2,
              textAlign: TextAlign.center,

              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
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