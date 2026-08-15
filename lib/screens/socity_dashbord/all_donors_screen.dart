import 'package:flutter/material.dart';
import 'donor_detail_screen.dart';

class AllDonorsScreen extends StatefulWidget {
  const AllDonorsScreen({super.key});

  @override
  State<AllDonorsScreen> createState() =>
      _AllDonorsScreenState();
}

class _AllDonorsScreenState
    extends State<AllDonorsScreen> {
  final TextEditingController _searchController =
      TextEditingController();

  final List<Map<String, String>> donors = [
    {
      'name': 'Ali Raza',
      'phone': '+92 300 1112233',
      'club': 'Hayatian Social Club',
      'amount': 'PKR 50,000',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Usman Khan',
      'phone': '+92 301 2223344',
      'club': 'Community Welfare Club',
      'amount': 'PKR 30,000',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Ahmed Hassan',
      'phone': '+92 302 3334455',
      'club': 'Hayatian Youth Club',
      'amount': 'PKR 20,000',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Bilal Ahmed',
      'phone': '+92 303 4445566',
      'club': 'Sports & Social Club',
      'amount': 'PKR 75,000',
      'image': 'assets/images/society_wax_logo.jpg',
    },
  ];

  List<Map<String, String>> get filteredDonors {
    final query =
        _searchController.text.toLowerCase();

    if (query.isEmpty) {
      return donors;
    }

    return donors.where((donor) {
      return donor['name']!
              .toLowerCase()
              .contains(query) ||
          donor['club']!
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
        title: const Text('All Donors'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            TextField(
              controller: _searchController,
              onChanged: (_) {
                setState(() {});
              },

              decoration: InputDecoration(
                hintText: 'Search donors',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.orange,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: filteredDonors.length,

                itemBuilder: (context, index) {
                  final donor = filteredDonors[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DonorDetailScreen(
                            name: donor['name']!,
                            phone: donor['phone']!,
                            club: donor['club']!,
                            image: donor['image']!,
                          ),
                        ),
                      );
                    },

                    child: Container(
                      margin:
                          const EdgeInsets.only(
                        bottom: 12,
                      ),
                      padding:
                          const EdgeInsets.all(15),

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
                            donor['image']!,
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
                                  donor['name']!,
                                  style:
                                      const TextStyle(
                                    fontSize: 17,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                Text(
                                  donor['club']!,
                                  style:
                                      const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  donor['amount']!,
                                  style:
                                      const TextStyle(
                                    color:
                                        Colors.orange,
                                    fontWeight:
                                        FontWeight.w600,
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