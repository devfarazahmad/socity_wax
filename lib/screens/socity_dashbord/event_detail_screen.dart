import 'package:flutter/material.dart';

class EventDetailScreen extends StatelessWidget {
  final String eventName;
  final String date;
  final String location;

  const EventDetailScreen({
    super.key,
    this.eventName = 'Annual Community Gathering',
    this.date = '20 August 2026',
    this.location = 'Hayatian Campus',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text('Event Details'),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ==================================================
            // COVER PHOTO
            // ==================================================

            Stack(
              children: [
                Image.asset(
                  'assets/images/society_wax_logo.jpg',
                  width: double.infinity,
                  height: 230,
                  fit: BoxFit.cover,
                ),

                Positioned(
                  right: 15,
                  bottom: 15,

                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius:
                          BorderRadius.circular(20),
                    ),

                    child: const Text(
                      'PKR 1,500',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            // ==================================================
            // EVENT BASIC DETAILS
            // ==================================================

            _whiteContainer(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    eventName,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  _detailRow(
                    Icons.calendar_month,
                    date,
                  ),

                  const SizedBox(height: 10),

                  _detailRow(
                    Icons.location_on,
                    location,
                  ),
                ],
              ),
            ),

            // ==================================================
            // BUTTONS
            // ==================================================

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                              content: Text(
                                'You are now a participant',
                              ),
                            ),
                          );
                        },

                        style:
                            ElevatedButton.styleFrom(
                          backgroundColor:
                              Colors.orange,
                          foregroundColor:
                              Colors.white,
                          elevation: 5,
                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(
                              10,
                            ),
                          ),
                        ),

                        child: const Text(
                          'Participant',
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: OutlinedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Invite Friend selected',
                              ),
                            ),
                          );
                        },

                        style:
                            OutlinedButton.styleFrom(
                          foregroundColor:
                              Colors.orange,
                          side: const BorderSide(
                            color: Colors.orange,
                          ),
                          shape:
                              RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(
                              10,
                            ),
                          ),
                        ),

                        child: const Text(
                          'Invite Friend',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ==================================================
            // INFORMATION
            // ==================================================

            _whiteContainer(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Information',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 12),

                  Text(
                    'This event brings community members together '
                    'to enjoy an engaging day filled with activities, '
                    'social interaction and meaningful discussions. '
                    'All community members are welcome to participate.',
                    style: TextStyle(
                      color: Colors.grey,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),

            // ==================================================
            // GALLERY
            // ==================================================

            _whiteContainer(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Gallery',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 15),

                  GridView.builder(
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(),

                    itemCount: 6,

                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                    ),

                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius:
                            BorderRadius.circular(10),

                        child: Image.asset(
                          'assets/images/society_wax_logo.jpg',
                          fit: BoxFit.cover,
                        ),
                      );
                    },
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

  Widget _detailRow(
    IconData icon,
    String text,
  ) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.orange,
          size: 20,
        ),

        const SizedBox(width: 10),

        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }

  Widget _whiteContainer({
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
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