import 'package:flutter/material.dart';
import 'committee_member_detail_screen.dart';

class AllCommitteeMembersScreen
    extends StatefulWidget {
  const AllCommitteeMembersScreen({super.key});

  @override
  State<AllCommitteeMembersScreen> createState() =>
      _AllCommitteeMembersScreenState();
}

class _AllCommitteeMembersScreenState
    extends State<AllCommitteeMembersScreen> {
  final TextEditingController _searchController =
      TextEditingController();

  final List<Map<String, String>> members = [
    {
      'name': 'Ali Raza',
      'phone': '+92 300 1112233',
      'position': 'President',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Usman Khan',
      'phone': '+92 301 2223344',
      'position': 'Vice President',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Ahmed Hassan',
      'phone': '+92 302 3334455',
      'position': 'General Secretary',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Bilal Ahmed',
      'phone': '+92 303 4445566',
      'position': 'Finance Secretary',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Hamza Malik',
      'phone': '+92 304 5556677',
      'position': 'Event Coordinator',
      'image': 'assets/images/society_wax_logo.jpg',
    },
  ];

  List<Map<String, String>> get filteredMembers {
    final query =
        _searchController.text.toLowerCase();

    if (query.isEmpty) {
      return members;
    }

    return members.where((member) {
      return member['name']!
              .toLowerCase()
              .contains(query) ||
          member['position']!
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
        title: const Text(
          'Committee Members',
        ),
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
                hintText:
                    'Search committee members',
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
                itemCount: filteredMembers.length,

                itemBuilder: (context, index) {
                  final member =
                      filteredMembers[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CommitteeMemberDetailScreen(
                            name: member['name']!,
                            phone: member['phone']!,
                            position:
                                member['position']!,
                            image: member['image']!,
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
                            member['image']!,
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
                                  member['name']!,
                                  style:
                                      const TextStyle(
                                    fontSize: 17,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),

                                const SizedBox(height: 5),

                                Text(
                                  member['position']!,
                                  style:
                                      const TextStyle(
                                    color:
                                        Colors.orange,
                                    fontWeight:
                                        FontWeight.w500,
                                  ),
                                ),

                                const SizedBox(height: 4),

                                Text(
                                  member['phone']!,
                                  style:
                                      const TextStyle(
                                    color: Colors.grey,
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