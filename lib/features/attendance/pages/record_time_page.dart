import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../widgets/attendance_camera.dart';
import '../models/attendance_history.dart';
import '../services/attendance_history_service.dart';
import '../services/attendance_daily_summary_service.dart';


class RecordTimePage extends StatefulWidget {
  const RecordTimePage({super.key});

  @override
  State<RecordTimePage> createState() => _RecordTimePageState();
}

class _RecordTimePageState extends State<RecordTimePage> {
  // ================= STATE
  Position? _position;
  File? _capturedImage;
  bool _isSubmitting = false;

  //  TAMBAHAN (JAM FOTO)
  DateTime? _photoTakenTime;

  //  TAMBAHAN (STATUS KONEKSI)
  bool _isOnline = true;

  // ================= CLOCK
  Timer? _clockTimer;
  DateTime _now = DateTime.now();

  String get _currentTime =>
      DateFormat('HH:mm:ss').format(_now);

  String get _currentDate =>
      DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
          .format(_now);

  @override
  void initState() {
    super.initState();
    _startClock();
    _getLocation();

    // TAMBAHAN
    _checkConnection();
  }

  void _startClock() {
    _clockTimer = Timer.periodic(
      const Duration(seconds: 1),
      (_) {
        if (!mounted) return;
        setState(() {
          _now = DateTime.now();
        });
      },
    );
  }

  Future<void> _getLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    if (!mounted) return;
    setState(() {
      _position = position;
    });
  }

  //  FIX TOTAL: CEK INTERNET NYATA (BUKAN CUMA WIFI)
  Future<void> _checkConnection() async {
    final connectivityResult =
        await Connectivity().checkConnectivity();

    bool online = connectivityResult != ConnectivityResult.none;

    if (online) {
      try {
        final result =
            await InternetAddress.lookup('google.com');
        online = result.isNotEmpty &&
            result.first.rawAddress.isNotEmpty;
      } catch (_) {
        online = false;
      }
    }

    if (!mounted) return;
    setState(() {
      _isOnline = online;
    });
  }

  void _onImageCaptured(File image) {
    setState(() {
      _capturedImage = image;

      //  JAM DIAMBIL SAAT FOTO
      _photoTakenTime = DateTime.now();
    });
  }

  bool get _canSubmit =>
      _capturedImage != null &&
      _position != null &&
      !_isSubmitting;

  // ================= POPUP SUKSES
  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 36,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Absensi Berhasil",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _isOnline
                      ? "Data absensi berhasil dikirim."
                      : "Data absensi tersimpan (offline).",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 44,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("OK"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _clockTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Record Attendance"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ================= JAM & TANGGAL
            Column(
              children: [
                Text(
                  _currentTime,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  _currentDate,
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // ================= KAMERA / PREVIEW
            Expanded(
              flex: 6,
              child: _capturedImage == null
                  ? AttendanceCamera(onCapture: _onImageCaptured)
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(
                        _capturedImage!,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),

            const SizedBox(height: 12),

            // ================= LAT LONG
            Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: _position == null
                      ? Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.location_searching,
                              size: 32,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 8),
                            Text(
                              "Mengambil lokasi...",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "Latitude",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _position!.latitude
                                      .toStringAsFixed(6),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 1,
                              height: 40,
                              color: Colors.grey.shade400,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text(
                                  "Longitude",
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black54,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _position!.longitude
                                      .toStringAsFixed(6),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ================= BUTTON SUBMIT (PUTIH)
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                icon: Icon(
                  _capturedImage == null
                      ? Icons.camera_alt
                      : Icons.check_circle,
                  color: Colors.white,
                ),
                label: Text(
                  _capturedImage == null
                      ? "Ambil Foto Absensi"
                      : _isSubmitting
                          ? "Mengirim Absensi..."
                          : "Kirim Absensi",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: _canSubmit
                    ? () async {
                        setState(() {
                          _isSubmitting = true;
                        });

                        await Future.delayed(
                          const Duration(seconds: 2),
                        );

                        // 🔥 SIMPAN KE HIVE (ONLINE / OFFLINE)
                        await AttendanceHistoryService.addHistory(
                          AttendanceHistory(
                            imagePath: _capturedImage!.path,
                            checkInTime: _photoTakenTime!,
                            latitude: _position!.latitude,
                            longitude: _position!.longitude,
                            isOnline: _isOnline,
                          ),
                        );

                        if (!mounted) return;

                        setState(() {
                          _isSubmitting = false;
                        });

                        _showSuccessDialog();
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      _canSubmit ? Colors.green : Colors.grey,
                  foregroundColor: Colors.white,
                  disabledForegroundColor: Colors.white70,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
