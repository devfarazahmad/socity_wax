// import 'package:flutter/material.dart';
// import 'package:share_plus/share_plus.dart';

// class GalleryImageViewerScreen extends StatefulWidget {
//   final List<Map<String, String>> images;
//   final int initialIndex;

//   const GalleryImageViewerScreen({
//     super.key,
//     required this.images,
//     required this.initialIndex,
//   });

//   @override
//   State<GalleryImageViewerScreen> createState() =>
//       _GalleryImageViewerScreenState();
// }

// class _GalleryImageViewerScreenState
//     extends State<GalleryImageViewerScreen> {
//   late List<Map<String, String>> _images;

//   late PageController _pageController;

//   late int _currentIndex;

//   @override
//   void initState() {
//     super.initState();

//     _images = List<Map<String, String>>.from(
//       widget.images,
//     );

//     _currentIndex = widget.initialIndex;

//     _pageController = PageController(
//       initialPage: widget.initialIndex,
//     );
//   }

//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }

//   // ==========================================================
//   // DELETE IMAGE
//   // ==========================================================

//   void _deleteImage(int index) {
//     if (_images.length == 1) {
//       Navigator.pop(context);
//       return;
//     }

//     setState(() {
//       _images.removeAt(index);

//       if (_currentIndex >= _images.length) {
//         _currentIndex = _images.length - 1;
//       }
//     });

//     _pageController.jumpToPage(
//       _currentIndex,
//     );

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('Image deleted'),
//       ),
//     );
//   }

//   // ==========================================================
//   // SHARE IMAGE
//   // ==========================================================

//   Future<void> _shareImage(
//     Map<String, String> image,
//   ) async {
//     try {
//       await SharePlus.instance.share(
//         ShareParams(
//           text:
//               '${image['title']}\n\n${image['description']}',
//         ),
//       );
//     } catch (e) {
//       if (!mounted) return;

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text(
//             'Unable to share image',
//           ),
//         ),
//       );
//     }
//   }

//   // ==========================================================
//   // LONG PRESS MENU
//   // ==========================================================

//   void _showImageOptions(int index) {
//     showModalBottomSheet(
//       context: context,

//       backgroundColor: Colors.white,

//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(
//           top: Radius.circular(20),
//         ),
//       ),

//       builder: (context) {
//         return SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(20),

//             child: Column(
//               mainAxisSize: MainAxisSize.min,

//               children: [
//                 // ==================================================
//                 // TITLE
//                 // ==================================================

//                 Text(
//                   _images[index]['title'] ?? 'Image',
//                   style: const TextStyle(
//                     fontSize: 19,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),

//                 const SizedBox(height: 20),

//                 // ==================================================
//                 // SHARE
//                 // ==================================================

//                 ListTile(
//                   leading: const Icon(
//                     Icons.share_outlined,
//                     color: Colors.orange,
//                   ),

//                   title: const Text(
//                     'Share',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),

//                   onTap: () {
//                     Navigator.pop(context);

//                     _shareImage(
//                       _images[index],
//                     );
//                   },
//                 ),

//                 // ==================================================
//                 // DELETE
//                 // ==================================================

//                 ListTile(
//                   leading: const Icon(
//                     Icons.delete_outline,
//                     color: Colors.red,
//                   ),

//                   title: const Text(
//                     'Delete',
//                     style: TextStyle(
//                       color: Colors.red,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),

//                   onTap: () {
//                     Navigator.pop(context);

//                     _showDeleteConfirmation(
//                       index,
//                     );
//                   },
//                 ),

//                 const SizedBox(height: 5),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   // ==========================================================
//   // DELETE CONFIRMATION
//   // ==========================================================

//   void _showDeleteConfirmation(int index) {
//     showDialog(
//       context: context,

//       builder: (context) {
//         return AlertDialog(
//           title: const Text(
//             'Delete Image',
//           ),

//           content: const Text(
//             'Are you sure you want to delete this image?',
//           ),

//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },

//               child: const Text(
//                 'Cancel',
//                 style: TextStyle(
//                   color: Colors.grey,
//                 ),
//               ),
//             ),

//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);

//                 _deleteImage(index);
//               },

//               child: const Text(
//                 'Delete',
//                 style: TextStyle(
//                   color: Colors.red,
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   // ==========================================================
//   // BUILD
//   // ==========================================================

//   @override
//   Widget build(BuildContext context) {
//     if (_images.isEmpty) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text(
//             'Gallery',
//           ),
//         ),

//         body: const Center(
//           child: Text(
//             'No images available',
//           ),
//         ),
//       );
//     }

//     return Scaffold(
//       backgroundColor: Colors.black,

//       appBar: AppBar(
//         backgroundColor: Colors.black,

//         foregroundColor: Colors.white,

//         title: Text(
//           '${_currentIndex + 1} / ${_images.length}',

//           style: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),

//       body: Column(
//         children: [
//           // ======================================================
//           // IMAGE VIEWER
//           // ======================================================

//           Expanded(
//             child: PageView.builder(
//               controller: _pageController,

//               itemCount: _images.length,

//               onPageChanged: (index) {
//                 setState(() {
//                   _currentIndex = index;
//                 });
//               },

//               itemBuilder: (context, index) {
//                 final image = _images[index];

//                 return GestureDetector(
//                   onLongPress: () {
//                     _showImageOptions(index);
//                   },

//                   child: InteractiveViewer(
//                     minScale: 1,
//                     maxScale: 4,

//                     child: Center(
//                       child: Image.asset(
//                         image['image']!,

//                         fit: BoxFit.contain,

//                         width: double.infinity,
//                       ),
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),

//           // ======================================================
//           // IMAGE INFORMATION
//           // ======================================================

//           Container(
//             width: double.infinity,

//             padding: const EdgeInsets.fromLTRB(
//               20,
//               15,
//               20,
//               20,
//             ),

//             decoration: const BoxDecoration(
//               color: Colors.black,
//             ),

//             child: Column(
//               crossAxisAlignment:
//                   CrossAxisAlignment.start,

//               children: [
//                 Text(
//                   _images[_currentIndex]['title'] ?? '',

//                   style: const TextStyle(
//                     color: Colors.white,
//                     fontSize: 19,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),

//                 const SizedBox(height: 6),

//                 Text(
//                   _images[_currentIndex]
//                           ['description'] ??
//                       '',

//                   style: const TextStyle(
//                     color: Colors.white70,
//                     fontSize: 14,
//                     height: 1.4,
//                   ),
//                 ),

//                 const SizedBox(height: 10),

//                 const Text(
//                   'Long press the image for more options',

//                   style: TextStyle(
//                     color: Colors.white54,
//                     fontSize: 12,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }





import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class GalleryImageViewerScreen extends StatefulWidget {
  final List<Map<String, String>> images;
  final int initialIndex;

  const GalleryImageViewerScreen({
    super.key,
    required this.images,
    required this.initialIndex,
  });

  @override
  State<GalleryImageViewerScreen> createState() =>
      _GalleryImageViewerScreenState();
}

class _GalleryImageViewerScreenState
    extends State<GalleryImageViewerScreen> {
  late List<Map<String, String>> _images;

  late PageController _pageController;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    // Make a copy so deleting images does not modify
    // the original gallery list.
    _images = List<Map<String, String>>.from(widget.images);

    if (_images.isEmpty) {
      _currentIndex = 0;
    } else {
      // Make sure initialIndex is always valid.
      if (widget.initialIndex < 0) {
        _currentIndex = 0;
      } else if (widget.initialIndex >= _images.length) {
        _currentIndex = _images.length - 1;
      } else {
        _currentIndex = widget.initialIndex;
      }
    }

    _pageController = PageController(
      initialPage: _currentIndex,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // ==========================================================
  // DELETE IMAGE
  // ==========================================================

  void _deleteImage(int index) {
    if (_images.isEmpty) {
      return;
    }

    // If only one image exists, close the screen.
    if (_images.length == 1) {
      Navigator.pop(context);
      return;
    }

    setState(() {
      _images.removeAt(index);

      // Keep current index valid.
      if (_currentIndex >= _images.length) {
        _currentIndex = _images.length - 1;
      }

      if (_currentIndex < 0) {
        _currentIndex = 0;
      }
    });

    // Move PageView to the valid page.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted || _images.isEmpty) {
        return;
      }

      if (_pageController.hasClients) {
        _pageController.jumpToPage(_currentIndex);
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Image deleted'),
      ),
    );
  }

  // ==========================================================
  // SHARE IMAGE
  // ==========================================================

  Future<void> _shareImage(
    Map<String, String> image,
  ) async {
    try {
      final String title =
          image['title']?.trim().isNotEmpty == true
              ? image['title']!
              : 'Gallery Image';

      final String description =
          image['description']?.trim().isNotEmpty == true
              ? image['description']!
              : 'Shared from Society Wax';

      await SharePlus.instance.share(
        ShareParams(
          text: '$title\n\n$description',
        ),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Unable to share image'),
        ),
      );
    }
  }

  // ==========================================================
  // LONG PRESS MENU
  // ==========================================================

  void _showImageOptions(int index) {
    if (index < 0 || index >= _images.length) {
      return;
    }

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (context) {
        final image = _images[index];

        final String title =
            image['title']?.trim().isNotEmpty == true
                ? image['title']!
                : 'Gallery Image';

        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ==================================================
                // TITLE
                // ==================================================

                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                // ==================================================
                // SHARE
                // ==================================================

                ListTile(
                  leading: const Icon(
                    Icons.share_outlined,
                    color: Colors.orange,
                  ),
                  title: const Text(
                    'Share',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);

                    _shareImage(image);
                  },
                ),

                // ==================================================
                // DELETE
                // ==================================================

                ListTile(
                  leading: const Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                  title: const Text(
                    'Delete',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w600,
                    ),
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
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'Delete Image',
          ),
          content: const Text(
            'Are you sure you want to delete this image?',
          ),
          actions: [
            // CANCEL
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

            // DELETE
            TextButton(
              onPressed: () {
                Navigator.pop(context);

                _deleteImage(index);
              },
              child: const Text(
                'Delete',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  // ==========================================================
  // SAFE IMAGE PATH
  // ==========================================================

  String _getImagePath(
    Map<String, String> image,
  ) {
    final String? path = image['image'];

    if (path == null || path.trim().isEmpty) {
      return 'assets/images/society_wax_logo.jpg';
    }

    return path;
  }

  // ==========================================================
  // BUILD
  // ==========================================================

  @override
  Widget build(BuildContext context) {
    // ========================================================
    // NO IMAGES
    // ========================================================

    if (_images.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Gallery',
          ),
        ),
        body: const Center(
          child: Text(
            'No images available',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ),
      );
    }

    // Make sure current index is valid.
    if (_currentIndex >= _images.length) {
      _currentIndex = _images.length - 1;
    }

    if (_currentIndex < 0) {
      _currentIndex = 0;
    }

    final Map<String, String> currentImage =
        _images[_currentIndex];

    final String currentTitle =
        currentImage['title']?.trim().isNotEmpty == true
            ? currentImage['title']!
            : 'Gallery Image';

    final String currentDescription =
        currentImage['description']?.trim().isNotEmpty == true
            ? currentImage['description']!
            : 'Society Wax community gallery';

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
          '${_currentIndex + 1} / ${_images.length}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),

        actions: [
          // Share current image
          IconButton(
            onPressed: () {
              _shareImage(currentImage);
            },
            icon: const Icon(
              Icons.share_outlined,
              color: Colors.white,
            ),
          ),

          // Delete current image
          IconButton(
            onPressed: () {
              _showDeleteConfirmation(
                _currentIndex,
              );
            },
            icon: const Icon(
              Icons.delete_outline,
              color: Colors.white,
            ),
          ),
        ],
      ),

      // ========================================================
      // BODY
      // ========================================================

      body: Column(
        children: [
          // ====================================================
          // IMAGE VIEWER
          // ====================================================

          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: _images.length,

              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },

              itemBuilder: (context, index) {
                final Map<String, String> image =
                    _images[index];

                final String imagePath =
                    _getImagePath(image);

                return GestureDetector(
                  // Long press opens Share/Delete menu
                  onLongPress: () {
                    _showImageOptions(index);
                  },

                  child: InteractiveViewer(
                    minScale: 1.0,
                    maxScale: 4.0,

                    child: Center(
                      child: Image.asset(
                        imagePath,

                        fit: BoxFit.contain,

                        width: double.infinity,

                        // Error handling if asset path
                        // is incorrect.
                        errorBuilder:
                            (
                              context,
                              error,
                              stackTrace,
                            ) {
                          return const Column(
                            mainAxisAlignment:
                                MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.broken_image_outlined,
                                color: Colors.white54,
                                size: 60,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'Unable to load image',
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // ====================================================
          // IMAGE INFORMATION
          // ====================================================

          Container(
            width: double.infinity,

            padding: const EdgeInsets.fromLTRB(
              20,
              15,
              20,
              20,
            ),

            decoration: const BoxDecoration(
              color: Colors.black,
            ),

            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                // ==================================================
                // TITLE
                // ==================================================

                Text(
                  currentTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                // ==================================================
                // DESCRIPTION
                // ==================================================

                Text(
                  currentDescription,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),

                const SizedBox(height: 10),

                // ==================================================
                // INSTRUCTION
                // ==================================================

                const Text(
                  'Long press the image for more options',
                  style: TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
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