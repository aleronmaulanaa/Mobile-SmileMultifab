import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BirthdayPopup extends StatefulWidget {
  const BirthdayPopup({super.key});

  @override
  State<BirthdayPopup> createState() => _BirthdayPopupState();
}

class _BirthdayPopupState extends State<BirthdayPopup> {
  int _visibleCount = 6;
  bool _isExpanded = false;

  bool _isOnline = true;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  final List<Map<String, String>> _birthdayList = [
    {
      "name": "Aisah Nurhayati",
      "date": "03 January",
      "img":
          "https://erp-multifab.com/storage//employees/Screen_Shot_2021-03-12_at_09_45_30.png",
    },
    {
      "name": "Erni Susilawati",
      "date": "23 January",
      "img":
          "https://erp-multifab.com/storage//employees/MFG-20241224-1735021410.jpg",
    },
    {
      "name": "Aridhito Bayu Kusnanda",
      "date": "09 January",
      "img": "https://erp-multifab.com/storage//default-user.jpg",
    },
    {
      "name": "Denny",
      "date": "23 January",
      "img":
          "https://erp-multifab.com/storage//employees/MFG-20250102-1735833475.jpg",
    },
    {
      "name": "Basuki Raharjo",
      "date": "02 January",
      "img": "https://erp-multifab.com/storage//default-user.jpg",
    },
    {
      "name": "Wahyu Kencono",
      "date": "30 January",
      "img": "https://erp-multifab.com/storage//default-user.jpg",
    },
    {
      "name": "Anggoro Ari Broto",
      "date": "08 January",
      "img": "https://erp-multifab.com/storage//default-user.jpg",
    },
    {
      "name": "Janter Michelson Lombu",
      "date": "28 January",
      "img": "https://erp-multifab.com/storage//default-user.jpg",
    },
    {
      "name": "Imam Dzikrillah",
      "date": "19 January",
      "img":
          "https://erp-multifab.com/storage//employees/MFG-20250710-1752110475.jpg",
    },
  ];

  @override
  void initState() {
    super.initState();
    _initConnectivity();
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      _updateConnectionStatus(results);
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> _initConnectivity() async {
    late List<ConnectivityResult> results;
    try {
      results = await Connectivity().checkConnectivity();
    } catch (e) {
      return;
    }
    if (!mounted) return;
    _updateConnectionStatus(results);
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.none)) {
      setState(() {
        _isOnline = false;
      });
    } else {
      setState(() {
        _isOnline = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 407),
        padding: const EdgeInsets.fromLTRB(22, 8, 22, 22),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: SvgPicture.asset(
                      'assets/icons/ic_close.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_birthday.svg',
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Birthday This Month!",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 13),

              RichText(
                textAlign: TextAlign.left,
                text: TextSpan(
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF575757),
                    height: 1.2,
                  ),
                  children: [
                    const TextSpan(
                      text:
                          "Celebrate with your friends or colleagues who\nhave birthdays this month! ",
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: SvgPicture.asset(
                        'assets/icons/ic_birthday-cake.svg',
                        width: 19,
                        height: 19,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 23),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _visibleCount > _birthdayList.length
                    ? _birthdayList.length
                    : _visibleCount,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 13,
                  childAspectRatio: 0.80,
                ),
                itemBuilder: (context, index) {
                  final person = _birthdayList[index];
                  return _buildProfileItem(
                    name: person['name']!,
                    date: person['date']!,
                    imageUrl: person['img']!,
                  );
                },
              ),

              if (!_isExpanded && _birthdayList.length > 6) ...[
                const SizedBox(height: 10),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _visibleCount = _birthdayList.length;
                        _isExpanded = true;
                      });
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Lihat Lainnya",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF1F63C7),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileItem({
    required String name,
    required String date,
    required String imageUrl,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 65,
          height: 65,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey,
          ),
          child: ClipOval(
            child: _buildImage(imageUrl),
          ),
        ),
        const SizedBox(height: 13),
        Text(
          name,
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            height: 1.1,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          date,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Color(0xFF575757),
          ),
        ),
      ],
    );
  }

  Widget _buildImage(String url) {
    if (!_isOnline) {
      return Image.asset(
        'assets/images/common/default-user.jpg', 
        fit: BoxFit.cover,
      );
    }

    final String cleanUrl = url.replaceAll(RegExp(r'(?<!:)/{2,}'), '/');

    return Image.network(
      cleanUrl,
      fit: BoxFit.cover,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) return child;
        return AnimatedOpacity(
          opacity: frame == null ? 0 : 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeOut,
          child: child,
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          'assets/images/common/default-user.jpg',
          fit: BoxFit.cover,
        );
      },
    );
  }
}