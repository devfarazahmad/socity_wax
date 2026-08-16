import 'package:flutter/material.dart';
import 'package:socity_wax/screens/socity_dashbord/profile_screen.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  // ==========================================================
  // CONTROLLERS
  // ==========================================================

  final TextEditingController _personController =
      TextEditingController();

  final TextEditingController _messageController =
      TextEditingController();

  // ==========================================================
  // VARIABLES
  // ==========================================================

  int _selectedRating = 0;

  String _selectedFeedbackType = '';

  final List<String> _feedbackTypes = [
    'Society',
    'Committee',
    'Program',
    'Festival Celebration',
    'Individual',
    'Application',
  ];

  // ==========================================================
  // SHARE FEEDBACK
  // ==========================================================

  void _shareFeedback() {
    if (_selectedRating == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please give us a rating'),
        ),
      );
      return;
    }

    if (_selectedFeedbackType.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select feedback type'),
        ),
      );
      return;
    }

    if (_personController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter whom you want to share with'),
        ),
      );
      return;
    }

    if (_messageController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your message or feedback'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Thank you! Your feedback has been shared successfully.',
        ),
      ),
    );

    // Clear fields after sharing
    _personController.clear();
    _messageController.clear();

    setState(() {
      _selectedRating = 0;
      _selectedFeedbackType = '';
    });
  }

  // ==========================================================
  // DISPOSE
  // ==========================================================

  @override
  void dispose() {
    _personController.dispose();
    _messageController.dispose();
    super.dispose();
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

        automaticallyImplyLeading: true,

        title: const Text(
          'Feedback',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),

        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            },

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
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            // ==================================================
            // GIVE US RATING
            // ==================================================

            const Center(
              child: Text(
                'Give us Rating',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // ==================================================
            // STAR RATING
            // ==================================================

            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  5,
                  (index) {
                    final int starNumber = index + 1;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedRating = starNumber;
                        });
                      },

                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 5,
                        ),

                        child: Icon(
                          starNumber <= _selectedRating
                              ? Icons.star
                              : Icons.star_border,

                          color: Colors.orange,

                          size: 42,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==================================================
            // FEEDBACK FOR
            // ==================================================

            const Text(
              'Feedback for',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // ==================================================
            // FEEDBACK CATEGORY BUTTONS
            // ==================================================

            Wrap(
              spacing: 10,
              runSpacing: 10,

              children: _feedbackTypes.map(
                (type) {
                  final bool isSelected =
                      _selectedFeedbackType == type;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedFeedbackType = type;
                      });
                    },

                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 11,
                      ),

                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.orange
                            : Colors.white,

                        borderRadius:
                            BorderRadius.circular(10),

                        border: Border.all(
                          color: Colors.orange,
                          width: 1.2,
                        ),
                      ),

                      child: Text(
                        type,

                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : Colors.orange,

                          fontWeight: FontWeight.w600,

                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                },
              ).toList(),
            ),

            const SizedBox(height: 30),

            // ==================================================
            // WHOM DO YOU WANT TO SHARE
            // ==================================================

            const Text(
              'Whom do you want to share ?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: _personController,

              decoration: InputDecoration(
                hintText: 'Enter person or department name',

                filled: true,
                fillColor: Colors.white,

                prefixIcon: const Icon(
                  Icons.person_outline,
                  color: Colors.orange,
                ),

                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10),

                  borderSide: BorderSide.none,
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10),

                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10),

                  borderSide: const BorderSide(
                    color: Colors.orange,
                    width: 2,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            // ==================================================
            // MESSAGE / SUGGESTION / FEEDBACK
            // ==================================================

            const Text(
              'What is message/Suggestion/Feedback?',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            TextField(
              controller: _messageController,

              maxLines: 7,

              textInputAction:
                  TextInputAction.newline,

              decoration: InputDecoration(
                hintText:
                    'Write your message, suggestion or feedback...',

                filled: true,
                fillColor: Colors.white,

                alignLabelWithHint: true,

                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10),

                  borderSide: BorderSide.none,
                ),

                enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10),

                  borderSide: BorderSide(
                    color: Colors.grey.shade300,
                  ),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(10),

                  borderSide: const BorderSide(
                    color: Colors.orange,
                    width: 2,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            // ==================================================
            // SHARE BUTTON
            // ==================================================

            SizedBox(
              width: double.infinity,
              height: 52,

              child: ElevatedButton(
                onPressed: _shareFeedback,

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,

                  elevation: 3,

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10),
                  ),
                ),

                child: const Text(
                  'Share',

                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}