import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_smile_multifab/features/profile/widgets/account_info_card.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool _isOnline = true;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

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

  void _copyToClipboard(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Berhasil menyalin: $text"),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final String photoUrl =
        "https://scontent-cgk2-1.cdninstagram.com/v/t51.2885-19/583200018_18367273294084132_5580250522120237473_n.jpg?efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4xMDgwLmMyIn0&_nc_ht=scontent-cgk2-1.cdninstagram.com&_nc_cat=104&_nc_oc=Q6cZ2QH_StjD6RoNLsmif92M8IDCvWDL1NbIIu5u_1LkwLeqRqAhSsvB5EPUysGa4FWJEAY&_nc_ohc=BFSq9vY9zXYQ7kNvwG9LaaB&_nc_gid=7uOW328noKvLAHfgky-zLg&edm=ALGbJPMBAAAA&ccb=7-5&oh=00_AfrLLe2DYfmI4M2SEVGnYPMO227KLgww5m2x3Fatv2gmzw&oe=697CB30F&_nc_sid=7d3ac5";

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFFF3F4F6),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              height: 126,
              color: const Color(0xFF991B1C),
              padding: const EdgeInsets.only(bottom: 17, left: 24, right: 24),
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(
                      'assets/icons/ic_arrow_left_white.svg',
                      width: 27,
                      height: 27,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Your Profile',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 27),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 37),
                    Container(
                      width: 384,
                      height: 249,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(21),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: const Offset(0, 7),
                            blurRadius: 7,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 78,
                            height: 78,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey,
                            ),
                            child: ClipOval(
                              child: _buildProfileImage(photoUrl),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'M. Richie Sugestiana.',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 11),
                          const Text(
                            '83493',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Color(0xFFFA0007),
                            ),
                          ),
                          const SizedBox(height: 9),
                          const Text(
                            'IT Network & Infrastruktur',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Color(0xFF991B1C),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 37),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Account Information',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: Color(0xFF991B1C),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 21),
                    AccountInfoCard(
                      iconPath: 'assets/icons/ic_card_id.svg',
                      title: 'Number ID',
                      value: '83493',
                      showCopyIcon: true,
                      onCopyTap: () => _copyToClipboard(context, '83493'),
                    ),
                    const AccountInfoCard(
                      iconPath: 'assets/icons/ic_user.svg',
                      title: 'Full Name',
                      value: 'M. Richie Sugestiana.',
                      showCopyIcon: false,
                      iconWidth: 26.08,
                      iconHeight: 30,
                    ),
                    const AccountInfoCard(
                      iconPath: 'assets/icons/ic_briefcase.svg',
                      title: 'Position',
                      value: 'IT Network & Infrastruktur',
                      showCopyIcon: false,
                      iconWidth: 35,
                      iconHeight: 35,
                    ),
                    AccountInfoCard(
                      iconPath: 'assets/icons/ic_email-profile.svg',
                      title: 'Email',
                      value: 'richie@multifab.co.id',
                      showCopyIcon: true,
                      onCopyTap: () =>
                          _copyToClipboard(context, 'richie@multifab.co.id'),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage(String imageUrl) {
    if (!_isOnline) {
      return Image.asset(
        'assets/images/common/default-user.jpg',
        fit: BoxFit.cover,
      );
    }

    final String cleanUrl = imageUrl.replaceAll(RegExp(r'(?<!:)/{2,}'), '/');

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
