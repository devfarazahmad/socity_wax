import 'package:flutter/material.dart';
import 'event_detail_screen.dart';

class AllEventsScreen extends StatefulWidget {
  const AllEventsScreen({super.key});

  @override
  State<AllEventsScreen> createState() =>
      _AllEventsScreenState();
}

class _AllEventsScreenState
    extends State<AllEventsScreen> {
  final TextEditingController _searchController =
      TextEditingController();

  final List<Map<String, String>> events = [
    {
      'name': 'Annual Community Gathering',
      'date': '20 August 2026',
      'location': 'Hayatian Campus',
    },
    {
      'name': 'Annual Sports Gala',
      'date': '25 August 2026',
      'location': 'University Ground',
    },
    {
      'name': 'Community Dinner',
      'date': '30 August 2026',
      'location': 'Community Hall',
    },
    {
      'name': 'Cultural Night',
      'date': '05 September 2026',
      'location': 'Main Auditorium',
    },
    {
      'name': 'Community Award Ceremony',
      'date': '12 September 2026',
      'location': 'Hayatian Campus',
    },
  ];

  List<Map<String, String>> get filteredEvents {
    final query = _searchController.text.toLowerCase();

    if (query.isEmpty) {
      return events;
    }

    return events.where((event) {
      return event['name']!
              .toLowerCase()
              .contains(query) ||
          event['location']!
              .toLowerCase()
              .contains(query);
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text('All Events'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            // Search
            TextField(
              controller: _searchController,
              onChanged: (_) {
                setState(() {});
              },

              decoration: InputDecoration(
                hintText: 'Search events',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.orange,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: filteredEvents.length,

                itemBuilder: (context, index) {
                  final event = filteredEvents[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              EventDetailScreen(
                            eventName: event['name']!,
                            date: event['date']!,
                            location: event['location']!,
                          ),
                        ),
                      );
                    },

                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 15,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade200,
                        ),
                      ),

                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.vertical(
                              top: Radius.circular(15),
                            ),

                            child: Image.asset(
                              'assets/images/society_wax_logo.jpg',
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),

                          Padding(
                            padding:
                                const EdgeInsets.all(15),

                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        event['name']!,
                                        style:
                                            const TextStyle(
                                          fontSize: 17,
                                          fontWeight:
                                              FontWeight.bold,
                                        ),
                                      ),

                                      const SizedBox(height: 7),

                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.calendar_month,
                                            size: 16,
                                            color:
                                                Colors.orange,
                                          ),

                                          const SizedBox(width: 5),

                                          Text(
                                            event['date']!,
                                            style:
                                                const TextStyle(
                                              color:
                                                  Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),

                                      const SizedBox(height: 5),

                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            size: 16,
                                            color:
                                                Colors.orange,
                                          ),

                                          const SizedBox(width: 5),

                                          Expanded(
                                            child: Text(
                                              event['location']!,
                                              style:
                                                  const TextStyle(
                                                color:
                                                    Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                                const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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