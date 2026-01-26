import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'package:mobile_smile_multifab/shared/widgets/base_background_scaffold.dart';
import 'package:mobile_smile_multifab/features/profile/widgets/profile_card.dart';
import 'package:mobile_smile_multifab/features/profile/widgets/profile_menu_section.dart';
import 'package:mobile_smile_multifab/features/profile/widgets/change_password_section.dart';
import 'package:mobile_smile_multifab/features/profile/widgets/success_notification_card.dart';
import 'package:mobile_smile_multifab/features/profile/widgets/qr_code_bottom_sheet.dart';

enum ProfileView { menu, password, success }

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  bool _isOnline = true;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;
  ProfileView _currentView = ProfileView.menu;
  final String _profileImageUrl =
      "https://scontent-cgk2-1.cdninstagram.com/v/t51.2885-19/583200018_18367273294084132_5580250522120237473_n.jpg?efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4xMDgwLmMyIn0&_nc_ht=scontent-cgk2-1.cdninstagram.com&_nc_cat=104&_nc_oc=Q6cZ2QH_StjD6RoNLsmif92M8IDCvWDL1NbIIu5u_1LkwLeqRqAhSsvB5EPUysGa4FWJEAY&_nc_ohc=BFSq9vY9zXYQ7kNvwG9LaaB&_nc_gid=7uOW328noKvLAHfgky-zLg&edm=ALGbJPMBAAAA&ccb=7-5&oh=00_AfrLLe2DYfmI4M2SEVGnYPMO227KLgww5m2x3Fatv2gmzw&oe=697CB30F&_nc_sid=7d3ac5";

  @override
  void initState() {
    super.initState();
    _initConnectivity();
    _connectivitySubscription =
        Connectivity().onConnectivityChanged.listen(_updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> _initConnectivity() async {

    try {
      final result = await Connectivity().checkConnectivity();
      _updateConnectionStatus(result);
    } catch (_) {}
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    setState(() => _isOnline = !results.contains(ConnectivityResult.none));
  }


  void _goToMenu() {
    setState(() => _currentView = ProfileView.menu);
    FocusManager.instance.primaryFocus?.unfocus();
  }

  void _goToPassword() {
    setState(() => _currentView = ProfileView.password);
  }

  void _goToSuccess() {
    setState(() => _currentView = ProfileView.success);

    Timer(const Duration(seconds: 4), () {
      if (mounted) _goToMenu();
    });
  }

  void _showQrCodeModal() {

    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Close',
      barrierColor: Colors.black.withOpacity(0.35),
      transitionDuration: const Duration(milliseconds: 600),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
              .animate(CurvedAnimation(
                  parent: animation, curve: Curves.easeOutQuart)),
          child: child,
        );
      },
      pageBuilder: (_, __, ___) => const QrCodeBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double scale = screenHeight / 844.0;
    final double headerCardTop = 170.0 * scale;
    final double menuSectionTop = 380.0 * scale;

    final bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    final double bottomNavbarGap = 45.0;

    return BaseBackgroundScaffold(
      isOnline: _isOnline,

      child: Stack(
        clipBehavior: Clip.none,
        children: [

          Positioned(
            top: menuSectionTop,
            left: 0,
            right: 0,

            bottom: -100,
            child: ProfileMenuSection(
              onChangePassword: _goToPassword,
            ),
          ),

          Positioned(
            top: headerCardTop,
            left: 24,
            right: 24,
            child: ProfileHeaderCard(
              isOnline: _isOnline,
              imageUrl: _profileImageUrl,
              onQrTap: _showQrCodeModal,
            ),
          ),

          Positioned(

            bottom: isKeyboardOpen ? 0 : -bottomNavbarGap,
            left: 0,
            right: 0,
            height: isKeyboardOpen
                ? double.infinity
                : (screenHeight * 0.423) + bottomNavbarGap,

            child: IgnorePointer(
              ignoring: _currentView != ProfileView.password,
              child: AnimatedSlide(

                offset: _currentView == ProfileView.menu
                    ? const Offset(1.0, 0.0)
                    : Offset.zero,
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOutQuart,
                child: ChangePasswordSection(
                  height: double.infinity,
                  onBack: _goToMenu,
                  onSuccess: _goToSuccess,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: isKeyboardOpen ? 0 : -bottomNavbarGap,
            left: 0,
            right: 0,
            height: (screenHeight * 0.423) + bottomNavbarGap,
            child: IgnorePointer(
              ignoring: _currentView != ProfileView.success,
              child: AnimatedSlide(
                offset: _currentView == ProfileView.success
                    ? Offset.zero
                    : const Offset(1.0, 0.0),
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOutQuart,
                child: const SuccessNotificationCard(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
