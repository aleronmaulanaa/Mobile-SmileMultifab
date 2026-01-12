import 'dart:io';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../services/attendance_history_service.dart';

class AttendanceHistoryPage extends StatelessWidget {
  const AttendanceHistoryPage({super.key});

  // 🔥 TAMBAHAN: CEK INTERNET NYATA
  Future<bool> _hasInternet() async {
    try {
      final result =
          await InternetAddress.lookup('google.com');
      return result.isNotEmpty &&
          result.first.rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  Future<void> _sendToServer(BuildContext context) async {
    // 🔥 BLOKIR JIKA OFFLINE
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

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    await Future.delayed(const Duration(seconds: 2));
    Navigator.pop(context);

    // 🔥 HAPUS HIVE HANYA JIKA ONLINE
    await AttendanceHistoryService.clearHistory();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Berhasil'),
        content: const Text(
          'Data absensi berhasil dikirim ke server.',
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

                            // 🔥 STATUS ONLINE / OFFLINE
                            Row(
                              children: [
                                Icon(
                                  data.isOnline
                                      ? Icons.wifi
                                      : Icons.wifi_off,
                                  size: 14,
                                  color: data.isOnline
                                      ? Colors.green
                                      : Colors.orange,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  data.isOnline
                                      ? 'Online'
                                      : 'Offline',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: data.isOnline
                                        ? Colors.green
                                        : Colors.orange,
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
