import 'package:flutter/material.dart';
import 'package:socity_wax/screens/socity_dashbord/profile_screen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  int selectedCategory = 0;

  final List<String> categories = [
    'Political',
    'Association',
    'Local',
  ];

  final List<Map<String, dynamic>> newsList = [
    {
      'category': 'Political',
      'title': 'Community Leadership Meeting Held Successfully',
      'description':
          'Community leaders gathered to discuss upcoming development plans and important matters for society members.',
      'image': 'assets/images/society_wax_logo.jpg',
      'views': '1.2K',
      'time': '1 hour ago',
      'likes': 45,
      'dislikes': 3,
      'comments': 12,
      'liked': false,
      'disliked': false,
    },
    {
      'category': 'Association',
      'title': 'New Association Committee Announced',
      'description':
          'The community association has announced its new committee members for the upcoming year.',
      'image': 'assets/images/society_wax_logo.jpg',
      'views': '856',
      'time': '3 hours ago',
      'likes': 32,
      'dislikes': 2,
      'comments': 8,
      'liked': false,
      'disliked': false,
    },
    {
      'category': 'Local',
      'title': 'Community Cleanliness Campaign',
      'description':
          'Residents participated in a cleanliness campaign to improve the environment and maintain a clean community.',
      'image': 'assets/images/society_wax_logo.jpg',
      'views': '1.5K',
      'time': '5 hours ago',
      'likes': 67,
      'dislikes': 4,
      'comments': 18,
      'liked': false,
      'disliked': false,
    },
    {
      'category': 'Political',
      'title': 'Important Community Discussion',
      'description':
          'An important discussion was held with community representatives regarding future development projects.',
      'image': 'assets/images/society_wax_logo.jpg',
      'views': '932',
      'time': '1 day ago',
      'likes': 39,
      'dislikes': 5,
      'comments': 14,
      'liked': false,
      'disliked': false,
    },
    {
      'category': 'Association',
      'title': 'Annual Association Meeting',
      'description':
          'Members attended the annual association meeting where several important community issues were discussed.',
      'image': 'assets/images/society_wax_logo.jpg',
      'views': '745',
      'time': '1 day ago',
      'likes': 28,
      'dislikes': 2,
      'comments': 9,
      'liked': false,
      'disliked': false,
    },
    {
      'category': 'Local',
      'title': 'Local Sports Event Announced',
      'description':
          'The community has announced a new sports event for residents. Everyone is welcome to participate.',
      'image': 'assets/images/society_wax_logo.jpg',
      'views': '1.1K',
      'time': '2 days ago',
      'likes': 54,
      'dislikes': 1,
      'comments': 21,
      'liked': false,
      'disliked': false,
    },
  ];

  List<Map<String, dynamic>> get filteredNews {
    if (selectedCategory == 0) {
      return newsList;
    }

    final selected = categories[selectedCategory - 1];

    return newsList
        .where(
          (news) => news['category'] == selected,
        )
        .toList();
  }

  // ==========================================================
  // LIKE
  // ==========================================================

  void _likeNews(int index) {
    final news = filteredNews[index];

    setState(() {
      if (news['liked'] == true) {
        news['liked'] = false;
        news['likes']--;
      } else {
        news['liked'] = true;
        news['likes']++;

        if (news['disliked'] == true) {
          news['disliked'] = false;
          news['dislikes']--;
        }
      }
    });
  }

  // ==========================================================
  // DISLIKE
  // ==========================================================

  void _dislikeNews(int index) {
    final news = filteredNews[index];

    setState(() {
      if (news['disliked'] == true) {
        news['disliked'] = false;
        news['dislikes']--;
      } else {
        news['disliked'] = true;
        news['dislikes']++;

        if (news['liked'] == true) {
          news['liked'] = false;
          news['likes']--;
        }
      }
    });
  }

  // ==========================================================
  // SEARCH
  // ==========================================================

  void _openSearch() {
    showSearch(
      context: context,
      delegate: NewsSearchDelegate(newsList),
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

        title: const Text(
          'News',
          style: TextStyle(
            color: Colors.black,
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          // Search
          IconButton(
            onPressed: _openSearch,
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),

          const SizedBox(width: 5),

          // Profile
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const ProfileScreen(),
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

      body: Column(
        children: [
          // ==================================================
          // CATEGORY BUTTONS
          // ==================================================

          Container(
            width: double.infinity,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 15,
            ),

            child: SizedBox(
              height: 42,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final isSelected =
                      selectedCategory == index + 1;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategory = index + 1;
                      });
                    },

                    child: Container(
                      margin: const EdgeInsets.only(
                        right: 10,
                      ),

                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),

                      decoration: BoxDecoration(
                        color: isSelected
                            ? Colors.orange
                            : Colors.white,

                        borderRadius:
                            BorderRadius.circular(22),

                        border: Border.all(
                          color: Colors.orange,
                        ),
                      ),

                      alignment: Alignment.center,

                      child: Text(
                        categories[index],
                        style: TextStyle(
                          color: isSelected
                              ? Colors.white
                              : Colors.orange,

                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // ==================================================
          // NEWS LIST
          // ==================================================

          Expanded(
            child: filteredNews.isEmpty
                ? const Center(
                    child: Text(
                      'No news available',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: filteredNews.length,

                    itemBuilder: (context, index) {
                      return _buildNewsCard(
                        filteredNews[index],
                        index,
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // NEWS CARD
  // ==========================================================

  Widget _buildNewsCard(
    Map<String, dynamic> news,
    int index,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 18),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),

        border: Border.all(
          color: Colors.grey.shade200,
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ==================================================
          // NEWS IMAGE
          // ==================================================

          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),

            child: Image.asset(
              news['image'],
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,

              errorBuilder:
                  (context, error, stackTrace) {
                return Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey.shade200,
                  child: const Icon(
                    Icons.image_not_supported,
                    size: 50,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),

          // ==================================================
          // CONTENT
          // ==================================================

          Padding(
            padding: const EdgeInsets.all(15),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [
                // Category
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.orange
                        .withOpacity(0.1),

                    borderRadius:
                        BorderRadius.circular(15),
                  ),

                  child: Text(
                    news['category'],
                    style: const TextStyle(
                      color: Colors.orange,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Title
                Text(
                  news['title'],
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                // Description
                Text(
                  news['description'],
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 15),

                // Views and Time
                Row(
                  children: [
                    const Icon(
                      Icons.remove_red_eye_outlined,
                      size: 17,
                      color: Colors.grey,
                    ),

                    const SizedBox(width: 5),

                    Text(
                      '${news['views']} views',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),

                    const SizedBox(width: 15),

                    const Icon(
                      Icons.access_time,
                      size: 17,
                      color: Colors.grey,
                    ),

                    const SizedBox(width: 5),

                    Text(
                      news['time'],
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                Divider(
                  color: Colors.grey.shade200,
                ),

                const SizedBox(height: 5),

                // ==================================================
                // LIKE / DISLIKE / COMMENT
                // ==================================================

                Row(
                  children: [
                    // Like
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _likeNews(index);
                        },

                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center,

                          children: [
                            Icon(
                              news['liked'] == true
                                  ? Icons.thumb_up
                                  : Icons
                                      .thumb_up_outlined,

                              size: 20,

                              color: news['liked'] == true
                                  ? Colors.orange
                                  : Colors.grey,
                            ),

                            const SizedBox(width: 6),

                            Text(
                              '${news['likes']}',
                              style: TextStyle(
                                color:
                                    news['liked'] == true
                                        ? Colors.orange
                                        : Colors.grey,

                                fontWeight:
                                    FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Vertical Divider
                    Container(
                      height: 25,
                      width: 1,
                      color: Colors.grey.shade300,
                    ),

                    // Dislike
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _dislikeNews(index);
                        },

                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center,

                          children: [
                            Icon(
                              news['disliked'] == true
                                  ? Icons.thumb_down
                                  : Icons
                                      .thumb_down_outlined,

                              size: 20,

                              color:
                                  news['disliked'] == true
                                      ? Colors.orange
                                      : Colors.grey,
                            ),

                            const SizedBox(width: 6),

                            Text(
                              '${news['dislikes']}',
                              style: TextStyle(
                                color:
                                    news['disliked'] == true
                                        ? Colors.orange
                                        : Colors.grey,

                                fontWeight:
                                    FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Vertical Divider
                    Container(
                      height: 25,
                      width: 1,
                      color: Colors.grey.shade300,
                    ),

                    // Comment
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _showCommentDialog(news);
                        },

                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment.center,

                          children: [
                            const Icon(
                              Icons
                                  .chat_bubble_outline,
                              size: 20,
                              color: Colors.grey,
                            ),

                            const SizedBox(width: 6),

                            Text(
                              '${news['comments']}',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontWeight:
                                    FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // COMMENT DIALOG
  // ==========================================================

  void _showCommentDialog(
    Map<String, dynamic> news,
  ) {
    final TextEditingController controller =
        TextEditingController();

    showDialog(
      context: context,

      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Add Comment',
          ),

          content: TextField(
            controller: controller,
            maxLines: 3,

            decoration: InputDecoration(
              hintText: 'Write your comment...',
              border: OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(10),
              ),
              focusedBorder:
                  OutlineInputBorder(
                borderRadius:
                    BorderRadius.circular(10),
                borderSide:
                    const BorderSide(
                  color: Colors.orange,
                ),
              ),
            ),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },

              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                if (controller.text
                    .trim()
                    .isEmpty) {
                  return;
                }

                setState(() {
                  news['comments']++;
                });

                Navigator.pop(context);

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Comment added successfully',
                    ),
                  ),
                );
              },

              style:
                  ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.orange,
                foregroundColor:
                    Colors.white,
              ),

              child: const Text(
                'Comment',
              ),
            ),
          ],
        );
      },
    );
  }
}

// ============================================================
// NEWS SEARCH DELEGATE
// ============================================================

class NewsSearchDelegate
    extends SearchDelegate<String> {
  final List<Map<String, dynamic>> newsList;

  NewsSearchDelegate(this.newsList);

  @override
  List<Widget>? buildActions(
    BuildContext context,
  ) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },

        icon: const Icon(
          Icons.clear,
        ),
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

      icon: const Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(
    BuildContext context,
  ) {
    return _buildSearchResults();
  }

  @override
  Widget buildSuggestions(
    BuildContext context,
  ) {
    return _buildSearchResults();
  }

  Widget _buildSearchResults() {
    final results = newsList.where((news) {
      final title =
          news['title'].toString().toLowerCase();

      final category =
          news['category'].toString().toLowerCase();

      final description =
          news['description'].toString().toLowerCase();

      final search =
          query.toLowerCase();

      return title.contains(search) ||
          category.contains(search) ||
          description.contains(search);
    }).toList();

    if (results.isEmpty) {
      return const Center(
        child: Text(
          'No news found',
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: results.length,

      itemBuilder: (context, index) {
        final news = results[index];

        return Card(
          margin:
              const EdgeInsets.only(bottom: 12),

          child: ListTile(
            contentPadding:
                const EdgeInsets.all(10),

            leading: ClipRRect(
              borderRadius:
                  BorderRadius.circular(8),

              child: Image.asset(
                news['image'],
                width: 65,
                height: 65,
                fit: BoxFit.cover,

                errorBuilder:
                    (context, error, stackTrace) {
                  return Container(
                    width: 65,
                    height: 65,
                    color: Colors.grey.shade200,
                    child: const Icon(
                      Icons.image,
                      color: Colors.grey,
                    ),
                  );
                },
              ),
            ),

            title: Text(
              news['title'],
              maxLines: 2,
              overflow:
                  TextOverflow.ellipsis,

              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: Padding(
              padding:
                  const EdgeInsets.only(
                top: 5,
              ),

              child: Text(
                '${news['category']} • ${news['time']}',
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}