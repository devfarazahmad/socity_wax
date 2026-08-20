import 'package:flutter/material.dart';
import 'package:socity_wax/screens/socity_dashbord/profile_screen.dart';

class ClassifiedScreen extends StatefulWidget {
  const ClassifiedScreen({super.key});

  @override
  State<ClassifiedScreen> createState() =>
      _ClassifiedScreenState();
}

class _ClassifiedScreenState
    extends State<ClassifiedScreen> {
  final TextEditingController _searchController =
      TextEditingController();

  String searchText = '';

  // ==========================================================
  // CATEGORIES
  // ==========================================================

  final List<Map<String, String>> categories = [
    {
      'title': 'Vehicle',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'title': 'Job',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'title': 'Home',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'title': 'Household',
      'image': 'assets/images/society_wax_logo.jpg',
    },
  ];

  // ==========================================================
  // TODAY OFFERS
  // ==========================================================

  final List<Map<String, dynamic>> todayOffers = [
    {
      'title': 'Toyota Corolla 2021',
      'description':
          'Excellent condition Toyota Corolla with clean interior and low mileage.',
      'price': 'PKR 4,850,000',
      'location': 'Gujranwala',
      'image': 'assets/images/society_wax_logo.jpg',
      'favorite': false,
    },
    {
      'title': 'Honda Civic 2020',
      'description':
          'Well maintained Honda Civic available for sale. One owner vehicle.',
      'price': 'PKR 5,200,000',
      'location': 'Lahore',
      'image': 'assets/images/society_wax_logo.jpg',
      'favorite': false,
    },
    {
      'title': 'Suzuki Alto 2022',
      'description':
          'Neat and clean Suzuki Alto with excellent fuel average.',
      'price': 'PKR 2,850,000',
      'location': 'Islamabad',
      'image': 'assets/images/society_wax_logo.jpg',
      'favorite': false,
    },
  ];

  // ==========================================================
  // WHAT'S NEW
  // ==========================================================

  final List<Map<String, dynamic>> whatsNew = [
    {
      'title': 'Flutter Developer Required',
      'description':
          'A software company is looking for an experienced Flutter developer.',
      'price': 'Salary: PKR 100K - 150K',
      'location': 'Remote / Lahore',
      'image': 'assets/images/society_wax_logo.jpg',
      'favorite': false,
    },
    {
      'title': 'Software Engineer Job',
      'description':
          'Full-time software engineer position available for a growing company.',
      'price': 'Salary: PKR 120K - 180K',
      'location': 'Islamabad',
      'image': 'assets/images/society_wax_logo.jpg',
      'favorite': false,
    },
    {
      'title': 'Marketing Executive',
      'description':
          'Marketing executive required for a well-established organization.',
      'price': 'Salary: PKR 70K - 100K',
      'location': 'Lahore',
      'image': 'assets/images/society_wax_logo.jpg',
      'favorite': false,
    },
  ];

  // ==========================================================
  // DISPOSE
  // ==========================================================

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // ==========================================================
  // PROFILE
  // ==========================================================

  void _openProfile() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      ),
    );
  }

  // ==========================================================
  // SEARCH
  // ==========================================================

  void _searchItems(String value) {
    setState(() {
      searchText = value;
    });
  }

  // ==========================================================
  // SHARE
  // ==========================================================

  void _shareItem(String title) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Share "$title"',
        ),
      ),
    );
  }

  // ==========================================================
  // CATEGORY CLICK
  // ==========================================================

  void _categorySelected(String category) {
    _searchController.text = category;

    setState(() {
      searchText = category;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '$category category selected',
        ),
      ),
    );
  }

  // ==========================================================
  // FILTER TODAY OFFERS
  // ==========================================================

  List<Map<String, dynamic>> get filteredTodayOffers {
    if (searchText.trim().isEmpty) {
      return todayOffers;
    }

    final search =
        searchText.toLowerCase().trim();

    return todayOffers.where((item) {
      return item['title']
              .toString()
              .toLowerCase()
              .contains(search) ||
          item['description']
              .toString()
              .toLowerCase()
              .contains(search) ||
          item['location']
              .toString()
              .toLowerCase()
              .contains(search);
    }).toList();
  }

  // ==========================================================
  // FILTER WHAT'S NEW
  // ==========================================================

  List<Map<String, dynamic>> get filteredWhatsNew {
    if (searchText.trim().isEmpty) {
      return whatsNew;
    }

    final search =
        searchText.toLowerCase().trim();

    return whatsNew.where((item) {
      return item['title']
              .toString()
              .toLowerCase()
              .contains(search) ||
          item['description']
              .toString()
              .toLowerCase()
              .contains(search) ||
          item['location']
              .toString()
              .toLowerCase()
              .contains(search);
    }).toList();
  }

  // ==========================================================
  // BUILD
  // ==========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      // ======================================================
      // APP BAR
      // ======================================================

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,

        title: const Text(
          'Classified',
          style: TextStyle(
            color: Colors.black,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          // Search icon
          IconButton(
            onPressed: () {
              FocusScope.of(context).requestFocus(
                FocusNode(),
              );

              _searchController.selection =
                  TextSelection.fromPosition(
                TextPosition(
                  offset:
                      _searchController.text.length,
                ),
              );
            },
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),

          const SizedBox(width: 5),

          // Profile
          GestureDetector(
            onTap: _openProfile,
            child: const Padding(
              padding: EdgeInsets.only(right: 15),
              child: CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  'assets/images/society_wax_logo.jpg',
                ),
              ),
            ),
          ),
        ],
      ),

      // ======================================================
      // BODY
      // ======================================================

      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          top: 16,
          bottom: 30,
        ),

        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [
            // ==================================================
            // LOCATION
            // ==================================================

            Padding(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              child: Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,

                    decoration: BoxDecoration(
                      color: Colors.orange
                          .withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      Icons.location_on,
                      color: Colors.orange,
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Current Location',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),

                        SizedBox(height: 3),

                        Text(
                          'Gujranwala, Punjab',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ==================================================
            // FAVOURITE LOCATION
            // ==================================================

            Padding(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.all(15),

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(12),
                  border: Border.all(
                    color:
                        Colors.grey.shade200,
                  ),
                ),

                child: Row(
                  children: [
                    const Icon(
                      Icons.favorite_border,
                      color: Colors.orange,
                    ),

                    const SizedBox(width: 10),

                    const Expanded(
                      child: Text(
                        'Choose your favourite location '
                        'and save it for future.',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ),

                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Location saved',
                            ),
                          ),
                        );
                      },

                      child: const Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.orange,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),

            // ==================================================
            // SEARCH BAR
            // ==================================================

            Padding(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              child: TextField(
                controller: _searchController,
                onChanged: _searchItems,

                decoration: InputDecoration(
                  hintText:
                      'Search, vehicle, job, Home, household',

                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),

                  suffixIcon:
                      _searchController.text.isNotEmpty
                          ? IconButton(
                              onPressed: () {
                                _searchController
                                    .clear();

                                setState(() {
                                  searchText = '';
                                });
                              },
                              icon: const Icon(
                                Icons.clear,
                              ),
                            )
                          : null,

                  filled: true,
                  fillColor: Colors.white,

                  contentPadding:
                      const EdgeInsets.symmetric(
                    vertical: 15,
                  ),

                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),

                  focusedBorder:
                      OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(12),
                    borderSide:
                        const BorderSide(
                      color: Colors.orange,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ==================================================
            // CATEGORIES
            // ==================================================

            Padding(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              child: const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 125,

              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 16,
                ),

                scrollDirection:
                    Axis.horizontal,

                itemCount:
                    categories.length,

                itemBuilder:
                    (context, index) {
                  return _buildCategoryCard(
                    categories[index],
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            // ==================================================
            // TODAY OFFER
            // ==================================================

            _buildSectionHeader(
              'Today Offer',
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 320,

              child: filteredTodayOffers.isEmpty
                  ? const Center(
                      child: Text(
                        'No vehicle found',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),

                      scrollDirection:
                          Axis.horizontal,

                      itemCount:
                          filteredTodayOffers
                              .length,

                      itemBuilder:
                          (context, index) {
                        return _buildClassifiedCard(
                          filteredTodayOffers[
                              index],
                          isVehicle: true,
                        );
                      },
                    ),
            ),

            const SizedBox(height: 25),

            // ==================================================
            // WHAT'S NEW
            // ==================================================

            _buildSectionHeader(
              "What's New",
            ),

            const SizedBox(height: 12),

            SizedBox(
              height: 320,

              child: filteredWhatsNew.isEmpty
                  ? const Center(
                      child: Text(
                        'No jobs found',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 16,
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),

                      scrollDirection:
                          Axis.horizontal,

                      itemCount:
                          filteredWhatsNew
                              .length,

                      itemBuilder:
                          (context, index) {
                        return _buildClassifiedCard(
                          filteredWhatsNew[
                              index],
                          isVehicle: false,
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // CATEGORY CARD
  // ==========================================================

  Widget _buildCategoryCard(
    Map<String, String> category,
  ) {
    return GestureDetector(
      onTap: () {
        _categorySelected(
          category['title']!,
        );
      },

      child: Container(
        width: 105,
        margin:
            const EdgeInsets.only(right: 12),

        padding:
            const EdgeInsets.all(8),

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius:
              BorderRadius.circular(12),

          border: Border.all(
            color: Colors.grey.shade200,
          ),
        ),

        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,

          children: [
            ClipRRect(
              borderRadius:
                  BorderRadius.circular(10),

              child: Image.asset(
                category['image']!,
                width: 55,
                height: 55,
                fit: BoxFit.cover,

                errorBuilder:
                    (context, error, stackTrace) {
                  return Container(
                    width: 55,
                    height: 55,
                    color:
                        Colors.grey.shade200,

                    child: const Icon(
                      Icons.image,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 8),

            Text(
              category['title']!,
              style: const TextStyle(
                fontSize: 13,
                fontWeight:
                    FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // SECTION HEADER
  // ==========================================================

  Widget _buildSectionHeader(
    String title,
  ) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(
        horizontal: 16,
      ),

      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 21,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ),

          const Text(
            'View All',
            style: TextStyle(
              color: Colors.orange,
              fontWeight:
                  FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // CLASSIFIED CARD
  // ==========================================================

  Widget _buildClassifiedCard(
    Map<String, dynamic> item, {
    required bool isVehicle,
  }) {
    return Container(
      width: 270,

      margin:
          const EdgeInsets.only(right: 14),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(15),

        border: Border.all(
          color: Colors.grey.shade200,
        ),

        boxShadow: [
          BoxShadow(
            color:
                Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset:
                const Offset(0, 2),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          // ==================================================
          // IMAGE + FAVOURITE
          // ==================================================

          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.only(
                  topLeft:
                      Radius.circular(15),
                  topRight:
                      Radius.circular(15),
                ),

                child: Image.asset(
                  item['image'],
                  width: double.infinity,
                  height: 155,
                  fit: BoxFit.cover,

                  errorBuilder:
                      (context, error, stackTrace) {
                    return Container(
                      width:
                          double.infinity,
                      height: 155,
                      color:
                          Colors.grey.shade200,

                      child: const Icon(
                        Icons
                            .image_not_supported,
                        size: 45,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),

              Positioned(
                top: 10,
                right: 10,

                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      item['favorite'] =
                          !item['favorite'];
                    });
                  },

                  child: Container(
                    width: 38,
                    height: 38,

                    decoration:
                        const BoxDecoration(
                      color: Colors.white,
                      shape:
                          BoxShape.circle,
                    ),

                    child: Icon(
                      item['favorite'] == true
                          ? Icons.favorite
                          : Icons
                              .favorite_border,

                      color:
                          item['favorite'] ==
                                  true
                              ? Colors.orange
                              : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // ==================================================
          // DETAILS
          // ==================================================

          Padding(
            padding:
                const EdgeInsets.all(13),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                Text(
                  item['title'],
                  maxLines: 1,
                  overflow:
                      TextOverflow.ellipsis,

                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  item['description'],
                  maxLines: 2,
                  overflow:
                      TextOverflow.ellipsis,

                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    height: 1.3,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  item['price'],
                  style: const TextStyle(
                    color: Colors.orange,
                    fontSize: 15,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Row(
                  children: [
                    const Icon(
                      Icons.location_on_outlined,
                      size: 16,
                      color: Colors.grey,
                    ),

                    const SizedBox(width: 4),

                    Expanded(
                      child: Text(
                        item['location'],
                        maxLines: 1,
                        overflow:
                            TextOverflow.ellipsis,

                        style:
                            const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // ==================================================
                // SHARE
                // ==================================================

                Align(
                  alignment:
                      Alignment.centerRight,

                  child: InkWell(
                    onTap: () {
                      _shareItem(
                        item['title'],
                      );
                    },

                    borderRadius:
                        BorderRadius.circular(
                      20,
                    ),

                    child: Padding(
                      padding:
                          const EdgeInsets
                              .symmetric(
                        horizontal: 8,
                        vertical: 5,
                      ),

                      child: Row(
                        mainAxisSize:
                            MainAxisSize.min,

                        children: const [
                          Icon(
                            Icons.share_outlined,
                            size: 18,
                            color: Colors.orange,
                          ),

                          SizedBox(width: 5),

                          Text(
                            'Share',
                            style: TextStyle(
                              color:
                                  Colors.orange,
                              fontWeight:
                                  FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}