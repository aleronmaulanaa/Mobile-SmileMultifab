import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Pastikan import ini ada

class EmployeeCard extends StatefulWidget {
  final int spLevel; // 0 = Normal, 1 = Kuning, 2 = Orange, 3 = Merah
  final bool showSyncIcon; // Trigger untuk icon sync

  const EmployeeCard({
    super.key,
    this.spLevel = 0, // Default normal
    this.showSyncIcon = true,
  });

  @override
  State<EmployeeCard> createState() => _EmployeeCardState();
}

class _EmployeeCardState extends State<EmployeeCard> {
  // State untuk mata (Hide/Unhide)
  bool _isLateHidden = true;

  // Helper untuk mendapatkan warna SP
  // Color _getSpColor() {
  //   switch (widget.spLevel) {
  //     case 1:
  //       return const Color(0xFFFFE100); // SP 1 - Kuning
  //     case 2:
  //       return const Color(0xFFF59642); // SP 2 - Orange
  //     case 3:
  //       return const Color(0xFFF04241); // SP 3 - Merah
  //     default:
  //       return Colors.transparent;
  //   }
  // }
  // 1. Warna Background SP & Stroke Card
  Color _getSpColor() {
    switch (widget.spLevel) {
      case 1:
        return const Color(0xFFFFDD00); // SP 1 - Kuning
      case 2:
        return const Color(0xFFFF6F00); // SP 2 - Orange
      case 3:
        return const Color(0xFFFF0000); // SP 3 - Merah
      default:
        return const Color(0xFFD4D4D4).withOpacity(0.70); // Normal Stroke
    }
  }

  // 2. Warna Teks SP
  Color _getSpTextColor() {
    switch (widget.spLevel) {
      case 1:
        return const Color(0xFF000000); // SP 1 - Hitam
      case 2:
      case 3:
        return const Color(0xFFFFFB00); // SP 2 & 3 - Kuning Terang
      default:
        return Colors.black;
    }
  }

  // Helper untuk mendapatkan text SP
  String _getSpText() {
    return "Surat Peringatan (SP) : ${widget.spLevel}";
  }

  @override
  Widget build(BuildContext context) {
    // REVISI: Tinggi diubah menjadi 40 sesuai permintaan
    const double headerVisibleHeight = 40.0;

    return Stack(
      children: [
        // LAYER 1: HEADER SP (BELAKANG)
        if (widget.spLevel > 0)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80, // Tetap tinggi agar memanjang ke belakang
              decoration: BoxDecoration(
                color: _getSpColor(),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              alignment: Alignment.topCenter,
              // REVISI: Padding top jadi 10 agar pas di tengah area 40px
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                _getSpText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: _getSpTextColor(),
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

        // LAYER 2: MAIN CARD (DEPAN)
        Padding(
          padding: EdgeInsets.only(
            // Card turun sejauh 40px
            top: widget.spLevel > 0 ? headerVisibleHeight : 0,
          ),
          child: _buildMainCard(),
        ),
      ],
    );
  }

  Widget _buildMainCard() {
    return Container(
      width: double.infinity,
      // H = 297 (Flexible height mengikuti konten agar aman)
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(23),
        // border: Border.all(
        //   color: const Color(0xFFD4D4D4).withOpacity(0.70), // Stroke inside 70%
        //   width: 2,
        // ),
        border: Border.all(
          // Jika SP > 0 gunakan warna SP, jika 0 gunakan warna Normal
          color: _getSpColor(),
          width: 2, // Ketebalan tetap 2
        ),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF000000).withOpacity(0.25), // Shadow 25%
            blurRadius: 7,
            offset: const Offset(0, 7), // x=0 y=7
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // ===========================
            // BAGIAN 1: PROFILE RED BOX
            // ===========================
            _buildProfileSection(),

            const SizedBox(height: 12),

            // ===========================
            // BAGIAN 2: ABSENCE INFO
            // ===========================
            _buildAbsenceSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF87072),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Column(
        children: [
          // --- Baris Atas (Foto, Nama, Approval) ---
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Foto Profile
                Container(
                  width: 47,
                  height: 47,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage('assets/images/home/profile_user.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                // Nama & NIP
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    Text(
                      "Hi, M. Richie Sugestiana.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      "83493",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                // Tombol Approval
                Container(
                  width: 59,
                  height: 17,
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      const Text(
                        "Approval",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Positioned(
                        top: -5,
                        right: -5,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFE100),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Text(
                              "11",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),

          // Garis Pemisah Merah Gelap
          Container(
            height: 1,
            width: double.infinity,
            color: const Color(0xFFDE6264),
            margin: const EdgeInsets.symmetric(horizontal: 10),
          ),

          // --- Baris Bawah (Statistik Kehadiran) ---
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
            child: IntrinsicHeight(
              child: Row(
                // SOLUSI: Tambahkan ini agar kedua kolom dipaksa rata atas
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  // === KOLOM KIRI: KEHADIRAN ===
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start, // Default Start untuk Label
                      children: [
                        // LABEL (Tetap Kiri)
                        const Text(
                          "KEHADIRAN PER BULAN",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        // ANGKA (Dibuat Center)
                        // TAMBAHKAN JARAK
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment:
                              CrossAxisAlignment.baseline, // Kunci kesejajaran
                          textBaseline: TextBaseline.alphabetic,
                          children: const [
                            Text("27",
                                style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            Text("/30",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Garis Pemisah Vertikal Putih
                  Container(
                    width: 2,
                    height: double.infinity,
                    color: Colors.white,
                    margin: const EdgeInsets.only(left: 8, right: 8, top: 15),
                  ),

                  // === KOLOM KANAN: TERLAMBAT ===
                  Expanded(
                    flex: 6,
                    child: Stack(
                      clipBehavior:
                          Clip.none, // Agar icon aman jika geser-geser
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Default Start untuk Label
                          children: [
                            // LABEL (Tetap Kiri)
                            Padding(
                              padding: const EdgeInsets.only(
                                  left:
                                      10.0), // Ubah angka 10 sesuai kebutuhan gesernya
                              child: const Text(
                                "TERLAMBAT",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),

                            // 2. JARAK (SIZEDBOX) - Ditaruh SETELAH Padding selesai
                            const SizedBox(height: 4),

                            // ANGKA & TEKS KALI (Dibuat Center)
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .center, // Center Horizontal
                                crossAxisAlignment: CrossAxisAlignment
                                    .baseline, // Sejajar Garis Bawah Font
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(
                                    _isLateHidden ? "--" : "3",
                                    style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  const Text(
                                    "Kali",
                                    style: TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        // ICON MATA (HIDE/UNHIDE)
                        Positioned(
                          right: 0,
                          top:
                              18, // REVISI: Diturunkan agar sejajar dengan text "Kali"
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isLateHidden = !_isLateHidden;
                              });
                            },
                            child: SvgPicture.asset(
                              _isLateHidden
                                  ? 'assets/icons/ic_hide_white.svg' // Icon saat tersembunyi
                                  : 'assets/icons/ic_show_white.svg', // Icon saat terlihat
                              width: 21,
                              height: 21,
                              colorFilter: const ColorFilter.mode(Colors.white,
                                  BlendMode.srcIn), // Agar warna putih
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAbsenceSection() {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Pastikan align default start
      children: [
        // Baris Tanggal & History (Tidak Berubah)
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Wednesday, 7 January 2026",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500, // Medium
                color: Colors.black,
              ),
            ),
            Row(
              children: [
                if (widget.showSyncIcon)
                  Padding(
                    padding: const EdgeInsets.only(right: 4.0),
                    child: SvgPicture.asset(
                      'assets/icons/ic_sync.svg', // Sesuaikan path file
                      width: 15,
                      height: 15,
                      colorFilter: const ColorFilter.mode(
                          Color(0xFF1F63C7), BlendMode.srcIn), // Warna Biru
                    ),
                  ),
                const Text(
                  "History",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500, // Medium
                    color: Color(0xFF1F63C7),
                  ),
                ),
              ],
            )
          ],
        ),

        const SizedBox(height: 10),

        // WRAPPER UTAMA DENGAN PADDING (MARGIN KANAN KIRI)
        // Ini yang membuat kotak terlihat "menjorok ke dalam" dan lebih pendek
        Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 16.0), // Margin kiri-kanan
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- KOTAK ABSEN (HIJAU & ORANGE) ---
              // Kembali menggunakan Expanded agar responsif tapi terhimpit padding
              Row(
                children: [
                  // KOTAK HIJAU (Check In)
                  Expanded(
                    child: Container(
                      height: 78, // Tinggi tetap
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF36CA95),
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(
                            color: const Color(0xFFD4D4D4), width: 2),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "07:35",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 4),
                              Text(
                                "WIB",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Check in",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 12), // Jarak tengah antar kotak

                  // KOTAK ORANGE (Check Out)
                  Expanded(
                    child: Container(
                      height: 78, // Tinggi tetap
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF59642),
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(
                            color: const Color(0xFFD4D4D4), width: 2),
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                "--:--",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 4),
                              Text(
                                "WIB",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Check out",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // --- INFO SHIFT ---
              // Background lebih pipih (padding vertical dikurangi)
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 14, vertical: 4), // Vertical 4 agar pipih
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(50), // Sudut kapsul
                ),
                child: const Text(
                  "Shift : Normal [07.00 - 17.00]",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
