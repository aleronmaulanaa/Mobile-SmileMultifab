import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_smile_multifab/features/profile/widgets/account_info_card.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Data Dummy (Bisa diganti data asli nanti)
    final String photoUrl =
        "https://scontent-cgk2-1.cdninstagram.com/v/t51.2885-19/583200018_18367273294084132_5580250522120237473_n.jpg?efg=eyJ2ZW5jb2RlX3RhZyI6InByb2ZpbGVfcGljLmRqYW5nby4xMDgwLmMyIn0&_nc_ht=scontent-cgk2-1.cdninstagram.com&_nc_cat=104&_nc_oc=Q6cZ2QFUHV5MIMHQpwgpukY2oKbL4xJSdljTuioWaEMmkbDlefuKfo3TT1WJutYLmDiDUYA&_nc_ohc=doa6If38FpoQ7kNvwGbQ-30&_nc_gid=IffLnhmnXQE7k1TC0oEEwA&edm=AP4sbd4BAAAA&ccb=7-5&oh=00_Afo-q0wEwJnbQeErrNBpjefyIJ0asVmsjQsMjIrcQc86ew&oe=69761B8F&_nc_sid=7a9f4b"; // Gunakan URL atau Asset

    return AnnotatedRegion<SystemUiOverlayStyle>(
      // MENGUBAH STATUS BAR MENJADI PUTIH (ICON)
      value: const SystemUiOverlayStyle(
        statusBarColor:
            Colors.transparent, // Transparan agar warna header terlihat
        statusBarIconBrightness:
            Brightness.light, // Icon putih (untuk background gelap)
        statusBarBrightness: Brightness.dark, // Untuk iOS
      ),
      child: Scaffold(
        backgroundColor: const Color(
            0xFFF9FAFB), // Background abu sangat muda agar card putih terlihat
        body: Column(
          children: [
            // ===========================
            // 1. HEADER MERAH
            // ===========================
            Container(
              width: double.infinity,
              height: 126,
              color: const Color(0xFF991B1C),
              padding: const EdgeInsets.only(bottom: 17, left: 24, right: 24),
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  // Tombol Back
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: SvgPicture.asset(
                      'assets/icons/ic_arrow_left_white.svg', // Pastikan aset ada
                      width: 27,
                      height: 27,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),

                  // Text Your Profile (Expanded agar benar-benar di tengah)
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

                  // Dummy SizedBox agar Text benar-benar di tengah (menyeimbangkan tombol back)
                  const SizedBox(width: 27),
                ],
              ),
            ),

            // ===========================
            // 2. BODY SCROLLABLE
            // ===========================
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 37), // Jarak Header ke Card Profile

                    // --- CARD PROFILE UTAMA ---
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
                          // Foto Profile
                          Container(
                            width: 78,
                            height: 78,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.grey, // Placeholder
                            ),
                            child: ClipOval(
                              child: Image.network(
                                photoUrl,
                                fit: BoxFit.cover,
                                errorBuilder: (ctx, _, __) => Image.asset(
                                    'assets/images/common/default-user.jpg'),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),

                          // Nama
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

                          // ID (Merah Terang)
                          const Text(
                            '83493',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600, // Semibold
                              fontSize: 16,
                              color: Color(0xFFFA0007),
                            ),
                          ),
                          const SizedBox(height: 9),

                          // Posisi (Merah Gelap)
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

                    const SizedBox(
                        height: 37), // Jarak Card Profile ke Judul Account Info

                    // --- JUDUL SECTION ---
                    const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24), // Align dengan layout
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Account Information',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w800, // ExtraBold
                            fontSize: 16,
                            color: Color(0xFF991B1C),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                        height: 21), // Jarak Judul ke Card Informasi Pertama

                    // --- LIST INFORMASI ---
                    const AccountInfoCard(
                      iconPath:
                          'assets/icons/ic_card_id.svg', // Ganti sesuai aset
                      title: 'Number ID',
                      value: '83493',
                      showCopyIcon: true,
                    ),

                    const AccountInfoCard(
                      iconPath: 'assets/icons/ic_user.svg',
                      title: 'Full Name',
                      value: 'M. Richie Sugestiana.',
                      showCopyIcon:
                          false, // Tidak ada copy icon di desain untuk nama
                    ),

                    const AccountInfoCard(
                      iconPath: 'assets/icons/ic_briefcase.svg',
                      title: 'Position',
                      value: 'IT Network & Infrastruktur',
                      showCopyIcon: false,
                    ),

                    const AccountInfoCard(
                      iconPath: 'assets/icons/ic_email.svg',
                      title: 'Email',
                      value: 'richie@multifab.co.id', // Contoh email
                      showCopyIcon: true,
                    ),

                    const SizedBox(
                        height: 50), // Padding bawah agar scroll tidak mentok
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
