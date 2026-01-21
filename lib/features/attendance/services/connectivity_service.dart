import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  static final Connectivity _connectivity = Connectivity();

  static final StreamController<bool> _controller =
      StreamController<bool>.broadcast();

  
  static bool _lastStatus = false;

 
  static Stream<bool> get onlineStatusStream async* {

    yield _lastStatus;


    yield* _controller.stream;
  }


  static void initialize() {
    _checkInternet();

    _connectivity.onConnectivityChanged.listen((_) {
      _checkInternet();
    });
  }


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

    
    if (hasInternet != _lastStatus) {
      _lastStatus = hasInternet;
      _controller.add(hasInternet);
    }
  }

  
  static bool get currentStatus => _lastStatus;

  static void dispose() {
    _controller.close();
  }
}
