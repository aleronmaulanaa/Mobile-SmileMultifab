import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  static final Connectivity _connectivity = Connectivity();

  static final StreamController<bool> _controller =
      StreamController<bool>.broadcast();

  // 🔥 SIMPAN STATUS TERAKHIR
  static bool _lastStatus = false;

  /// STREAM ONLINE / OFFLINE (STATEFUL)
  static Stream<bool> get onlineStatusStream async* {
    // emit status terakhir dulu ke subscriber baru
    yield _lastStatus;

    // lalu emit perubahan berikutnya
    yield* _controller.stream;
  }

  /// INIT SEKALI DI main.dart
  static void initialize() {
    _checkInternet();

    _connectivity.onConnectivityChanged.listen((_) {
      _checkInternet();
    });
  }

  /// CEK INTERNET BENERAN
  static Future<void> _checkInternet() async {
    bool hasInternet = false;

    try {
      final result =
          await InternetAddress.lookup('google.com');
      hasInternet = result.isNotEmpty &&
          result.first.rawAddress.isNotEmpty;
    } catch (_) {
      hasInternet = false;
    }

    // emit hanya kalau berubah
    if (hasInternet != _lastStatus) {
      _lastStatus = hasInternet;
      _controller.add(hasInternet);
    }
  }

  /// AMBIL STATUS SAAT INI (SINKRON)
  static bool get currentStatus => _lastStatus;

  static void dispose() {
    _controller.close();
  }
}
