import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_smile_multifab/features/profile/widgets/account_info_card.dart';
import 'package:hive/hive.dart';
import '../../profile/models/user_profile.dart';


class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool _isOnline = true;
  UserProfile? _profile;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

final String _tempPhotoUrl =
  'https://instagram.fcgk43-1.fna.fbcdn.net/v/t51.2885-19/560499887_18406026835188624_5424641557300119921_n.jpg?efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4xMDgwLmMyIn0&_nc_ht=instagram.fcgk43-1.fna.fbcdn.net&_nc_cat=100&_nc_oc=Q6cZ2QGE6uY28Y9v_xp6mXdQgCvhsESmm_8Y2Jy_XDGDtoDYGW9n1PsRjTYQfBxb2pkLOeA&_nc_ohc=ktzKfdcYU_8Q7kNvwGDEUWQ&_nc_gid=4Ar_6QocitzDbfUb_Qpx8A&edm=AP4sbd4BAAAA&ccb=7-5&oh=00_AfqL-kxpelqYeb4g1kvxHj_fN_WbzpXWNRNEq2qyblkIdQ&oe=69801492&_nc_sid=7a9f4b';




  @override
  void initState() {
    super.initState();
    _initConnectivity();

      final box = Hive.box<UserProfile>('user_profile');
  _profile = box.get('current');

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
    
  // final String? photoUrl = _profile?.photoUrl;


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
                              child: _buildProfileImage(),
                            ),
                          ),
                          const SizedBox(height: 20),
Text(
  _profile?.name ?? '-',
  style: const TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: Colors.black,
  ),
),
                          const SizedBox(height: 11),
Text(
  _profile?.badgeNumber ?? '-',
  style: const TextStyle(
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
  value: _profile?.badgeNumber ?? '-',
  showCopyIcon: true,
  onCopyTap: () =>
      _copyToClipboard(context, _profile?.badgeNumber ?? ''),
),

AccountInfoCard(
  iconPath: 'assets/icons/ic_user.svg',
  title: 'Full Name',
  value: _profile?.name ?? '-',
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
                    value: _profile?.email ?? '-',
                      showCopyIcon: true,
                      onCopyTap: () =>
                          _copyToClipboard(context, _profile?.email ?? ''),
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

  Widget _buildProfileImage() {
    if (!_isOnline) {
      return Image.asset(
        'assets/images/common/default-user.jpg',
        fit: BoxFit.cover,
      );
    }

      final cleanUrl =
        _tempPhotoUrl.replaceAll(RegExp(r'(?<!:)/{2,}'), '/');

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
