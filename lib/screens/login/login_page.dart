import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Pastikan sudah add flutter_svg di pubspec.yaml
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    // Mengambil tinggi layar penuh
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
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
              // 2. LOGO (POJOK KIRI ATAS)
              // ===========================
              Positioned(
                top: 50, // Sesuaikan top padding jika perlu (misal status bar)
                left: 24,
                child: Image.asset(
                  'assets/images/login/logo_smile_v2.png',
                  width: 133, // W=133
                  height: 58, // H=58
                  fit: BoxFit.contain,
                ),
              ),

              // ===========================
              // 3. KONTEN TENGAH (JUDUL & CARD)
              // ===========================
              // Menggunakan Center agar Card benar-benar ditengah
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Agar membungkus konten saja
                  children: [
                    // --- TEXT JUDUL ---
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600, // SemiBold
                        fontSize: 24,
                        color: Color(0xFFFA0209), // FA0209 100%
                      ),
                    ),
                    const SizedBox(height: 9), // Jarak 9
                    const Text(
                      'Please Login to continue',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600, // SemiBold
                        fontSize: 13,
                        color: Color(0xFF991B1C), // 991B1C 100%
                      ),
                    ),

                    const SizedBox(
                        height: 20), // Jarak antara Text Header dan Card

                    // --- CARD FORM LOGIN ---
                    _buildLoginCard(),
                  ],
                ),
              ),

              // ===========================
              // 4. FOOTER (POWERED BY)
              // ===========================
              Positioned(
                bottom: 30, // Jarak dari bawah layar
                left: 0,
                right: 0,
                child: Column(
                  children: const [
                    Text(
                      'Powered by',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600, // SemiBold
                        fontSize: 13,
                        color: Color(0xFF97656E), // 97656E 100%
                      ),
                    ),
                    SizedBox(height: 11), // Jarak 11
                    Text(
                      'Dept. Information of Technology',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600, // SemiBold
                        fontSize: 13,
                        color: Color(0xFF995565), // 995565 100%
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

  // WIDGET: KARTU LOGIN (KOTAK PUTIH)
  Widget _buildLoginCard() {
    return Container(
      width: 347, // W=347
      height: 397, // H=397
      // Margin Dalam: Kanan-Kiri=16, Atas-Bawah=52
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 52),
      decoration: BoxDecoration(
        color: Colors.white, // FFFFFF 100%
        borderRadius: BorderRadius.circular(21), // Radius 21
        // Stroke Inside: Width 1, Color 000000 25%
        border: Border.all(
          color: Colors.black.withOpacity(0.25),
          width: 1,
        ),
        // Drop Shadow: x=0 y=7 blur=9 color 000000 25%
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
          // === FORM EMAIL ===
          const Text(
            'Email Address',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600, // SemiBold
              fontSize: 12,
              color: Color(0xFF991B1C), // 991B1C 100%
            ),
          ),
          const SizedBox(height: 8), // Jarak 8
          _buildInputField(
            hintText: 'email@multifab.com',
            iconPath:
                'assets/icons/ic_email.svg', // Ganti dengan path icon email
            isPassword: false,
          ),

          const SizedBox(height: 18), // Jarak antar section 18

          // === FORM PASSWORD ===
          const Text(
            'Password',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600, // SemiBold
              fontSize: 12,
              color: Color(0xFF991B1C), // 991B1C 100%
            ),
          ),
          const SizedBox(height: 8), // Jarak 8
          _buildInputField(
            hintText: 'Enter your password',
            iconPath:
                'assets/icons/ic_password.svg', // Ganti dengan path icon password
            isPassword: true,
          ),

          const SizedBox(height: 12), // Jarak ke Remember Me

          // === REMEMBER ME ===
          Row(
            children: [
              // Custom Checkbox
              GestureDetector(
                onTap: () {
                  setState(() {
                    _rememberMe = !_rememberMe;
                  });
                },
                child: Container(
                  width: 15, // W=15
                  height: 15, // H=15
                  decoration: BoxDecoration(
                    // Warna EEEEEE jika belum, FA0007 jika sudah
                    color: _rememberMe
                        ? const Color(0xFFFA0007)
                        : const Color(0xFFEEEEEE),
                    borderRadius: BorderRadius.circular(3), // Radius 3
                  ),
                  child: _rememberMe
                      ? const Center(
                          child: Icon(
                            Icons.check, // Icon Check bawaan flutter
                            size: 11, // Ukuran disesuaikan agar masuk kotak 15
                            color: Colors.white,
                          ),
                        )
                      : null,
                ),
              ),
              const SizedBox(width: 11), // Jarak 11
              const Text(
                'Remember me',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600, // SemiBold
                  fontSize: 10,
                  color: Colors.black, // 000000 100%
                ),
              ),
            ],
          ),

          const Spacer(), // Mendorong tombol ke bawah sisa space

          // === TOMBOL LOGIN ===
          Center(
            child: SizedBox(
              width: 262, // W=262
              height: 36, // H=36
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFA0007), // FA0007 100%
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18), // Radius 18
                  ),
                  elevation: 0,
                ),
                onPressed: () {
                  // Aksi Login
                },
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600, // SemiBold
                    fontSize: 15,
                    color: Colors.white, // FFFFFF 100%
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 13), // Jarak 13

          // === FORGOT PASSWORD ===
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Forgot your password?',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600, // SemiBold
                  fontSize: 10,
                  color: Colors.black, // 000000 100%
                ),
              ),
              const SizedBox(width: 4), // Jarak 4
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
                    fontWeight: FontWeight.w600, // SemiBold
                    fontSize: 10,
                    color: Color(0xFF1F63C7), // 1F63C7 100%
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // WIDGET: INPUT FIELD CUSTOM
  Widget _buildInputField({
    required String hintText,
    required String iconPath,
    required bool isPassword,
  }) {
    return Container(
      width: 314, // W=314
      height: 42, // H=42
      padding: const EdgeInsets.symmetric(
          horizontal: 10), // Padding agar tidak mepet
      decoration: BoxDecoration(
        color: const Color(0xFFF2F2F2), // F2F2F2 100%
        borderRadius: BorderRadius.circular(5), // Radius 5
      ),
      child: Row(
        children: [
          // ICON KIRI (Email / Password)
          SvgPicture.asset(
            iconPath,
            width: 19, // W=19
            height: 19, // H=19
            fit: BoxFit.contain,
          ),

          const SizedBox(width: 5), // Jarak icon ke text 5

          // TEXT FIELD
          Expanded(
            child: TextField(
              obscureText: isPassword ? _obscurePassword : false,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600, // SemiBold
                fontSize: 10,
                color: Colors.black, // Warna Text Ketikan
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600, // SemiBold
                  fontSize: 10,
                  color: Color(0xFFA0A0A0), // A0A0A0 100%
                ),
                contentPadding:
                    const EdgeInsets.only(bottom: 12), // Align vertical text
              ),
            ),
          ),

          // ICON KANAN (Khusus Password: Hide/Show)
          if (isPassword)
            GestureDetector(
              onTap: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
              child: SvgPicture.asset(
                _obscurePassword
                    ? 'assets/icons/ic_hide.svg' // Icon Hide
                    : 'assets/icons/ic_show.svg', // Icon Show
                width: 21, // W=21
                height: 21, // H=21
                colorFilter: const ColorFilter.mode(
                  Color(0xFF979797), // Warna 979797 100%
                  BlendMode.srcIn,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
