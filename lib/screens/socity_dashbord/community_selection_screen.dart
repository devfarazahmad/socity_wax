import 'package:flutter/material.dart';

import 'package:socity_wax/screens/Bottom%20navigationbar/classified_screen.dart';
import 'package:socity_wax/screens/Bottom%20navigationbar/home_screen.dart';
import 'package:socity_wax/screens/Bottom%20navigationbar/news_screen.dart';
import 'package:socity_wax/screens/Bottom%20navigationbar/survey_screen.dart';

import 'package:socity_wax/screens/socity_dashbord/all_sponsors_screen.dart';
import 'package:socity_wax/screens/socity_dashbord/all_events_screen.dart';
import 'package:socity_wax/screens/socity_dashbord/all_donors_screen.dart';
import 'package:socity_wax/screens/socity_dashbord/all_committee_members_screen.dart';
import 'package:socity_wax/screens/socity_dashbord/create_event_screen.dart';

import 'package:socity_wax/screens/socity_dashbord/committee_member_detail_screen.dart';
import 'package:socity_wax/screens/socity_dashbord/donor_detail_screen.dart';
import 'package:socity_wax/screens/socity_dashbord/event_detail_screen.dart';
import 'package:socity_wax/screens/socity_dashbord/feedback_screen.dart';
import 'package:socity_wax/screens/socity_dashbord/gallery_detail_screen.dart';
import 'package:socity_wax/screens/socity_dashbord/profile_screen.dart';
import 'package:socity_wax/screens/socity_dashbord/sponsor_detail_screen.dart';

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

  final List<Map<String, String>> sponsors = [
    {
      'name': 'Tech Solutions',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Hayatian Foods',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Digital World',
      'image': 'assets/images/society_wax_logo.jpg',
    },
  ];

  final List<Map<String, String>> donors = [
    {
      'name': 'Ali Raza',
      'amount': 'PKR 50,000',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Usman Khan',
      'amount': 'PKR 30,000',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Ahmed Hassan',
      'amount': 'PKR 20,000',
      'image': 'assets/images/society_wax_logo.jpg',
    },
  ];

  final List<Map<String, String>> committeeMembers = [
    {
      'name': 'Ali Raza',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Usman Khan',
      'image': 'assets/images/society_wax_logo.jpg',
    },
    {
      'name': 'Ahmed Hassan',
      'image': 'assets/images/society_wax_logo.jpg',
    },
  ];

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
  // NAVIGATION HELPERS
  // ==========================================================

  void _openAllSponsors() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AllSponsorsScreen(),
      ),
    );
  }

  void _openAllEvents() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AllEventsScreen(),
      ),
    );
  }

  void _openAllDonors() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AllDonorsScreen(),
      ),
    );
  }

  void _openAllCommitteeMembers() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AllCommitteeMembersScreen(),
      ),
    );
  }

  void _createEvent() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateEventScreen(),
      ),
    );
  }

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

            // =================================================
            // UPCOMING EVENTS
            // =================================================

            _sectionTitle(
              'Upcoming Events',
              showAll: true,
              onShowAll: _openAllEvents,
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
                    index,
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            // =================================================
            // NOTICE BOARD
            // =================================================

            _buildNoticeBoard(),

            const SizedBox(height: 25),

            // =================================================
            // SPONSORS
            // =================================================

            _buildSponsorsSection(),

            const SizedBox(height: 25),

            // =================================================
            // EVENTS
            // =================================================

            _buildEventsSection(),

            const SizedBox(height: 20),

            // =================================================
            // CREATE EVENT
            // =================================================

            _orangeButton(
              text: 'Create an Event',
              onPressed: _createEvent,
            ),

            const SizedBox(height: 25),

            // =================================================
            // DONORS
            // =================================================

            _buildDonorsSection(),

            const SizedBox(height: 25),

            // =================================================
            // COMMITTEE MEMBERS
            // =================================================

            _buildCommitteeSection(),

            const SizedBox(height: 25),

            // =================================================
            // GALLERY
            // =================================================

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

            // =================================================
            // FEEDBACK
            // =================================================

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

          const Row(
            children: [
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
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EventDetailScreen(),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    event['title']!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    event['date']!,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),

                  Text(
                    event['location']!,
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
            title: 'Annual Community Gathering at Hayatian Campus',
            description:
                'Interested people can join via the link below.',
            isLast: false,
          ),

          _noticeItem(
            date: '25 August 2026',
            title: 'Annual Sports Gala at University Ground',
            description:
                'Interested people can join via the link below.',
            isLast: false,
          ),

          _noticeItem(
            date: '30 August 2026',
            title: 'Community Dinner at Community Hall',
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 25,
            child: Column(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: const BoxDecoration(
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
              padding: const EdgeInsets.only(bottom: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    date,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.orange,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(
            'Sponsors',
            showAll: true,
            onShowAll: _openAllSponsors,
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
              scrollDirection: Axis.horizontal,
              itemCount: sponsors.length,
              itemBuilder: (context, index) {
                return _personCard(
                  image: sponsors[index]['image']!,
                  name: sponsors[index]['name']!,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const SponsorDetailScreen(name: '', phone: '', company: '', image: '',),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(
            'Events',
            showAll: true,
            onShowAll: _openAllEvents,
          ),

          const SizedBox(height: 15),

          SizedBox(
            height: 230,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
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
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: const DecorationImage(
                        image: AssetImage(
                          'assets/images/society_wax_logo.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.3),
                            Colors.black.withOpacity(0.8),
                          ],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                        children: [
                          const Row(
                            children: [
                              Icon(
                                Icons.calendar_month,
                                color: Colors.white,
                              ),
                              SizedBox(width: 5),
                              Text(
                                '20 Aug 2026',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          const Row(
                            children: [
                              Expanded(
                                child: Text(
                                  'Annual Community Event\n'
                                  'Hayatian Campus',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),

                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(
            'Donors',
            showAll: true,
            onShowAll: _openAllDonors,
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
              scrollDirection: Axis.horizontal,
              itemCount: donors.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const DonorDetailScreen(name: '', phone: '', club: '', image: '',),
                      ),
                    );
                  },
                  child: Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 12),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.grey.shade200,
                      ),
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage(
                            donors[index]['image']!,
                          ),
                        ),

                        const SizedBox(height: 7),

                        Text(
                          donors[index]['name']!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 3),

                        Text(
                          donors[index]['amount']!,
                          style: const TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.w600,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionTitle(
            'Committee Member',
            showAll: true,
            onShowAll: _openAllCommitteeMembers,
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
              scrollDirection: Axis.horizontal,
              itemCount: committeeMembers.length,
              itemBuilder: (context, index) {
                return _personCard(
                  image: committeeMembers[index]['image']!,
                  name: committeeMembers[index]['name']!,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const CommitteeMemberDetailScreen(name: '', phone: '', position: '', image: '',),
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
            itemBuilder: (context, index) {
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                        gallery[index]['image']!,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      gallery[index]['title']!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
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
  // COMMON CONTAINER
  // ==========================================================

  Widget _whiteContainer({
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
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
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey.shade200,
          ),
        ),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(image),
            ),

            const SizedBox(height: 8),

            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
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
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          foregroundColor: Colors.white,
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

// ==========================================================
// SEARCH DELEGATE
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
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = items
        .where(
          (item) => item
              .toLowerCase()
              .contains(query.toLowerCase()),
        )
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(
            Icons.search,
            color: Colors.orange,
          ),
          title: Text(results[index]),
          onTap: () {
            close(context, results[index]);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final results = items
        .where(
          (item) => item
              .toLowerCase()
              .contains(query.toLowerCase()),
        )
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(
            Icons.search,
            color: Colors.orange,
          ),
          title: Text(results[index]),
          onTap: () {
            query = results[index];
            showResults(context);
          },
        );
      },
    );
  }
}