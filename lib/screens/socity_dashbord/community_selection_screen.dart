import 'package:flutter/material.dart';

import 'package:socity_wax/screens/Bottom%20navigationbar/classified_screen.dart';
import 'package:socity_wax/screens/Bottom%20navigationbar/home_screen.dart';
import 'package:socity_wax/screens/Bottom%20navigationbar/news_screen.dart';
import 'package:socity_wax/screens/Bottom%20navigationbar/survey_screen.dart';

import 'package:socity_wax/screens/socity_dashbord/event_detail_screen.dart';
import 'package:socity_wax/screens/socity_dashbord/feedback_screen.dart';
import 'package:socity_wax/screens/socity_dashbord/gallery_detail_screen.dart';
import 'package:socity_wax/screens/socity_dashbord/profile_screen.dart';


// ==========================================================
// COMMUNITY SELECTION SCREEN
// ==========================================================

class CommunitySelectionScreen extends StatefulWidget {
  const CommunitySelectionScreen({super.key});

  @override
  State<CommunitySelectionScreen> createState() =>
      _CommunitySelectionScreenState();
}

class _CommunitySelectionScreenState
    extends State<CommunitySelectionScreen> {
  int _selectedBottomIndex = 0;

  final String userName = 'Faraz Ahmad';

  // ==========================================================
  // UPCOMING EVENTS
  // ==========================================================

  final List<Map<String, String>> upcomingEvents = [
    {
      'title': 'Annual Community Meeting',
      'date': '20 Aug 2026',
      'location': 'Hayatian Campus',
    },
    {
      'title': 'Sports Gala',
      'date': '25 Aug 2026',
      'location': 'University Ground',
    },
    {
      'title': 'Community Dinner',
      'date': '30 Aug 2026',
      'location': 'Community Hall',
    },
  ];

  // ==========================================================
  // SPONSORS
  // ==========================================================

  final List<Map<String, String>> sponsors = [
    {
      'name': 'Tech Solutions',
      'phone': '+92 300 1111111',
      'companyName': 'Tech Solutions Pvt Ltd',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Hayatian Foods',
      'phone': '+92 301 2222222',
      'companyName': 'Hayatian Foods Pvt Ltd',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Digital World',
      'phone': '+92 302 3333333',
      'companyName': 'Digital World Solutions',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Community Builders',
      'phone': '+92 303 4444444',
      'companyName': 'Community Builders Pvt Ltd',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Future Technologies',
      'phone': '+92 304 5555555',
      'companyName': 'Future Technologies',
      'image': 'assets/images/society_wax_logo.jpg',
    },
  ];

  // ==========================================================
  // DONORS
  // ==========================================================

  final List<Map<String, String>> donors = [
    {
      'name': 'Ali Raza',
      'amount': 'PKR 50,000',
      'phone': '+92 300 1111111',
      'clubName': 'Hayatian Social Club',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Usman Khan',
      'amount': 'PKR 30,000',
      'phone': '+92 301 2222222',
      'clubName': 'Community Welfare Club',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Ahmed Hassan',
      'amount': 'PKR 20,000',
      'phone': '+92 302 3333333',
      'clubName': 'Hayatian Youth Club',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Muhammad Bilal',
      'amount': 'PKR 45,000',
      'phone': '+92 303 4444444',
      'clubName': 'Community Development Club',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Hassan Ali',
      'amount': 'PKR 35,000',
      'phone': '+92 304 5555555',
      'clubName': 'Social Welfare Club',
      'image': 'assets/images/society_wax_logo.jpg',
    },
  ];

  // ==========================================================
  // COMMITTEE MEMBERS
  // ==========================================================

  final List<Map<String, String>> committeeMembers = [
    {
      'name': 'Ali Raza',
      'phone': '+92 300 1111111',
      'position': 'President',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Usman Khan',
      'phone': '+92 301 2222222',
      'position': 'Vice President',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Ahmed Hassan',
      'phone': '+92 302 3333333',
      'position': 'General Secretary',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Muhammad Bilal',
      'phone': '+92 303 4444444',
      'position': 'Finance Secretary',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Hassan Ali',
      'phone': '+92 304 5555555',
      'position': 'Event Coordinator',
      'image': 'assets/images/society_wax_logo.jpg',
    },
  ];

  // ==========================================================
  // GALLERY
  // ==========================================================

  final List<Map<String, String>> gallery = [
    {
      'title': 'Annual Dinner',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'title': 'Sports Gala',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'title': 'Community Event',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'title': 'Cultural Night',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'title': 'Family Gathering',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'title': 'Award Ceremony',
      'image': 'assets/images/society_wax_logo.jpg',
    },
  ];

  // ==========================================================
  // EVENTS
  // ==========================================================

  final List<Map<String, String>> events = [
    {
      'title': 'Annual Community Event',
      'date': '20 Aug 2026',
      'location': 'Hayatian Campus',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'title': 'Sports Gala',
      'date': '25 Aug 2026',
      'location': 'University Ground',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'title': 'Community Dinner',
      'date': '30 Aug 2026',
      'location': 'Community Hall',
      'image': 'assets/images/society_wax_logo.jpg',
    },
  ];

  // ==========================================================
  // BOTTOM NAVIGATION
  // ==========================================================

  void _changeBottomNavigation(int index) {
    setState(() {
      _selectedBottomIndex = index;
    });

    Widget screen;

    switch (index) {
      case 1:
        screen = const NewsScreen();
        break;

      case 2:
        screen = const ClassifiedScreen();
        break;

      case 3:
        screen = const SurveyScreen();
        break;

      default:
        screen = const HomeScreen();
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
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
        title: Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(
                'assets/images/society_wax_logo.jpg',
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: Text(
                userName,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),

            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: DashboardSearchDelegate(),
                );
              },
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
            ),

            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('No new notifications'),
                  ),
                );
              },
              icon: const Icon(
                Icons.notifications_none,
                color: Colors.black,
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              child: const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage(
                  'assets/images/society_wax_logo.jpg',
                ),
              ),
            ),
          ],
        ),
      ),

      // ======================================================
      // BODY
      // ======================================================

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildUserCard(),

            const SizedBox(height: 20),

            _sectionTitle(
              'Upcoming Events',
              showAll: true,
              onShowAll: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventListScreen(
                      events: events,
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 10),

            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: upcomingEvents.length,
                itemBuilder: (context, index) {
                  return _buildUpcomingEvent(
                    upcomingEvents[index],
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            _buildNoticeBoard(),

            const SizedBox(height: 25),

            _buildSponsorsSection(),

            const SizedBox(height: 25),

            _buildEventsSection(),

            const SizedBox(height: 20),

            _orangeButton(
              text: 'Create an Event',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const EventDetailScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 25),

            _buildDonorsSection(),

            const SizedBox(height: 25),

            _buildCommitteeSection(),

            const SizedBox(height: 25),

            _buildGallerySection(),

            const SizedBox(height: 20),

            _orangeButton(
              text: 'View All',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        const GalleryDetailScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 25),

            _buildFeedbackSection(),

            const SizedBox(height: 20),
          ],
        ),
      ),

      // ======================================================
      // BOTTOM NAVIGATION
      // ======================================================

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedBottomIndex,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: _changeBottomNavigation,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper_outlined),
            activeIcon: Icon(Icons.newspaper),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.class_outlined),
            activeIcon: Icon(Icons.class_),
            label: 'Classified',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.poll_outlined),
            activeIcon: Icon(Icons.poll),
            label: 'Survey',
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // USER CARD
  // ==========================================================

  Widget _buildUserCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey.shade200,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            userName,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            'Senior Community Member',
            style: TextStyle(
              fontSize: 15,
              color: Colors.orange,
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 12),

          Row(
            children: const [
              Icon(
                Icons.calendar_month_outlined,
                size: 18,
                color: Colors.grey,
              ),
              SizedBox(width: 7),
              Text(
                'Member since 15 January 2024',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // UPCOMING EVENT
  // ==========================================================

  Widget _buildUpcomingEvent(
    Map<String, String> event,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const EventDetailScreen(),
          ),
        );
      },
      child: Container(
        width: 280,
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Icon(
                Icons.event,
                color: Colors.white,
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Text(
                    event['title'] ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    event['date'] ?? '',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),

                  Text(
                    event['location'] ?? '',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
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
  }

  // ==========================================================
  // NOTICE BOARD
  // ==========================================================

  Widget _buildNoticeBoard() {
    return _whiteContainer(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            'Notice Board',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          _noticeItem(
            date: '20 August 2026',
            title:
                'Annual Community Gathering at Hayatian Campus',
            description:
                'Interested people can join via the link below.',
            isLast: false,
          ),

          _noticeItem(
            date: '25 August 2026',
            title:
                'Annual Sports Gala at University Ground',
            description:
                'Interested people can join via the link below.',
            isLast: false,
          ),

          _noticeItem(
            date: '30 August 2026',
            title:
                'Community Dinner at Community Hall',
            description:
                'Interested people can join via the link below.',
            isLast: true,
          ),
        ],
      ),
    );
  }

  Widget _noticeItem({
    required String date,
    required String title,
    required String description,
    required bool isLast,
  }) {
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
                  width: 12,
                  height: 12,
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
                    date,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.orange,
                      fontWeight:
                          FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
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

  // ==========================================================
  // SPONSORS
  // ==========================================================

  Widget _buildSponsorsSection() {
    return _whiteContainer(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          _sectionTitle(
            'Sponsors',
            showAll: true,
            onShowAll: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      SponsorListScreen(
                    sponsors: sponsors,
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 5),

          const Text(
            'Total Sponsors: 24',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 15),

          SizedBox(
            height: 125,
            child: ListView.builder(
              scrollDirection:
                  Axis.horizontal,
              itemCount: sponsors.length,
              itemBuilder:
                  (context, index) {
                final sponsor =
                    sponsors[index];

                return _personCard(
                  image: sponsor['image'] ??
                      'assets/images/society_wax_logo.jpg',
                  name:
                      sponsor['name'] ?? '',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SponsorDetailScreen(
                          sponsor: sponsor,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // EVENTS
  // ==========================================================

  Widget _buildEventsSection() {
    return _whiteContainer(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          _sectionTitle(
            'Events',
            showAll: true,
            onShowAll: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      EventListScreen(
                    events: events,
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 15),

          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection:
                  Axis.horizontal,
              itemCount: events.length,
              itemBuilder:
                  (context, index) {
                final event =
                    events[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const EventDetailScreen(),
                      ),
                    );
                  },

                  child: Container(
                    width: 220,
                    margin:
                        const EdgeInsets.only(
                      right: 12,
                    ),

                    decoration:
                        BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(
                        12,
                      ),

                      image:
                          DecorationImage(
                        image: AssetImage(
                          event['image'] ??
                              'assets/images/society_wax_logo.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),

                    child: Container(
                      padding:
                          const EdgeInsets.all(
                        15,
                      ),

                      decoration:
                          BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(
                          12,
                        ),

                        gradient:
                            LinearGradient(
                          begin:
                              Alignment.topCenter,
                          end:
                              Alignment.bottomCenter,
                          colors: [
                            Colors.black
                                .withOpacity(0.3),
                            Colors.black
                                .withOpacity(0.8),
                          ],
                        ),
                      ),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        mainAxisAlignment:
                            MainAxisAlignment
                                .spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons
                                    .calendar_month,
                                color:
                                    Colors.white,
                              ),

                              const SizedBox(
                                width: 5,
                              ),

                              Text(
                                event['date'] ??
                                    '',
                                style:
                                    const TextStyle(
                                  color:
                                      Colors.white,
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                ),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${event['title'] ?? ''}\n'
                                  '${event['location'] ?? ''}',
                                  style:
                                      const TextStyle(
                                    color:
                                        Colors.white,
                                    fontWeight:
                                        FontWeight
                                            .bold,
                                  ),
                                ),
                              ),

                              const Icon(
                                Icons
                                    .arrow_forward_ios,
                                color:
                                    Colors.white,
                                size: 16,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // DONORS
  // ==========================================================

  Widget _buildDonorsSection() {
    return _whiteContainer(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          _sectionTitle(
            'Donors',
            showAll: true,
            onShowAll: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      DonorListScreen(
                    donors: donors,
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 5),

          const Text(
            'Total Donors: 48',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 15),

          SizedBox(
            height: 135,
            child: ListView.builder(
              scrollDirection:
                  Axis.horizontal,
              itemCount: donors.length,
              itemBuilder:
                  (context, index) {
                final donor =
                    donors[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            DonorDetailScreen(
                          donor: donor,
                        ),
                      ),
                    );
                  },

                  child: Container(
                    width: 150,
                    margin:
                        const EdgeInsets.only(
                      right: 12,
                    ),
                    padding:
                        const EdgeInsets.all(
                      10,
                    ),

                    decoration:
                        BoxDecoration(
                      color:
                          Colors.grey.shade50,
                      borderRadius:
                          BorderRadius.circular(
                        12,
                      ),
                      border: Border.all(
                        color:
                            Colors.grey.shade200,
                      ),
                    ),

                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage:
                              AssetImage(
                            donor['image'] ??
                                'assets/images/society_wax_logo.jpg',
                          ),
                        ),

                        const SizedBox(
                          height: 7,
                        ),

                        Text(
                          donor['name'] ??
                              '',
                          maxLines: 1,
                          overflow:
                              TextOverflow
                                  .ellipsis,
                          style:
                              const TextStyle(
                            fontWeight:
                                FontWeight
                                    .bold,
                          ),
                        ),

                        const SizedBox(
                          height: 3,
                        ),

                        Text(
                          donor['amount'] ??
                              '',
                          style:
                              const TextStyle(
                            color:
                                Colors.orange,
                            fontWeight:
                                FontWeight
                                    .w600,
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
    );
  }

  // ==========================================================
  // COMMITTEE MEMBERS
  // ==========================================================

  Widget _buildCommitteeSection() {
    return _whiteContainer(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          _sectionTitle(
            'Committee Member',
            showAll: true,
            onShowAll: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      CommitteeMemberListScreen(
                    committeeMembers:
                        committeeMembers,
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 5),

          const Text(
            'Total Committee Members: 12',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),

          const SizedBox(height: 15),

          SizedBox(
            height: 125,
            child: ListView.builder(
              scrollDirection:
                  Axis.horizontal,
              itemCount:
                  committeeMembers.length,
              itemBuilder:
                  (context, index) {
                final member =
                    committeeMembers[index];

                return _personCard(
                  image: member['image'] ??
                      'assets/images/society_wax_logo.jpg',
                  name:
                      member['name'] ?? '',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CommitteeMemberDetailScreen(
                          name:
                              member['name'] ??
                                  '',
                          phone:
                              member['phone'] ??
                                  '',
                          position:
                              member['position'] ??
                                  '',
                          image:
                              member['image'] ??
                                  'assets/images/society_wax_logo.jpg',
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // GALLERY
  // ==========================================================

  Widget _buildGallerySection() {
    return _whiteContainer(
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

          const SizedBox(height: 10),

          const Text(
            'We have lot of things to store and share you can '
            'view and share your memory with your special one.',
            style: TextStyle(
              color: Colors.grey,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 15),

          GridView.builder(
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(),
            itemCount: gallery.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemBuilder:
                (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const GalleryDetailScreen(),
                    ),
                  );
                },

                child: Container(
                  decoration:
                      BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(
                      10,
                    ),

                    image:
                        DecorationImage(
                      image: AssetImage(
                        gallery[index]
                                ['image'] ??
                            'assets/images/society_wax_logo.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),

                  child: Container(
                    padding:
                        const EdgeInsets.all(
                      8,
                    ),

                    decoration:
                        BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(
                        10,
                      ),

                      gradient:
                          LinearGradient(
                        begin:
                            Alignment.topCenter,
                        end:
                            Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black
                              .withOpacity(
                            0.7,
                          ),
                        ],
                      ),
                    ),

                    alignment:
                        Alignment.bottomLeft,

                    child: Text(
                      gallery[index]
                              ['title'] ??
                          '',
                      style:
                          const TextStyle(
                        color:
                            Colors.white,
                        fontWeight:
                            FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // FEEDBACK
  // ==========================================================

  Widget _buildFeedbackSection() {
    return _whiteContainer(
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Icons.feedback_outlined,
                color: Colors.orange,
                size: 27,
              ),

              SizedBox(width: 10),

              Text(
                'Feedback',
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          const Text(
            'Share your valuable feedback about society or '
            'committee or anything else that helps us to grow '
            'as a team.',
            style: TextStyle(
              color: Colors.grey,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 18),

          _orangeButton(
            text: 'Share your feedback',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const FeedbackScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // COMMON WHITE CONTAINER
  // ==========================================================

  Widget _whiteContainer({
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
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

  // ==========================================================
  // SECTION TITLE
  // ==========================================================

  Widget _sectionTitle(
    String title, {
    bool showAll = false,
    VoidCallback? onShowAll,
  }) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        if (showAll)
          GestureDetector(
            onTap: onShowAll,
            child: const Text(
              'Show All',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
      ],
    );
  }

  // ==========================================================
  // PERSON CARD
  // ==========================================================

  Widget _personCard({
    required String image,
    required String name,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        margin:
            const EdgeInsets.only(right: 12),
        padding:
            const EdgeInsets.all(10),

        decoration:
            BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius:
              BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
        ),

        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage:
                  AssetImage(image),
            ),

            const SizedBox(height: 8),

            Text(
              name,
              maxLines: 1,
              overflow:
                  TextOverflow.ellipsis,
              textAlign:
                  TextAlign.center,
              style:
                  const TextStyle(
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
  // ORANGE BUTTON
  // ==========================================================

  Widget _orangeButton({
    required String text,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 50,

      child: ElevatedButton(
        onPressed: onPressed,

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

        child: Text(
          text,
          style:
              const TextStyle(
            fontSize: 16,
            fontWeight:
                FontWeight.w500,
          ),
        ),
      ),
    );
  }
}


// ==========================================================
// SPONSOR LIST SCREEN
// ==========================================================

class SponsorListScreen extends StatefulWidget {
  final List<Map<String, String>> sponsors;

  const SponsorListScreen({
    super.key,
    required this.sponsors,
  });

  @override
  State<SponsorListScreen> createState() =>
      _SponsorListScreenState();
}

class _SponsorListScreenState
    extends State<SponsorListScreen> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final filteredSponsors =
        widget.sponsors.where((sponsor) {
      final name =
          sponsor['name']?.toLowerCase() ?? '';

      final company =
          sponsor['companyName']
                  ?.toLowerCase() ??
              '';

      return name.contains(
            searchText.toLowerCase(),
          ) ||
          company.contains(
            searchText.toLowerCase(),
          );
    }).toList();

    return Scaffold(
      backgroundColor:
          Colors.grey.shade100,

      appBar: AppBar(
        title:
            const Text('All Sponsors'),
        backgroundColor:
            Colors.white,
      ),

      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration:
                  InputDecoration(
                hintText:
                    'Search sponsors',
                prefixIcon:
                    const Icon(
                  Icons.search,
                ),
                filled: true,
                fillColor:
                    Colors.white,
                border:
                    OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(
                    12,
                  ),
                  borderSide:
                      BorderSide.none,
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              itemCount:
                  filteredSponsors.length,
              itemBuilder:
                  (context, index) {
                final sponsor =
                    filteredSponsors[index];

                return Card(
                  margin:
                      const EdgeInsets.only(
                    bottom: 12,
                  ),

                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.all(
                      12,
                    ),

                    leading:
                        CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage(
                        sponsor['image'] ??
                            'assets/images/society_wax_logo.jpg',
                      ),
                    ),

                    title: Text(
                      sponsor['name'] ??
                          '',
                      style:
                          const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    subtitle:
                        Text(
                      sponsor[
                              'companyName'] ??
                          '',
                    ),

                    trailing:
                        const Icon(
                      Icons
                          .arrow_forward_ios,
                      size: 16,
                    ),

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  SponsorDetailScreen(
                            sponsor:
                                sponsor,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


// ==========================================================
// SPONSOR DETAIL SCREEN
// ==========================================================

class SponsorDetailScreen extends StatelessWidget {
  final Map<String, String> sponsor;

  const SponsorDetailScreen({
    super.key,
    required this.sponsor,
  });

  @override
  Widget build(BuildContext context) {
    final image = sponsor['image'] ??
        'assets/images/society_wax_logo.jpg';

    return Scaffold(
      backgroundColor:
          Colors.grey.shade100,

      appBar: AppBar(
        title:
            const Text('Sponsor Details'),
        backgroundColor:
            Colors.white,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // COVER
            SizedBox(
              height: 190,
              width: double.infinity,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),

            // PROFILE IMAGE
            Transform.translate(
              offset:
                  const Offset(0, -45),
              child: CircleAvatar(
                radius: 55,
                backgroundColor:
                    Colors.white,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage(image),
                ),
              ),
            ),

            Transform.translate(
              offset:
                  const Offset(0, -30),
              child: Column(
                children: [
                  Text(
                    sponsor['name'] ??
                        '',
                    style:
                        const TextStyle(
                      fontSize: 23,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 6,
                  ),

                  Text(
                    sponsor[
                            'phone'] ??
                        '',
                    style:
                        const TextStyle(
                      color:
                          Colors.grey,
                    ),
                  ),

                  const SizedBox(
                    height: 6,
                  ),

                  Text(
                    sponsor[
                            'companyName'] ??
                        '',
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

            Padding(
              padding:
                  const EdgeInsets.all(
                16,
              ),
              child: Column(
                children: [
                  _detailSection(
                    title: 'Profile',
                    children: const [
                      Text(
                        'A dedicated community sponsor who actively supports community programs, social activities and local initiatives.',
                      ),
                      SizedBox(height: 12),
                      Text(
                        'Date of Birth: 12 March 1985',
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Interest: Technology, community development and social welfare.',
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 18,
                  ),

                  _detailSection(
                    title:
                        'Family Life',
                    children: const [
                      Text(
                        'Lives with family and actively encourages family participation in community events and social activities.',
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 18,
                  ),

                  _detailSection(
                    title:
                        'Social Life',
                    children: const [
                      Text(
                        'Regularly participates in community gatherings, charity activities and social development programs.',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailSection({
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.all(18),
      decoration:
          BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                const TextStyle(
              fontSize: 20,
              fontWeight:
                  FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          ...children,
        ],
      ),
    );
  }
}


// ==========================================================
// EVENT LIST SCREEN
// ==========================================================

class EventListScreen extends StatefulWidget {
  final List<Map<String, String>> events;

  const EventListScreen({
    super.key,
    required this.events,
  });

  @override
  State<EventListScreen> createState() =>
      _EventListScreenState();
}

class _EventListScreenState
    extends State<EventListScreen> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final filteredEvents =
        widget.events.where((event) {
      final title =
          event['title']?.toLowerCase() ??
              '';

      final location =
          event['location']
                  ?.toLowerCase() ??
              '';

      return title.contains(
            searchText.toLowerCase(),
          ) ||
          location.contains(
            searchText.toLowerCase(),
          );
    }).toList();

    return Scaffold(
      backgroundColor:
          Colors.grey.shade100,

      appBar: AppBar(
        title:
            const Text('All Events'),
        backgroundColor:
            Colors.white,
      ),

      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration:
                  InputDecoration(
                hintText:
                    'Search events',
                prefixIcon:
                    const Icon(
                  Icons.search,
                ),
                filled: true,
                fillColor:
                    Colors.white,
                border:
                    OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(
                    12,
                  ),
                  borderSide:
                      BorderSide.none,
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding:
                  const EdgeInsets.all(
                16,
              ),
              itemCount:
                  filteredEvents.length,
              itemBuilder:
                  (context, index) {
                final event =
                    filteredEvents[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EventDetailView(
                          event: event,
                        ),
                      ),
                    );
                  },

                  child: Container(
                    margin:
                        const EdgeInsets.only(
                      bottom: 15,
                    ),
                    height: 180,

                    decoration:
                        BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(
                        15,
                      ),

                      image:
                          DecorationImage(
                        image: AssetImage(
                          event['image'] ??
                              'assets/images/society_wax_logo.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),

                    child: Container(
                      padding:
                          const EdgeInsets.all(
                        15,
                      ),

                      decoration:
                          BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(
                          15,
                        ),

                        gradient:
                            LinearGradient(
                          begin:
                              Alignment.topCenter,
                          end:
                              Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black
                                .withOpacity(
                              0.85,
                            ),
                          ],
                        ),
                      ),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment
                                .start,
                        mainAxisAlignment:
                            MainAxisAlignment
                                .end,
                        children: [
                          Text(
                            event['title'] ??
                                '',
                            style:
                                const TextStyle(
                              color:
                                  Colors.white,
                              fontSize: 20,
                              fontWeight:
                                  FontWeight
                                      .bold,
                            ),
                          ),

                          const SizedBox(
                            height: 5,
                          ),

                          Text(
                            event['date'] ??
                                '',
                            style:
                                const TextStyle(
                              color:
                                  Colors.white,
                            ),
                          ),

                          Text(
                            event['location'] ??
                                '',
                            style:
                                const TextStyle(
                              color:
                                  Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


// ==========================================================
// EVENT DETAIL VIEW
// ==========================================================

class EventDetailView extends StatelessWidget {
  final Map<String, String> event;

  const EventDetailView({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    final image = event['image'] ??
        'assets/images/society_wax_logo.jpg';

    return Scaffold(
      backgroundColor:
          Colors.grey.shade100,

      appBar: AppBar(
        title:
            const Text('Event Details'),
        backgroundColor:
            Colors.white,
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 230,
                  width: double.infinity,
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  right: 16,
                  bottom: 16,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 10,
                    ),
                    decoration:
                        BoxDecoration(
                      color: Colors.orange,
                      borderRadius:
                          BorderRadius.circular(
                        10,
                      ),
                    ),
                    child: const Text(
                      'PKR 1,500',
                      style:
                          TextStyle(
                        color:
                            Colors.white,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding:
                  const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    event['title'] ??
                        '',
                    style:
                        const TextStyle(
                      fontSize: 24,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  _eventInfo(
                    Icons.calendar_month,
                    event['date'] ??
                        '',
                  ),

                  const SizedBox(
                    height: 8,
                  ),

                  _eventInfo(
                    Icons.location_on,
                    event['location'] ??
                        '',
                  ),

                  const SizedBox(
                    height: 20,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style:
                              ElevatedButton
                                  .styleFrom(
                            backgroundColor:
                                Colors.orange,
                            foregroundColor:
                                Colors.white,
                            padding:
                                const EdgeInsets
                                    .symmetric(
                              vertical: 14,
                            ),
                          ),
                          child:
                              const Text(
                            'Participant',
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: 12,
                      ),

                      Expanded(
                        child:
                            OutlinedButton(
                          onPressed: () {},
                          style:
                              OutlinedButton
                                  .styleFrom(
                            foregroundColor:
                                Colors.orange,
                            side:
                                const BorderSide(
                              color:
                                  Colors.orange,
                            ),
                            padding:
                                const EdgeInsets
                                    .symmetric(
                              vertical: 14,
                            ),
                          ),
                          child:
                              const Text(
                            'Invite Friend',
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  _eventSection(
                    'Information',
                    'This event is organized for community members to participate, connect with one another and enjoy a meaningful community experience.',
                  ),

                  const SizedBox(
                    height: 25,
                  ),

                  const Text(
                    'Gallery',
                    style:
                        TextStyle(
                      fontSize: 21,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 12,
                  ),

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
                    itemBuilder:
                        (context, index) {
                      return ClipRRect(
                        borderRadius:
                            BorderRadius
                                .circular(
                          10,
                        ),
                        child:
                            Image.asset(
                          image,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _eventInfo(
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
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style:
                const TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Widget _eventSection(
    String title,
    String text,
  ) {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.all(18),
      decoration:
          BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                const TextStyle(
              fontSize: 20,
              fontWeight:
                  FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style:
                const TextStyle(
              color: Colors.grey,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}


// ==========================================================
// DONOR LIST SCREEN
// ==========================================================

class DonorListScreen extends StatefulWidget {
  final List<Map<String, String>> donors;

  const DonorListScreen({
    super.key,
    required this.donors,
  });

  @override
  State<DonorListScreen> createState() =>
      _DonorListScreenState();
}

class _DonorListScreenState
    extends State<DonorListScreen> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final filteredDonors =
        widget.donors.where((donor) {
      final name =
          donor['name']?.toLowerCase() ??
              '';

      final club =
          donor['clubName']
                  ?.toLowerCase() ??
              '';

      return name.contains(
            searchText.toLowerCase(),
          ) ||
          club.contains(
            searchText.toLowerCase(),
          );
    }).toList();

    return Scaffold(
      backgroundColor:
          Colors.grey.shade100,

      appBar: AppBar(
        title:
            const Text('All Donors'),
        backgroundColor:
            Colors.white,
      ),

      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration:
                  InputDecoration(
                hintText:
                    'Search donors',
                prefixIcon:
                    const Icon(
                  Icons.search,
                ),
                filled: true,
                fillColor:
                    Colors.white,
                border:
                    OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(
                    12,
                  ),
                  borderSide:
                      BorderSide.none,
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              itemCount:
                  filteredDonors.length,
              itemBuilder:
                  (context, index) {
                final donor =
                    filteredDonors[index];

                return Card(
                  margin:
                      const EdgeInsets.only(
                    bottom: 12,
                  ),

                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.all(
                      12,
                    ),

                    leading:
                        CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage(
                        donor['image'] ??
                            'assets/images/society_wax_logo.jpg',
                      ),
                    ),

                    title: Text(
                      donor['name'] ??
                          '',
                      style:
                          const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    subtitle:
                        Text(
                      donor['amount'] ??
                          '',
                    ),

                    trailing:
                        const Icon(
                      Icons
                          .arrow_forward_ios,
                      size: 16,
                    ),

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DonorDetailScreen(
                            donor: donor,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


// ==========================================================
// DONOR DETAIL SCREEN
// ==========================================================

class DonorDetailScreen extends StatelessWidget {
  final Map<String, String> donor;

  const DonorDetailScreen({
    super.key,
    required this.donor,
  });

  @override
  Widget build(BuildContext context) {
    final image = donor['image'] ??
        'assets/images/society_wax_logo.jpg';

    return Scaffold(
      backgroundColor:
          Colors.grey.shade100,

      appBar: AppBar(
        title:
            const Text('Donor Details'),
        backgroundColor:
            Colors.white,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 190,
              width: double.infinity,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),

            Transform.translate(
              offset:
                  const Offset(0, -45),
              child: CircleAvatar(
                radius: 55,
                backgroundColor:
                    Colors.white,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage(image),
                ),
              ),
            ),

            Transform.translate(
              offset:
                  const Offset(0, -30),
              child: Column(
                children: [
                  Text(
                    donor['name'] ??
                        '',
                    style:
                        const TextStyle(
                      fontSize: 23,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 6,
                  ),

                  Text(
                    donor['phone'] ??
                        '',
                    style:
                        const TextStyle(
                      color:
                          Colors.grey,
                    ),
                  ),

                  const SizedBox(
                    height: 6,
                  ),

                  Text(
                    donor['clubName'] ??
                        '',
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

            Padding(
              padding:
                  const EdgeInsets.all(
                16,
              ),
              child: Column(
                children: [
                  _donationHistory(),

                  const SizedBox(
                    height: 18,
                  ),

                  _donorProfile(),

                  const SizedBox(
                    height: 18,
                  ),

                  _achievements(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _donationHistory() {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.all(18),
      decoration:
          BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            'Donation History',
            style:
                TextStyle(
              fontSize: 20,
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          const SizedBox(
            height: 18,
          ),

          _donationItem(
            'Hayatian Community Society',
            'PKR 50,000',
            '15 January 2026',
            false,
          ),

          _donationItem(
            'Community Welfare Society',
            'PKR 30,000',
            '10 March 2026',
            false,
          ),

          _donationItem(
            'Social Development Society',
            'PKR 20,000',
            '20 June 2026',
            true,
          ),
        ],
      ),
    );
  }

  Widget _donationItem(
    String society,
    String amount,
    String date,
    bool last,
  ) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 20,
            child: Column(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration:
                      const BoxDecoration(
                    color: Colors.orange,
                    shape: BoxShape.circle,
                  ),
                ),

                if (!last)
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
                bottom: 22,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    society,
                    style:
                        const TextStyle(
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  Text(
                    amount,
                    style:
                        const TextStyle(
                      color:
                          Colors.orange,
                      fontWeight:
                          FontWeight.w600,
                    ),
                  ),

                  const SizedBox(
                    height: 3,
                  ),

                  Text(
                    date,
                    style:
                        const TextStyle(
                      color:
                          Colors.grey,
                      fontSize: 12,
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

  Widget _donorProfile() {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.all(18),
      decoration:
          BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(15),
      ),
      child: const Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            'Profile',
            style:
                TextStyle(
              fontSize: 20,
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          SizedBox(height: 12),

          Text(
            'A generous and active community member who believes in supporting social welfare, community development and charitable initiatives.',
            style:
                TextStyle(
              color: Colors.grey,
              height: 1.5,
            ),
          ),

          SizedBox(height: 12),

          Text(
            'Date of Birth: 18 May 1982',
          ),

          SizedBox(height: 8),

          Text(
            'Interest: Charity, community service, education and social welfare.',
          ),
        ],
      ),
    );
  }

  Widget _achievements() {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.all(18),
      decoration:
          BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            'Achievements & Awards',
            style:
                TextStyle(
              fontSize: 20,
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          const SizedBox(
            height: 15,
          ),

          Row(
            children: [
              Expanded(
                child: _awardImage(),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _awardImage(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _awardImage() {
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(10),
      child: Image.asset(
        'assets/images/society_wax_logo.jpg',
        height: 120,
        fit: BoxFit.cover,
      ),
    );
  }
}


// ==========================================================
// COMMITTEE MEMBER LIST SCREEN
// ==========================================================

class CommitteeMemberListScreen
    extends StatefulWidget {
  final List<Map<String, String>>
      committeeMembers;

  const CommitteeMemberListScreen({
    super.key,
    required this.committeeMembers,
  });

  @override
  State<CommitteeMemberListScreen>
      createState() =>
          _CommitteeMemberListScreenState();
}

class _CommitteeMemberListScreenState
    extends State<CommitteeMemberListScreen> {
  String searchText = '';

  @override
  Widget build(BuildContext context) {
    final filteredMembers =
        widget.committeeMembers
            .where((member) {
      final name =
          member['name']
                  ?.toLowerCase() ??
              '';

      final position =
          member['position']
                  ?.toLowerCase() ??
              '';

      return name.contains(
            searchText.toLowerCase(),
          ) ||
          position.contains(
            searchText.toLowerCase(),
          );
    }).toList();

    return Scaffold(
      backgroundColor:
          Colors.grey.shade100,

      appBar: AppBar(
        title: const Text(
          'Committee Members',
        ),
        backgroundColor:
            Colors.white,
      ),

      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.all(16),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchText = value;
                });
              },
              decoration:
                  InputDecoration(
                hintText:
                    'Search committee member',
                prefixIcon:
                    const Icon(
                  Icons.search,
                ),
                filled: true,
                fillColor:
                    Colors.white,
                border:
                    OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(
                    12,
                  ),
                  borderSide:
                      BorderSide.none,
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              padding:
                  const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              itemCount:
                  filteredMembers.length,
              itemBuilder:
                  (context, index) {
                final member =
                    filteredMembers[index];

                return Card(
                  margin:
                      const EdgeInsets.only(
                    bottom: 12,
                  ),

                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.all(
                      12,
                    ),

                    leading:
                        CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          AssetImage(
                        member['image'] ??
                            'assets/images/society_wax_logo.jpg',
                      ),
                    ),

                    title: Text(
                      member['name'] ??
                          '',
                      style:
                          const TextStyle(
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    subtitle:
                        Text(
                      member['position'] ??
                          '',
                    ),

                    trailing:
                        const Icon(
                      Icons
                          .arrow_forward_ios,
                      size: 16,
                    ),

                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              CommitteeMemberDetailScreen(
                            name:
                                member['name'] ??
                                    '',
                            phone:
                                member['phone'] ??
                                    '',
                            position:
                                member['position'] ??
                                    '',
                            image:
                                member['image'] ??
                                    'assets/images/society_wax_logo.jpg',
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}


// ==========================================================
// COMMITTEE MEMBER DETAIL SCREEN
// ==========================================================

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
      backgroundColor:
          Colors.grey.shade100,

      appBar: AppBar(
        title: const Text(
          'Committee Member',
        ),
        backgroundColor:
            Colors.white,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 190,
              width: double.infinity,
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),

            Transform.translate(
              offset:
                  const Offset(0, -45),
              child: CircleAvatar(
                radius: 55,
                backgroundColor:
                    Colors.white,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage(image),
                ),
              ),
            ),

            Transform.translate(
              offset:
                  const Offset(0, -30),
              child: Column(
                children: [
                  Text(
                    name,
                    style:
                        const TextStyle(
                      fontSize: 23,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 6,
                  ),

                  Text(
                    phone,
                    style:
                        const TextStyle(
                      color:
                          Colors.grey,
                    ),
                  ),

                  const SizedBox(
                    height: 6,
                  ),

                  Text(
                    position,
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

            Padding(
              padding:
                  const EdgeInsets.all(
                16,
              ),
              child: Column(
                children: [
                  _section(
                    'Profile',
                    'An active committee member dedicated to community development, organization and social activities.',
                  ),

                  const SizedBox(
                    height: 18,
                  ),

                  _section(
                    'Family Life',
                    'Maintains a strong family relationship and encourages family participation in community activities.',
                  ),

                  const SizedBox(
                    height: 18,
                  ),

                  _section(
                    'Social Life',
                    'Actively participates in community events, meetings, welfare activities and social initiatives.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _section(
    String title,
    String description,
  ) {
    return Container(
      width: double.infinity,
      padding:
          const EdgeInsets.all(18),
      decoration:
          BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style:
                const TextStyle(
              fontSize: 20,
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          const SizedBox(
            height: 12,
          ),

          Text(
            description,
            style:
                const TextStyle(
              color: Colors.grey,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}


// ==========================================================
// DASHBOARD SEARCH
// ==========================================================

class DashboardSearchDelegate
    extends SearchDelegate<String> {
  final List<String> items = [
    'Events',
    'Sponsors',
    'Donors',
    'Committee Members',
    'Gallery',
    'Notice Board',
    'Feedback',
  ];

  @override
  List<Widget>? buildActions(
    BuildContext context,
  ) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon:
            const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(
    BuildContext context,
  ) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon:
          const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(
    BuildContext context,
  ) {
    final results = items
        .where(
          (item) => item
              .toLowerCase()
              .contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder:
          (context, index) {
        return ListTile(
          leading:
              const Icon(
            Icons.search,
            color: Colors.orange,
          ),
          title:
              Text(results[index]),
          onTap: () {
            close(
              context,
              results[index],
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(
    BuildContext context,
  ) {
    final results = items
        .where(
          (item) => item
              .toLowerCase()
              .contains(
                query.toLowerCase(),
              ),
        )
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder:
          (context, index) {
        return ListTile(
          leading:
              const Icon(
            Icons.search,
            color: Colors.orange,
          ),
          title:
              Text(results[index]),
          onTap: () {
            query =
                results[index];
            showResults(context);
          },
        );
      },
    );
  }
}