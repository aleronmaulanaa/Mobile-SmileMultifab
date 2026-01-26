import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import 'package:mobile_smile_multifab/shared/widgets/base_background_scaffold.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool _isOnline = true;
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  final int testSpLevel = 3;
  final bool testSyncIcon = true;

  @override
  void initState() {
    super.initState();
    _initConnectivity();
    _connectivitySubscription = Connectivity()
        .onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      _updateConnectionStatus(results);
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> _initConnectivity() async {
    late List<ConnectivityResult> results;
    try {
      results = await Connectivity().checkConnectivity();
    } catch (e) {
      return;
    }
    if (!mounted) return;
    _updateConnectionStatus(results);
  }

  void _updateConnectionStatus(List<ConnectivityResult> results) {
    if (results.contains(ConnectivityResult.none)) {
      setState(() {
        _isOnline = false;
      });
    } else {
      setState(() {
        _isOnline = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    return BaseBackgroundScaffold(

      isOnline: _isOnline,

      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 115, bottom: 30),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),

        ),
      ),
    );
  }
}
