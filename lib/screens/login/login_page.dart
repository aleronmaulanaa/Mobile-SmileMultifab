import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;
  bool _rememberMe = false;

  // @override
  // Widget build(BuildContext context) {
  //   final screenHeight = MediaQuery.of(context).size.height;

  //   return Scaffold(
  //     resizeToAvoidBottomInset: false,
  //     body: SingleChildScrollView(
  //       child: SizedBox(
  //         height: screenHeight,
  //         child: Stack(
  //           children: [
  //             // ===========================
  //             // 1. BACKGROUND IMAGE
  //             // ===========================
  //             Positioned.fill(
  //               child: Image.asset(
  //                 'assets/images/login/bg_login_page.JPEG',
  //                 fit: BoxFit.cover,
  //               ),
  //             ),

  //             // ===========================
  //             // 2. LOGO
  //             // ===========================
  //             Positioned(
  //               top: 50,
  //               left: 24,
  //               child: Image.asset(
  //                 'assets/images/login/logo_smile_v2.png',
  //                 width: 133,
  //                 height: 58,
  //                 fit: BoxFit.contain,
  //               ),
  //             ),

  //             // ===========================
  //             // 3. KONTEN TENGAH (JUDUL & CARD)
  //             // ===========================
  //             // REVISI: Ganti Center dengan Positioned agar bisa diatur tingginya
  //             Positioned(
  //               // ATUR ANGKA INI: Semakin KECIL, semakin KE ATAS posisinya.
  //               // Logo berakhir di sekitar 108 (50+58), jadi kita mulai di 125 agar ada jarak.
  //               top: 200,
  //               left: 0,
  //               right: 0,
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   const Text(
  //                     'Login',
  //                     style: TextStyle(
  //                       fontFamily: 'Poppins',
  //                       fontWeight: FontWeight.w600,
  //                       fontSize: 24,
  //                       color: Color(0xFFFA0209),
  //                     ),
  //                   ),
  //                   const SizedBox(height: 9),
  //                   const Text(
  //                     'Please Login to continue',
  //                     style: TextStyle(
  //                       fontFamily: 'Poppins',
  //                       fontWeight: FontWeight.w600,
  //                       fontSize: 13,
  //                       color: Color(0xFF991B1C),
  //                     ),
  //                   ),
  //                   const SizedBox(height: 20),
  //                   _buildLoginCard(),
  //                 ],
  //               ),
  //             ),

  //             // ===========================
  //             // 4. FOOTER (POWERED BY) - POSISI DIPERBAIKI
  //             // ===========================
  //             Positioned(
  //               bottom:
  //                   120, // REVISI: Dinaikkan dari 30 ke 60 agar lebih ke atas
  //               left: 0,
  //               right: 0,
  //               child: Column(
  //                 children: const [
  //                   Text(
  //                     'Powered by',
  //                     style: TextStyle(
  //                       fontFamily: 'Poppins',
  //                       fontWeight: FontWeight.w600,
  //                       fontSize: 13,
  //                       color: Color(0xFF97656E),
  //                     ),
  //                   ),
  //                   SizedBox(height: 11),
  //                   Text(
  //                     'Dept. Information of Technology',
  //                     style: TextStyle(
  //                       fontFamily: 'Poppins',
  //                       fontWeight: FontWeight.w600,
  //                       fontSize: 13,
  //                       color: Color(0xFF995565),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    // 1. BUNGKUS DENGAN GESTURE DETECTOR
    return GestureDetector(
      onTap: () {
        // Logika: Lepaskan fokus (tutup keyboard) saat layar disentuh
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
            child: Stack(
              children: [
                // ===========================
                // 1. BACKGROUND IMAGE
                // ===========================
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/login/bg_login_page.JPEG',
                    fit: BoxFit.cover,
                  ),
                ),

                // ===========================
                // 2. LOGO
                // ===========================
                Positioned(
                  top: 50,
                  left: 24,
                  child: Image.asset(
                    'assets/images/login/logo_smile_v2.png',
                    width: 133,
                    height: 58,
                    fit: BoxFit.contain,
                  ),
                ),

                // ===========================
                // 3. KONTEN TENGAH (JUDUL & CARD)
                // ===========================
                Positioned(
                  // Logo berakhir di sekitar 108 (50+58), jadi kita mulai di 125 agar ada jarak.
                  top: 200, // Sesuai kode Anda
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Color(0xFFFA0209),
                        ),
                      ),
                      const SizedBox(height: 9),
                      const Text(
                        'Please Login to continue',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Color(0xFF991B1C),
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildLoginCard(),
                    ],
                  ),
                ),

                // ===========================
                // 4. FOOTER (POWERED BY)
                // ===========================
                Positioned(
                  bottom: 120, // Sesuai kode Anda
                  left: 0,
                  right: 0,
                  child: Column(
                    children: const [
                      Text(
                        'Powered by',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Color(0xFF97656E),
                        ),
                      ),
                      SizedBox(height: 11),
                      Text(
                        'Dept. Information of Technology',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 13,
                          color: Color(0xFF995565),
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
    );
  }

  Widget _buildLoginCard() {
    return Container(
      width: 347,
      height: 397,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 52),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(21),
        border: Border.all(
          color: Colors.black.withOpacity(0.25),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            offset: const Offset(0, 7),
            blurRadius: 9,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // FORM EMAIL
          const Text(
            'Email Address',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color(0xFF991B1C),
            ),
          ),
          const SizedBox(height: 8),
          _buildInputField(
            hintText: 'email@multifab.com',
            iconPath: 'assets/icons/ic_email.svg',
            isPassword: false,
          ),

          const SizedBox(height: 18),

          // FORM PASSWORD
          const Text(
            'Password',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color(0xFF991B1C),
            ),
          ),
          const SizedBox(height: 8),
          _buildInputField(
            hintText: 'Enter your password',
            iconPath: 'assets/icons/ic_password.svg',
            isPassword: true,
          ),

          const SizedBox(height: 12),

          // === REMEMBER ME ===
          // PERBAIKAN: GestureDetector membungkus Row (Kotak + Text)
          GestureDetector(
            onTap: () {
              setState(() {
                _rememberMe = !_rememberMe;
              });
            },
            // Tambahkan behavior ini agar area kosong/spasi di antaranya juga bisa diklik
            behavior: HitTestBehavior.opaque,
            child: Row(
              mainAxisSize: MainAxisSize
                  .min, // Agar area klik tidak melebar ke seluruh layar
              children: [
                // 1. KOTAK CHECKBOX (Hanya Tampilan)
                Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: _rememberMe
                        ? const Color(0xFFFA0007)
                        : const Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: _rememberMe
                      ? const Center(
                          child: Icon(
                            Icons.check,
                            size: 11,
                            color: Colors.white,
                          ),
                        )
                      : null,
                ),

                const SizedBox(width: 11), // Jarak

                // 2. TEKS REMEMBER ME
                const Text(
                  'Remember me',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          const Spacer(),

          // TOMBOL LOGIN
          Center(
            child: SizedBox(
              width: 262,
              height: 36,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFA0007),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  elevation: 0,
                ),
                onPressed: () {},
                child: const Text(
                  'Login',
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

          const SizedBox(height: 13),

          // FORGOT PASSWORD
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Forgot your password?',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  color: Colors.black,
                ),
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const ForgotPasswordPage(),
                    ),
                  );
                },
                child: const Text(
                  'Click here',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: 10,
                    color: Color(0xFF1F63C7),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // REVISI WIDGET INPUT FIELD (TEXT CENTER)
  Widget _buildInputField({
    required String hintText,
    required String iconPath,
    required bool isPassword,
  }) {
    return Container(
      width: 314,
      height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        // REVISI: Pastikan item di Row sejajar tengah secara vertikal
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 21,
            height: 21,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 5),

          // TEXT FIELD
          Expanded(
            child: TextField(
              obscureText: isPassword ? _obscurePassword : false,
              // REVISI: Properti ini membuat teks ketikan/hint ada di tengah vertikal
              textAlignVertical: TextAlignVertical.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 10,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                  color: Color(0xFFA0A0A0),
                ),
                // REVISI: Menghilangkan padding bawaan agar textAlignVertical bekerja sempurna
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),

          if (isPassword)
            GestureDetector(
              onTap: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
              child: SvgPicture.asset(
                _obscurePassword
                    ? 'assets/icons/ic_hide.svg'
                    : 'assets/icons/ic_show.svg',
                width: 21,
                height: 21,
                colorFilter: const ColorFilter.mode(
                  Color(0xFF979797),
                  BlendMode.srcIn,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
