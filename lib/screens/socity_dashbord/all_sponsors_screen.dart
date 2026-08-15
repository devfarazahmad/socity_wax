import 'package:flutter/material.dart';
import 'sponsor_detail_screen.dart';

class AllSponsorsScreen extends StatefulWidget {
  const AllSponsorsScreen({super.key});

  @override
  State<AllSponsorsScreen> createState() =>
      _AllSponsorsScreenState();
}

class _AllSponsorsScreenState extends State<AllSponsorsScreen> {
  final TextEditingController _searchController =
      TextEditingController();

  final List<Map<String, String>> sponsors = [
    {
      'name': 'Tech Solutions',
      'phone': '+92 300 1234567',
      'company': 'Tech Solutions Pvt Ltd',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Hayatian Foods',
      'phone': '+92 301 7654321',
      'company': 'Hayatian Foods',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Digital World',
      'phone': '+92 302 9876543',
      'company': 'Digital World',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Future Developers',
      'phone': '+92 303 4567890',
      'company': 'Future Developers',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Campus Mart',
      'phone': '+92 304 1112233',
      'company': 'Campus Mart',
      'image': 'assets/images/society_wax_logo.jpg',
    },
  ];

  List<Map<String, String>> get filteredSponsors {
    final query = _searchController.text.toLowerCase();

    if (query.isEmpty) {
      return sponsors;
    }

    return sponsors.where((sponsor) {
      return sponsor['name']!
              .toLowerCase()
              .contains(query) ||
          sponsor['company']!
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
        title: const Text('All Sponsors'),
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
                hintText: 'Search sponsors',
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
                itemCount: filteredSponsors.length,
                itemBuilder: (context, index) {
                  final sponsor = filteredSponsors[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              SponsorDetailScreen(
                            name: sponsor['name']!,
                            phone: sponsor['phone']!,
                            company: sponsor['company']!,
                            image: sponsor['image']!,
                          ),
                        ),
                      );
                    },

                    child: Container(
                      margin: const EdgeInsets.only(bottom: 12),
                      padding: const EdgeInsets.all(15),

                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(15),
                        border: Border.all(
                          color: Colors.grey.shade200,
                        ),
                      ),

                      child: Row(
                        children: [
                          Image.asset(
                            sponsor['image']!,
                            width: 65,
                            height: 65,
                            fit: BoxFit.cover,
                          ),

                          const SizedBox(width: 15),

                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  sponsor['name']!,
                                  style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                Text(
                                  sponsor['company']!,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  sponsor['phone']!,
                                  style: const TextStyle(
                                    color: Colors.orange,
                                  ),
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