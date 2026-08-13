import 'package:flutter/material.dart';

class CommunitySelectionScreen extends StatefulWidget {
  const CommunitySelectionScreen({super.key});

  @override
  State<CommunitySelectionScreen> createState() =>
      _CommunitySelectionScreenState();
}

class _CommunitySelectionScreenState
    extends State<CommunitySelectionScreen> {
  int? selectedCommunity;

  final List<String> communities = [
    'Hayatian Community',
    'Software Engineering Community',
    'Computer Science Community',
    'Business Community',
    'Sports Community',
    'Literature Community',
  ];

  void _continue() {
    if (selectedCommunity == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select a community'),
        ),
      );
      return;
    }

    // Later we will navigate to the Community/Home screen.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Selected: ${communities[selectedCommunity!]}',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Selection'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(24.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            // Title
            const Center(
              child: Text(
                'Select Community',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Description
            const Center(
              child: Text(
                'Choose a community to continue',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Communities
            Expanded(
              child: ListView.builder(
                itemCount: communities.length,
                itemBuilder: (context, index) {
                  final bool isSelected =
                      selectedCommunity == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCommunity = index;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        bottom: 15,
                      ),
                      padding: const EdgeInsets.all(16),

                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.orange.withOpacity(0.1)
                            : Colors.white,

                        borderRadius:
                            BorderRadius.circular(12),

                        border: Border.all(
                          color: isSelected
                              ? Colors.orange
                              : Colors.grey.shade300,

                          width: isSelected ? 2 : 1,
                        ),
                      ),

                      child: Row(
                        children: [
                          // Community Image/Icon
                          Container(
                            width: 55,
                            height: 55,

                            decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius:
                                  BorderRadius.circular(10),
                            ),

                            child: const Icon(
                              Icons.groups,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),

                          const SizedBox(width: 15),

                          // Community Name
                          Expanded(
                            child: Text(
                              communities[index],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          // Selection Indicator
                          Container(
                            width: 24,
                            height: 24,

                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? Colors.orange
                                    : Colors.grey,
                                width: 2,
                              ),
                              color: isSelected
                                  ? Colors.orange
                                  : Colors.transparent,
                            ),

                            child: isSelected
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 16,
                                  )
                                : null,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 15),

            // Continue Button
            SizedBox(
              width: double.infinity,
              height: 50,

              child: ElevatedButton(
                onPressed: _continue,

                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                ),

                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}