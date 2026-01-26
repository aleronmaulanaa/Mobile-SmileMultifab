import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/attendance_history.dart';
import '../services/attendance_history_service.dart';
import '../services/attendance_online_service.dart';

class AttendanceHistoryPage extends StatelessWidget {
  const AttendanceHistoryPage({super.key});

  
  Future<bool> _hasInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty &&
          result.first.rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  Future<void> _sendToServer(BuildContext context) async {
    final online = await _hasInternet();

    if (!online) {
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          title: Text('Tidak ada koneksi'),
          content: Text(
            'Tidak dapat mengirim data karena tidak ada koneksi internet.',
          ),
        ),
      );
      return;
    }

    final histories =
        AttendanceHistoryService.getAllHistory();

    if (histories.isEmpty) return;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      for (AttendanceHistory data in histories) {
        await AttendanceOnlineService.submitAttendance(
          userId: 'test_user',
          latitude: data.latitude,
          longitude: data.longitude,
          type: 'checkin',
        );
      }

      await AttendanceHistoryService.clearHistory();

      Navigator.pop(context);

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Berhasil'),
          content: const Text(
            'Semua data absensi offline berhasil dikirim ke server.',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {
      Navigator.pop(context);

      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Gagal'),
          content: const Text(
            'Terjadi kesalahan saat mengirim data ke server. '
            'Data tetap tersimpan di perangkat.',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final histories =
        AttendanceHistoryService.getAllHistory();

    return Scaffold(
      backgroundColor: const Color(0xFFF4F4F4),

      appBar: AppBar(
        backgroundColor: const Color(0xFF991B1C),
        elevation: 6,
        shadowColor: Colors.black.withOpacity(0.5),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'HISTORY',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
      ),

     
      body: histories.isEmpty
          ? const Center(
              child: Text(
                'Belum ada data absensi',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            )
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding:
                  const EdgeInsets.fromLTRB(16, 16, 16, 120),
              itemCount: histories.length,
              itemBuilder: (context, index) {
                final data = histories[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 18),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 18,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // FOTO
                      ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: Image.file(
                          File(data.imagePath),
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(width: 14),

                      // INFO
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat('HH:mm')
                                  .format(data.checkInTime),
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              DateFormat(
                                'EEEE, dd MMMM yyyy',
                                'id_ID',
                              ).format(data.checkInTime),
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.orange
                                    .withOpacity(0.15),
                                borderRadius:
                                    BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(
                                    Icons.wifi_off_rounded,
                                    size: 14,
                                    color: Colors.orange,
                                  ),
                                  SizedBox(width: 6),
                                  Text(
                                    'Offline',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.orange,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 58,
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF991B1C),
              elevation: 12,
              shadowColor: Colors.black.withOpacity(0.85),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40), 
              ),
            ),
            icon: const Icon(
              Icons.cloud_upload_rounded,
              color: Colors.white,
            ),
            label: const Text(
              'Kirim ke Server',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            onPressed: histories.isEmpty
                ? null
                : () => _sendToServer(context),
          ),
        ),
      ),
    );
  }
}
