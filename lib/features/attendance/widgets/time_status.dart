import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeStatus extends StatefulWidget {
  const TimeStatus({super.key});

  @override
  State<TimeStatus> createState() => _TimeStatusState();
}

class _TimeStatusState extends State<TimeStatus> {
  late Timer _timer;
  String _timeNow = '';

  @override
  void initState() {
    super.initState();
    _updateTime();

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (_) => _updateTime(),
    );
  }

  void _updateTime() {
    if (!mounted) return;
    setState(() {
      _timeNow = DateFormat('HH.mm.ss').format(DateTime.now());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_timeNow WIB',
      style: const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
