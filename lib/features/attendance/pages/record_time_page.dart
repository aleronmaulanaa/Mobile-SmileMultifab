import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../widgets/attendance_camera.dart';
import '../models/attendance_history.dart';
import '../services/attendance_history_service.dart';
// import '../services/attendance_daily_summary_service.dart';
import '../services/attendance_online_service.dart';
import '../services/attendance_photo_service.dart';
import '../../../core/utils/user_session.dart';



class AttendanceDecision {
  final bool allowed;
  final String? type; 
  final String? message; 

  AttendanceDecision({
    required this.allowed,
    this.type,
    this.message,
  });
}


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


AttendanceDecision _decideAttendance(DateTime now) {
  final hour = now.hour;
  final minute = now.minute;


  
  if (hour < 7) {
    return AttendanceDecision(
      allowed: false,
      message: 'Absensi ditutup',
    );
  }

  
  if (hour >= 7 && (hour < 10 || (hour == 10 && minute == 0))) {
    return AttendanceDecision(
      allowed: true,
      type: 'checkin',
    );
  }
  
  if ((hour == 10 && minute > 0) || hour == 11 || hour == 12) {
    return AttendanceDecision(
      allowed: false,
      message: 'Absensi check-in telah ditutup',
    );
  }

  
  if (hour >= 13 && (hour < 20 || (hour == 20 && minute == 0))) {
    return AttendanceDecision(
      allowed: true,
      type: 'checkout',
    );
  }


  return AttendanceDecision(
    allowed: false,
    message: 'Absensi ditutup',
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
                      Navigator.pop(context, true);
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
  backgroundColor: const Color(0xFF991B1C),
  elevation: 6,
  shadowColor: Colors.black.withOpacity(0.5),
  centerTitle: true,
  title: const Text(
    'Record Attendance',
    style: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
      letterSpacing: 0.5,
    ),
  ),
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
        setState(() => _isSubmitting = true);

        final isFakeGps = await _isUsingFakeGps();
        if (isFakeGps) {
          setState(() => _isSubmitting = false);
          showDialog(
            context: context,
            builder: (_) => const AlertDialog(
              title: Text('Fake GPS Terdeteksi'),
              content: Text(
                'Silakan matikan Fake GPS atau Mock Location.',
              ),
            ),
          );
          return;
        }

        final userId = UserSession.getUserId();
        if (userId == null) {
          setState(() => _isSubmitting = false);
          return;
        }

        
        final decision = _decideAttendance(DateTime.now());
        if (!decision.allowed) {
          setState(() => _isSubmitting = false);
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text('Absensi'),
              content: Text(decision.message ?? '-'),
            ),
          );
          return;
        }


final bool isOnlineNow = await _checkConnectionNow();

setState(() {
  _isOnline = isOnlineNow;
});



        try {
          if (isOnlineNow) {
            final attendanceId =
                await AttendanceOnlineService.submitAttendance(
              userId: userId,
              latitude: _position!.latitude,
              longitude: _position!.longitude,
              type: decision.type!, 
            );

            AttendancePhotoService.uploadAttendancePhoto(
              attendanceId: attendanceId,
              imagePath: _capturedImage!.path,
              userId: userId,
            );
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

        if (!mounted) return;
        setState(() => _isSubmitting = false);
        _showSuccessDialog();
      }
    : null,

                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _canSubmit ? Colors.green : Colors.grey,
                        foregroundColor: Colors.white,
                        disabledForegroundColor: Colors.white70,

                       
                        elevation: 12,
                        shadowColor: Colors.black.withOpacity(0.8),

                       
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),

                        
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 24,
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

