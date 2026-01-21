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
import '../services/attendance_online_service.dart';
import '../services/attendance_photo_service.dart';



class RecordTimePage extends StatefulWidget {
  const RecordTimePage({super.key});

  @override 
  State<RecordTimePage> createState() => _RecordTimePageState();
}

class _RecordTimePageState extends State<RecordTimePage> {
  Position? _position;
  File? _capturedImage;
  bool _isSubmitting = false;
  DateTime? _photoTakenTime;
  bool _isOnline = true;
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

Future<bool> _isUsingFakeGps() async {
  try {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    return position.isMocked;
  } catch (_) {
    return false;
  }
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
      _photoTakenTime = DateTime.now();
    });
  }

  bool get _canSubmit =>
      _capturedImage != null &&
      _position != null &&
      !_isSubmitting;

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
                            final bool isFakeGps = await _isUsingFakeGps();
                            if (isFakeGps) {
                              setState(() {
                                _isSubmitting = false;
                              });

                              showDialog(
                                context: context,
                                builder: (_) => const AlertDialog(
                                  title: Text('Fake GPS Terdeteksi'),
                                  content: Text(
                                    'Silakan matikan Fake GPS atau Mock Location.',
                                  ),
                                ),
                              );
                              return; // STOP di sini
                            }

                            final isOnlineNow = await _checkConnectionNow();

                            if (isOnlineNow) {
                              try {
                                final String attendanceId =
                                    await AttendanceOnlineService.submitAttendance(
                                  userId: 'test_user',
                                  latitude: _position!.latitude,
                                  longitude: _position!.longitude,
                                  type: 'checkin',
                                );

                                await AttendanceHistoryService.addHistory(
                                  AttendanceHistory(
                                    imagePath: _capturedImage!.path,
                                    checkInTime: _photoTakenTime!,
                                    latitude: _position!.latitude,
                                    longitude: _position!.longitude,
                                    isOnline: true,
                                    photoStatus: 'pending',
                                  ),
                                );

                                AttendancePhotoService.uploadAttendancePhoto(
                                  attendanceId: attendanceId,
                                  imagePath: _capturedImage!.path,
                                  userId: 'test_user',
                                );

                              } catch (e) {
                                await AttendanceHistoryService.addHistory(
                                  AttendanceHistory(
                                    imagePath: _capturedImage!.path,
                                    checkInTime: _photoTakenTime!,
                                    latitude: _position!.latitude,
                                    longitude: _position!.longitude,
                                    isOnline: false,
                                    photoStatus: 'pending',
                                  ),
                                );
                              }
                            } else {

                              await AttendanceHistoryService.addHistory(
                                AttendanceHistory(
                                  imagePath: _capturedImage!.path,
                                  checkInTime: _photoTakenTime!,
                                  latitude: _position!.latitude,
                                  longitude: _position!.longitude,
                                  isOnline: false,
                                  photoStatus: 'pending',
                                ),
                              );
                            }




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
                Future<bool> _checkConnectionNow() async {
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

                return online;
                }
              }
