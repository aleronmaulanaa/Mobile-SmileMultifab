import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/attendance_history.dart';
import '../services/attendance_history_service.dart';
import '../services/attendance_online_service.dart';

class AttendanceHistoryPage extends StatelessWidget {
  const AttendanceHistoryPage({super.key});

  // 🔥 CEK INTERNET NYATA
  Future<bool> _hasInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty &&
          result.first.rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  // 🔥 KIRIM DATA OFFLINE KE SERVER
  Future<void> _sendToServer(BuildContext context) async {
    final online = await _hasInternet();

    // ❌ BLOKIR JIKA OFFLINE
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

    // 🔄 LOADING
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

      Navigator.pop(context); // tutup loading

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
    final histories = AttendanceHistoryService.getAllHistory();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Attendance History'),
        centerTitle: true,
      ),
      body: histories.isEmpty
          ? const Center(child: Text('Belum ada data absensi'))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: histories.length,
              itemBuilder: (context, index) {
                final data = histories[index];

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(data.imagePath),
                          width: 72,
                          height: 72,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start,
                          children: [
                            Text(
                              DateFormat('HH:mm')
                                  .format(data.checkInTime),
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              DateFormat(
                                'EEEE, dd MMMM yyyy',
                                'id_ID',
                              ).format(data.checkInTime),
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade600,
                              ),
                            ),
                            const SizedBox(height: 6),

                            
                            Row(
                              children: [
                                const Icon(
                                  Icons.wifi_off,
                                  size: 14,
                                  color: Colors.orange,
                                ),
                                const SizedBox(width: 4),
                                const Text(
                                  'Offline',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.orange,
                                  ),
                                ),
                              ],
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
          height: 48,
          child: ElevatedButton.icon(
            icon: const Icon(Icons.cloud_upload),
            label: const Text('Kirim ke Server'),
            onPressed: histories.isEmpty
                ? null
                : () => _sendToServer(context),
          ),
        ),
      ),
    );
  }
}
