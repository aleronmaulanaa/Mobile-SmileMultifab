import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'verify_otp_page.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: SizedBox(
            height: screenHeight,
            child: Stack(
              children: [
                // ===========================
                // 1. BACKGROUND
                // ===========================
                Positioned.fill(
                  child: Image.asset(
                    'assets/images/login/bg_login_page.JPEG',
                    fit: BoxFit.cover,
                    // Tambahkan error builder agar tidak crash jika gambar salah
                    errorBuilder: (context, error, stackTrace) {
                      return Container(color: Colors.white);
                    },
                  ),
                ),

                // ===========================
                // 2. TOMBOL BACK (POJOK KIRI ATAS)
                // ===========================
                Positioned(
                  // [1] BAGIAN MENGATUR KETINGGIAN
                  // Ubah angka ini untuk naik/turun. (Makin besar = makin turun)
                  top: 78,

                  left: 0,
                  right: 0,
                  child: Center(
                    // [2] BAGIAN MENGATUR POSISI KIRI (Agar sejajar Card)
                    child: SizedBox(
                      width: 347, // Lebar disamakan dengan Card (347)
                      child: Align(
                        alignment: Alignment
                            .centerLeft, // Tombol nempel di sisi kiri kotak 347
                        child: GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black.withOpacity(0.20),
                                width: 1,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.25),
                                  blurRadius: 5,
                                  offset: const Offset(0, 0),
                                ),
                              ],
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.arrow_back,
                                size: 24,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // ===========================
                // 3. KONTEN TENGAH (IMAGE, TEXT, CARD)
                // ===========================
                Positioned(
                  top: 188,
                  left: 0,
                  right: 0,
                  child: Column(
                    // REVISI: Pastikan semua item (Gambar, Wrapper Text, Card) berada di tengah layar
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // 1. IMAGE
                      Image.asset(
                        'assets/images/login/forgot_password.png',
                        width: 114,
                        height: 114,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.broken_image,
                              size: 114, color: Colors.grey);
                        },
                      ),

                      const SizedBox(height: 24),

                      // 2. WRAPPER TEXT (KUNCI PERBAIKAN DISINI)
                      // Kita bungkus teks dengan lebar 347 (sama dengan Card)
                      SizedBox(
                        width: 347, // Lebar disamakan dengan Card
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Teks rata kiri DI DALAM kotak 347 ini
                          children: const [
                            Text(
                              'Forgot password',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: Color(0xFFFA0209),
                              ),
                            ),
                            SizedBox(height: 9),
                            Text(
                              'Please enter your email address',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: Color(0xFF991B1C),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 21),

                      // 3. CARD (Lebarnya juga 347)
                      _buildForgotCard(context),
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

  Widget _buildForgotCard(BuildContext context) {
    return Container(
      width: 347,
      // REVISI: Tinggi dinaikkan dari 231 menjadi 240 agar tidak overflow
      height: 240,
      // Padding tetap 54 sesuai permintaan
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 54),
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
          // LABEL EMAIL
          const Text(
            'Email Address',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Color(0xFF991B1C),
            ),
          ),

          const SizedBox(height: 8), // Jarak Label ke Input = 8

          // INPUT FIELD
          _buildInputField(
            hintText: 'email@multifab.com',
            iconPath: 'assets/icons/ic_email.svg',
          ),

          // REVISI: Gunakan SizedBox(24) fix, jangan pakai Spacer()
          // agar jaraknya akurat 24px dan tidak memakan sisa ruang yang bikin sempit.
          const SizedBox(height: 24),

          // TOMBOL SUBMIT
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      // Pastikan nama class di file verify_otp_page.dart adalah VerifyOtpPage
                      builder: (context) => const VerifyOtpPage(),
                    ),
                  );
                },
                child: const Text(
                  'Submit',
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
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String hintText,
    required String iconPath,
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Tambahkan safety check untuk SVG juga
          SvgPicture.asset(
            iconPath,
            width: 19,
            height: 19,
            fit: BoxFit.contain,
          ),
          const SizedBox(width: 5),
          Expanded(
            child: TextField(
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
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
