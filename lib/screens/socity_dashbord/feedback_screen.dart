import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() =>
      _FeedbackScreenState();
}

class _FeedbackScreenState
    extends State<FeedbackScreen> {
  final TextEditingController _feedbackController =
      TextEditingController();

  void _submitFeedback() {
    if (_feedbackController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please enter your feedback'),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Thank you for your feedback'),
      ),
    );

    _feedbackController.clear();
  }

  @override
  void dispose() {
    _feedbackController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const Icon(
              Icons.feedback_outlined,
              size: 70,
              color: Colors.orange,
            ),

            const SizedBox(height: 20),

            const Text(
              'Share your valuable feedback',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            const Text(
              'Your feedback helps us improve the society '
              'and community experience.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 25),

            TextField(
              controller: _feedbackController,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: 'Write your feedback...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.orange,
                    width: 2,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _submitFeedback,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Submit Feedback',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}