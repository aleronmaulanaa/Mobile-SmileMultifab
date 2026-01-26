import 'package:flutter/material.dart';

class BackButtonMap extends StatelessWidget {
  const BackButtonMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      elevation: 4,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: () => Navigator.pop(context),
        child: const SizedBox(
          width: 44,
          height: 44,
          child: Icon(Icons.arrow_back, size: 22),
        ),
      ),
    );
  }
}
