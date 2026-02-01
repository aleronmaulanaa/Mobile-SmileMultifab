# Mobile Smile Multifab

Aplikasi **Mobile Smile Multifab** adalah aplikasi seluler berbasis Flutter yang dirancang untuk kebutuhan manajemen karyawan dan operasional perusahaan. Aplikasi ini memfasilitasi proses absensi, pelacakan lokasi, manajemen profil pengguna, serta penyampaian informasi internal secara efisien.

## 🌟 Fitur Utama

Aplikasi ini memiliki berbagai fitur unggulan yang dibagi berdasarkan modul fungsional:

* **Sistem Absensi Canggih (Attendance):**
    * Pencatatan waktu kehadiran (*Clock In/Out*) secara *real-time*.
    * Validasi lokasi berbasis GPS (Geofencing) dan deteksi lokasi palsu.
    * Bukti kehadiran menggunakan kamera (Selfie attendance).
    * Riwayat absensi harian dan bulanan.
    * Peta interaktif untuk melihat lokasi absensi.
* **Otentikasi Aman (Auth):**
    * Login pengguna dengan keamanan terjamin.
    * Fitur Lupa Password dan Reset Password.
    * Verifikasi menggunakan kode OTP (*One-Time Password*).
* **Dashboard & Informasi (Home):**
    * Carousel banner untuk pengumuman perusahaan.
    * Kartu identitas karyawan digital.
    * Notifikasi ulang tahun karyawan.
    * Bagian berita/informasi terkini.
* **Manajemen Profil (Profile):**
    * Melihat dan memperbarui informasi akun.
    * Ubah kata sandi.
    * Kode QR unik untuk identitas karyawan.
* **Pemindai (Scan):**
    * Fitur pemindai QR/Barcode terintegrasi untuk keperluan validasi atau operasional.

## 🛠 Teknologi yang Digunakan

Project ini dibangun menggunakan teknologi dan pustaka berikut:

* **Framework:** [Flutter](https://flutter.dev/) (Dart)
* **Networking:** [Dio](https://pub.dev/packages/dio) (untuk manajemen request API)
* **State Management:** Provider / BLoC (Implied from architecture)
* **Maps:** Google Maps Flutter (untuk visualisasi lokasi)
* **Layanan Google:** Firebase (Google Services) untuk notifikasi/analitik.
* **Aset:** Font kustom (Poppins) dan Ikon SVG.

## 📋 Persyaratan Instalasi

Sebelum memulai, pastikan perangkat Anda telah memenuhi persyaratan berikut:

1.  **Flutter SDK:** Versi stabil terbaru.
2.  **Dart SDK:** Termasuk dalam paket Flutter.
3.  **IDE:** Visual Studio Code atau Android Studio.
4.  **Emulator/Device:**
    * Android Emulator atau perangkat fisik Android.
    * iOS Simulator atau iPhone (memerlukan macOS).

## 🚀 Cara Instalasi dan Menjalankan

Ikuti langkah-langkah berikut untuk menjalankan aplikasi di lingkungan pengembangan lokal Anda:

1.  **Clone Repository:**
    ```bash
    git clone [https://github.com/username/mobile-smilemultifab.git](https://github.com/username/mobile-smilemultifab.git)
    cd mobile-smilemultifab
    ```

2.  **Instal Dependensi:**
    ```bash
    flutter pub get
    ```

3.  **Konfigurasi Environment:**
    * Pastikan file `android/app/google-services.json` dan `ios/Runner/GoogleService-Info.plist` (jika ada) sudah ditempatkan dengan benar untuk koneksi Firebase.

4.  **Jalankan Aplikasi:**
    ```bash
    flutter run
    ```

## 📂 Susunan Project

Project ini menerapkan arsitektur berbasis fitur (*Feature-First Architecture*) untuk menjaga kode tetap rapi dan mudah dipelihara:

```text
lib/
├── core/                   # Komponen inti aplikasi
│   ├── constants/          # Konstanta API, Lokasi, dll.
│   └── utils/              # Utilitas (DioClient, TokenStorage, dll.)
├── features/               # Modul fitur utama
│   ├── attendance/         # Logika & UI Absensi (Map, Camera, History)
│   ├── home/               # Dashboard utama (Banner, Menu)
│   ├── login/              # Halaman & Logika Otentikasi
│   ├── profile/            # Manajemen Profil Pengguna
│   └── scan/               # Fitur Pemindai QR
├── services/               # Layanan global (Auth, Location, Notification)
├── shared/                 # Widget yang digunakan bersama (Navbar, Scaffold)
├── screens/                # Wrapper utama (AuthWrapper, MainWrapper)
└── main.dart               # Titik masuk aplikasi

## 📱 Contoh Penggunaan

Berikut adalah gambaran umum alur penggunaan aplikasi **Mobile Smile Multifab**:

1. **Login:**
  * Buka aplikasi dan masukkan kredensial akun Anda.
  * Jika lupa kata sandi, gunakan fitur **Lupa Password** untuk menerima kode OTP dan melakukan reset password.

2. **Absensi:**
  * Navigasi ke menu **Absensi**.
  * Pastikan GPS pada perangkat dalam kondisi aktif.
  * Ambil foto selfie sebagai bukti kehadiran.
  * Tekan tombol **Clock In** atau **Clock Out** sesuai kebutuhan.

3. **Cek Riwayat Kehadiran:**
  * Buka menu **History**.
  * Lihat daftar dan rekap kehadiran harian maupun bulanan.

4. **Profil Pengguna:**
  * Buka tab **Profil** untuk melihat QR Code identitas karyawan.
  * Perbarui informasi akun atau ubah kata sandi jika diperlukan.