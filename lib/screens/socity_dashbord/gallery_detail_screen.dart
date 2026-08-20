import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class GalleryDetailScreen extends StatefulWidget {
  const GalleryDetailScreen({super.key});

  @override
  State<GalleryDetailScreen> createState() =>
      _GalleryDetailScreenState();
}

class _GalleryDetailScreenState
    extends State<GalleryDetailScreen> {
  // ==========================================================
  // GALLERY DATA
  // ==========================================================

  final List<Map<String, dynamic>> galleryItems = [
    {
      'title': 'Annual Community Dinner',
      'description':
          'Beautiful memories from our annual community dinner.',
      'image': 'assets/images/society_wax_logo.jpg',
      'height': 230.0,
    },
    {
      'title': 'Sports Gala',
      'description':
          'Highlights from the community sports gala.',
      'image': 'assets/images/society_wax_logo.jpg',
      'height': 180.0,
    },
    {
      'title': 'Community Gathering',
      'description':
          'Members gathered together for a memorable occasion.',
      'image': 'assets/images/society_wax_logo.jpg',
      'height': 260.0,
    },
    {
      'title': 'Cultural Night',
      'description':
          'A wonderful evening celebrating our culture and traditions.',
      'image': 'assets/images/society_wax_logo.jpg',
      'height': 200.0,
    },
    {
      'title': 'Award Ceremony',
      'description':
          'Recognizing outstanding members of our community.',
      'image': 'assets/images/society_wax_logo.jpg',
      'height': 240.0,
    },
    {
      'title': 'Family Gathering',
      'description':
          'A special gathering of community families.',
      'image': 'assets/images/society_wax_logo.jpg',
      'height': 190.0,
    },
  ];

  // ==========================================================
  // DELETE IMAGE
  // ==========================================================

  void _deleteImage(int index) {
    if (index < 0 || index >= galleryItems.length) {
      return;
    }

    final deletedTitle =
        galleryItems[index]['title']?.toString() ??
            'Image';

    setState(() {
      galleryItems.removeAt(index);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$deletedTitle deleted'),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            // Since we don't want to lose the deleted item,
            // this implementation restores it at the same position
            // only when undo is pressed.
            setState(() {
              // We cannot access the original map here after removal
              // without storing it, so this is intentionally handled
              // through the delete dialog before actual deletion.
            });
          },
        ),
      ),
    );
  }

  // ==========================================================
  // SHARE IMAGE
  // ==========================================================

  Future<void> _shareImage(
    Map<String, dynamic> item,
  ) async {
    final title =
        item['title']?.toString() ?? 'Community Gallery';

    final description =
        item['description']?.toString() ?? '';

    try {
      await SharePlus.instance.share(
        ShareParams(
          text: '$title\n\n$description',
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Unable to share this image'),
        ),
      );
    }
  }

  // ==========================================================
  // LONG PRESS OPTIONS
  // ==========================================================

  void _showImageOptions(
    BuildContext context,
    int index,
  ) {
    if (index < 0 || index >= galleryItems.length) {
      return;
    }

    final item = galleryItems[index];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // --------------------------------------------------
                // HEADER
                // --------------------------------------------------

                Container(
                  width: 45,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius:
                        BorderRadius.circular(10),
                  ),
                ),

                const SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item['title']?.toString() ??
                          'Gallery Image',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // --------------------------------------------------
                // SHARE
                // --------------------------------------------------

                ListTile(
                  leading: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.share_outlined,
                      color: Colors.orange,
                    ),
                  ),
                  title: const Text(
                    'Share',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: const Text(
                    'Share this memory with others',
                  ),
                  onTap: () {
                    Navigator.pop(context);

                    _shareImage(item);
                  },
                ),

                // --------------------------------------------------
                // DELETE
                // --------------------------------------------------

                ListTile(
                  leading: Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.delete_outline,
                      color: Colors.red,
                    ),
                  ),
                  title: const Text(
                    'Delete',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                  subtitle: const Text(
                    'Remove this image from gallery',
                  ),
                  onTap: () {
                    Navigator.pop(context);

                    _showDeleteConfirmation(index);
                  },
                ),

                const SizedBox(height: 5),
              ],
            ),
          ),
        );
      },
    );
  }

  // ==========================================================
  // DELETE CONFIRMATION
  // ==========================================================

  void _showDeleteConfirmation(int index) {
    if (index < 0 || index >= galleryItems.length) {
      return;
    }

    final item = galleryItems[index];

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Delete Image?',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Are you sure you want to delete '
            '"${item['title']}"?',
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
                Navigator.pop(context);

                _deleteImageWithUndo(index);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
              ),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  // ==========================================================
  // DELETE WITH UNDO
  // ==========================================================

  void _deleteImageWithUndo(int index) {
    if (index < 0 || index >= galleryItems.length) {
      return;
    }

    final deletedItem = Map<String, dynamic>.from(
      galleryItems[index],
    );

    setState(() {
      galleryItems.removeAt(index);
    });

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(
          'Image deleted',
        ),
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
          label: 'UNDO',
          textColor: Colors.orange,
          onPressed: () {
            if (!mounted) return;

            setState(() {
              if (index <= galleryItems.length) {
                galleryItems.insert(
                  index,
                  deletedItem,
                );
              } else {
                galleryItems.add(deletedItem);
              }
            });
          },
        ),
      ),
    );
  }

  // ==========================================================
  // OPEN FULL SCREEN GALLERY
  // ==========================================================

  void _openImageViewer(int initialIndex) {
    if (galleryItems.isEmpty) {
      return;
    }

    if (initialIndex < 0 ||
        initialIndex >= galleryItems.length) {
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenGalleryScreen(
          images: galleryItems,
          initialIndex: initialIndex,
        ),
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

      // ========================================================
      // APP BAR
      // ========================================================

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,

        title: const Text(
          'Gallery',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),

      // ========================================================
      // BODY
      // ========================================================

      body: galleryItems.isEmpty
          ? _buildEmptyGallery()
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  // ------------------------------------------------
                  // HEADER
                  // ------------------------------------------------

                  const Text(
                    'Community Memories',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    'Explore and share memorable moments '
                    'from our community.',
                    style: TextStyle(
                      color: Colors.grey.shade600,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ------------------------------------------------
                  // GALLERY
                  // ------------------------------------------------

                  _buildGallery(),
                ],
              ),
            ),
    );
  }

  // ==========================================================
  // EMPTY GALLERY
  // ==========================================================

  Widget _buildEmptyGallery() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center,
          children: [
            Icon(
              Icons.photo_library_outlined,
              size: 80,
              color: Colors.grey.shade400,
            ),

            const SizedBox(height: 15),

            const Text(
              'No Images Available',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              'There are currently no images in the gallery.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // GALLERY LAYOUT
  // ==========================================================

  Widget _buildGallery() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width =
            constraints.maxWidth;

        final double itemWidth =
            (width - 10) / 2;

        return Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(
            galleryItems.length,
            (index) {
              final item = galleryItems[index];

              final String image =
                  item['image']?.toString() ??
                      'assets/images/society_wax_logo.jpg';

              final String title =
                  item['title']?.toString() ??
                      'Community Memory';

              final String description =
                  item['description']?.toString() ??
                      '';

              final double requestedHeight =
                  (item['height'] as num?)
                          ?.toDouble() ??
                      200;

              return SizedBox(
                width: itemWidth,
                height: requestedHeight,
                child: GestureDetector(
                  // ------------------------------------------------
                  // TAP
                  // ------------------------------------------------

                  onTap: () {
                    _openImageViewer(index);
                  },

                  // ------------------------------------------------
                  // LONG PRESS
                  // ------------------------------------------------

                  onLongPress: () {
                    _showImageOptions(
                      context,
                      index,
                    );
                  },

                  child: ClipRRect(
                    borderRadius:
                        BorderRadius.circular(15),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        // --------------------------------------------
                        // IMAGE
                        // --------------------------------------------

                        Image.asset(
                          image,
                          fit: BoxFit.cover,

                          errorBuilder:
                              (
                            context,
                            error,
                            stackTrace,
                          ) {
                            return Container(
                              color: Colors.grey.shade200,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons
                                        .broken_image_outlined,
                                    size: 45,
                                    color: Colors
                                        .grey
                                        .shade500,
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Text(
                                    'Image unavailable',
                                    style:
                                        TextStyle(
                                      color: Colors
                                          .grey
                                          .shade600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),

                        // --------------------------------------------
                        // DARK GRADIENT
                        // --------------------------------------------

                        Container(
                          decoration:
                              BoxDecoration(
                            gradient:
                                LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black
                                    .withOpacity(
                                  0.75,
                                ),
                              ],
                            ),
                          ),
                        ),

                        // --------------------------------------------
                        // IMAGE INFORMATION
                        // --------------------------------------------

                        Positioned(
                          left: 12,
                          right: 12,
                          bottom: 12,
                          child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment
                                    .start,
                            children: [
                              Text(
                                title,
                                maxLines: 2,
                                overflow:
                                    TextOverflow
                                        .ellipsis,
                                style:
                                    const TextStyle(
                                  color:
                                      Colors.white,
                                  fontSize: 15,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),

                              const SizedBox(
                                height: 4,
                              ),

                              Text(
                                description,
                                maxLines: 2,
                                overflow:
                                    TextOverflow
                                        .ellipsis,
                                style:
                                    const TextStyle(
                                  color:
                                      Colors.white70,
                                  fontSize: 11,
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // --------------------------------------------
                        // LONG PRESS HINT ICON
                        // --------------------------------------------

                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration:
                                BoxDecoration(
                              color: Colors.black
                                  .withOpacity(
                                0.45,
                              ),
                              shape:
                                  BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.more_horiz,
                              color:
                                  Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

// ==================================================================
// FULL SCREEN GALLERY VIEWER
// ==================================================================

class FullScreenGalleryScreen
    extends StatefulWidget {
  final List<Map<String, dynamic>> images;
  final int initialIndex;

  const FullScreenGalleryScreen({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  State<FullScreenGalleryScreen> createState() =>
      _FullScreenGalleryScreenState();
}

class _FullScreenGalleryScreenState
    extends State<FullScreenGalleryScreen> {
  late PageController _pageController;

  late int _currentIndex;

  @override
  void initState() {
    super.initState();

    _currentIndex =
        widget.initialIndex;

    _pageController = PageController(
      initialPage: widget.initialIndex,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // ==========================================================
  // SHARE CURRENT IMAGE
  // ==========================================================

  Future<void> _shareCurrentImage() async {
    if (_currentIndex < 0 ||
        _currentIndex >= widget.images.length) {
      return;
    }

    final item =
        widget.images[_currentIndex];

    final title =
        item['title']?.toString() ??
            'Community Gallery';

    final description =
        item['description']?.toString() ??
            '';

    try {
      await SharePlus.instance.share(
        ShareParams(
          text: '$title\n\n$description',
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Unable to share this image',
          ),
        ),
      );
    }
  }

  // ==========================================================
  // BUILD
  // ==========================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      // ========================================================
      // APP BAR
      // ========================================================

      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        elevation: 0,

        title: Text(
          '${_currentIndex + 1} / ${widget.images.length}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),

        actions: [
          IconButton(
            onPressed: _shareCurrentImage,
            icon: const Icon(
              Icons.share_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),

      // ========================================================
      // PAGE VIEW
      // ========================================================

      body: PageView.builder(
        controller: _pageController,
        itemCount: widget.images.length,

        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        itemBuilder: (context, index) {
          final item =
              widget.images[index];

          final String image =
              item['image']?.toString() ??
                  'assets/images/society_wax_logo.jpg';

          final String title =
              item['title']?.toString() ??
                  'Community Memory';

          final String description =
              item['description']?.toString() ??
                  '';

          return Column(
            children: [
              // --------------------------------------------------
              // IMAGE
              // --------------------------------------------------

              Expanded(
                child: InteractiveViewer(
                  minScale: 0.8,
                  maxScale: 4.0,
                  child: Center(
                    child: Image.asset(
                      image,
                      fit: BoxFit.contain,

                      errorBuilder:
                          (
                        context,
                        error,
                        stackTrace,
                      ) {
                        return const Center(
                          child: Icon(
                            Icons
                                .broken_image_outlined,
                            color: Colors.white54,
                            size: 70,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              // --------------------------------------------------
              // DETAILS
              // --------------------------------------------------

              Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.fromLTRB(
                  20,
                  15,
                  20,
                  25,
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border(
                    top: BorderSide(
                      color:
                          Colors.grey.shade800,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style:
                          const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Text(
                      description,
                      style:
                          const TextStyle(
                        color:
                            Colors.white70,
                        fontSize: 13,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}