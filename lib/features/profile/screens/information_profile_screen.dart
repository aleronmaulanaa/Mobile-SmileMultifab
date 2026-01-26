import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_smile_multifab/features/profile/widgets/custom_text_field.dart';

class InformationProfileScreen extends StatefulWidget {
  const InformationProfileScreen({super.key});

  @override
  State<InformationProfileScreen> createState() =>
      _InformationProfileScreenState();
}

class _InformationProfileScreenState extends State<InformationProfileScreen> {

  bool _isOnline = true;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  final String _photoUrl =
      "https://scontent-cgk2-1.cdninstagram.com/v/t51.2885-19/583200018_18367273294084132_5580250522120237473_n.jpg?efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4xMDgwLmMyIn0&_nc_ht=scontent-cgk2-1.cdninstagram.com&_nc_cat=104&_nc_oc=Q6cZ2QH_StjD6RoNLsmif92M8IDCvWDL1NbIIu5u_1LkwLeqRqAhSsvB5EPUysGa4FWJEAY&_nc_ohc=BFSq9vY9zXYQ7kNvwG9LaaB&_nc_gid=7uOW328noKvLAHfgky-zLg&edm=ALGbJPMBAAAA&ccb=7-5&oh=00_AfrLLe2DYfmI4M2SEVGnYPMO227KLgww5m2x3Fatv2gmzw&oe=697CB30F&_nc_sid=7d3ac5";

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

    const double headerHeight = 150.0;

    const double stripHeight = 47.0;

    const double profileSize = 73.0;
    const double profileRadius = profileSize / 2;

    const double totalFixedArea = headerHeight + stripHeight;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),

      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: const Color(0xFFF3F4F6),
          body: Stack(
            children: [

              ListView(
                padding: const EdgeInsets.only(
                  top: totalFixedArea + 30,
                  left: 24,
                  right: 24,
                  bottom: 50,
                ),
                physics: const BouncingScrollPhysics(),
                children: [
                  const Text(
                    'Update Identitas',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      color: Color(0xFFFA0209),
                    ),
                  ),
                  const SizedBox(height: 21),

                  const CustomTextField(
                    label: 'Kartu Keluarga (KK)',
                    hint: 'Nomor KK',
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 18),

                  const CustomTextField(
                    label: 'Kartu Tanda Penduduk (KTP)',
                    hint: 'Nomor KTP',
                    keyboardType: TextInputType.number,
                  ),

                  const SizedBox(height: 40),

                  const Text(
                    'Informasi Tempat tinggal',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w800,
                      fontSize: 16,
                      color: Color(0xFFFA0209),
                    ),
                  ),
                  const SizedBox(height: 21),

                  const Text(
                    'Alamat Domisili',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Color(0xFF991B1C),
                    ),
                  ),
                  const SizedBox(height: 8),

                  _buildSimpleForm(hint: 'Alamat Lengkap'),
                  const SizedBox(height: 8),
                  _buildSimpleForm(hint: 'Negara'),
                  const SizedBox(height: 8),
                  _buildSimpleForm(hint: 'Provinsi'),
                  const SizedBox(height: 8),
                  _buildSimpleForm(hint: 'Kota'),
                  const SizedBox(height: 8),
                  _buildSimpleForm(hint: 'Kecamatan'),
                  const SizedBox(height: 8),
                  _buildSimpleForm(hint: 'Kelurahan'),
                  const SizedBox(height: 8),
                  _buildSimpleForm(hint: 'Kode POS', isNumber: true),

                  const SizedBox(height: 18),

                  const Text(
                    'Alamat (KTP)',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Color(0xFF991B1C),
                    ),
                  ),
                  const SizedBox(height: 8),

                  _buildSimpleForm(hint: 'Alamat Lengkap'),
                  const SizedBox(height: 8),
                  _buildSimpleForm(hint: 'Negara'),
                  const SizedBox(height: 8),
                  _buildSimpleForm(hint: 'Provinsi'),
                  const SizedBox(height: 8),
                  _buildSimpleForm(hint: 'Kota'),
                  const SizedBox(height: 8),
                  _buildSimpleForm(hint: 'Kecamatan'),
                  const SizedBox(height: 8),
                  _buildSimpleForm(hint: 'Kelurahan'),
                  const SizedBox(height: 8),
                  _buildSimpleForm(hint: 'Kode POS', isNumber: true),

                  const SizedBox(height: 40),

                  Center(
                    child: SizedBox(
                      width: 262,
                      height: 36,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFA0007),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Save changes',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),

              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: totalFixedArea + profileRadius,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [

                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      height: headerHeight,
                      child: Container(
                        color: const Color(0xFF991B1C),
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: SafeArea(
                          bottom: false,
                          child: Column(
                            children: [

                              const SizedBox(height: 35),

                              SizedBox(
                                height: 30,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [

                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: GestureDetector(
                                        onTap: () => Navigator.pop(context),
                                        child: SvgPicture.asset(
                                          'assets/icons/ic_arrow_left_white.svg',
                                          width: 27,
                                          height: 27,
                                          colorFilter: const ColorFilter.mode(
                                              Colors.white, BlendMode.srcIn),
                                        ),
                                      ),
                                    ),

                                    const Text(
                                      'Information Profile',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: headerHeight,
                      left: 0,
                      right: 0,
                      height: stripHeight,
                      child: Container(
                        color: const Color(0xFFF3F4F6),
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Change photo',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Color(0xFF991B1C),
                              decoration: TextDecoration.underline,
                              decorationColor: Color(0xFF991B1C),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      top: headerHeight - profileRadius,
                      left: 24,
                      child: Container(
                        width: profileSize,
                        height: profileSize,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                        child: ClipOval(
                          child: _buildProfileImage(_photoUrl),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSimpleForm({required String hint, bool isNumber = false}) {
    return Container(
      width:
          double.infinity,
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 7),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: const Color(0xFFD3D3D3),
          width: 1.0,
        ),
      ),
      child: TextField(
        keyboardType: isNumber ? TextInputType.number : TextInputType.text,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 10,
            color: Color(0xFFA0A0A0),
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 13),
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
