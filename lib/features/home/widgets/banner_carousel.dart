import 'dart:async';
import 'package:flutter/material.dart';

class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key});

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  final PageController _pageController = PageController();

  int _currentPage = 0;

  Timer? _timer;

  final List<String> _bannerImages = [
    'assets/images/home/banner_1.png',
    'assets/images/home/banner_2.jpg',
    'assets/images/home/banner_3.jpg',
    'https://www.medcoenergi.com/uploads/pages/3/1346x390-our-business-banner-x.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (_currentPage < _bannerImages.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (_pageController.hasClients) {
        _pageController.animateToPage(
          _currentPage,
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(9),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(9),
            child: PageView.builder(
              controller: _pageController,
              itemCount: _bannerImages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, index) {
                final String imageSource = _bannerImages[index];

                bool isNetworkImage = imageSource.startsWith('http');

                if (isNetworkImage) {
                  return Image.network(
                    imageSource,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: Colors.grey[200],
                        child: const Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child:
                            const Icon(Icons.broken_image, color: Colors.grey),
                      );
                    },
                  );
                } else {
                  return Image.asset(
                    imageSource,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.image_not_supported,
                            color: Colors.grey),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),

        const SizedBox(height: 5),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(_bannerImages.length, (index) {
            bool isActive = _currentPage == index;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              margin: const EdgeInsets.symmetric(horizontal: 2.5),
              width: isActive ? 23 : 5,
              height: 5,
              decoration: BoxDecoration(
                color: const Color(0xFFF04142),
                borderRadius:
                    BorderRadius.circular(5),
              ),
            );
          }),
        ),
      ],
    );
  }
}
