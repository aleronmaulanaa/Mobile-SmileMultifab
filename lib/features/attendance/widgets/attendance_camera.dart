import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class AttendanceCamera extends StatefulWidget {
  final Function(File image) onCapture;

  const AttendanceCamera({
    super.key,
    required this.onCapture,
  });

  @override
  State<AttendanceCamera> createState() => _AttendanceCameraState();
}

class _AttendanceCameraState extends State<AttendanceCamera> {
  CameraController? _controller;
  bool _isCameraAvailable = true;
  bool _isLoading = true;
  bool _isTakingPicture = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

Future<void> _initCamera() async {
  try {
    final cameras = await availableCameras();

    if (cameras.isEmpty) {
      setState(() {
        _isCameraAvailable = false;
        _isLoading = false;
      });
      return;
    }

    // 🔥 PRIORITAS KAMERA DEPAN
    CameraDescription selectedCamera;

    try {
      selectedCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.front,
      );
    } catch (_) {
      // fallback → kamera belakang
      selectedCamera = cameras.first;
    }

    _controller = CameraController(
      selectedCamera,
      ResolutionPreset.medium,
      enableAudio: false,
    );

    await _controller!.initialize();

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  } catch (e) {
    debugPrint("Camera error: $e");
    if (mounted) {
      setState(() {
        _isCameraAvailable = false;
        _isLoading = false;
      });
    }
  }
}


  Future<void> _takePicture() async {
    if (_controller == null ||
        !_controller!.value.isInitialized ||
        _isTakingPicture) return;

    try {
      setState(() {
        _isTakingPicture = true;
      });

      final XFile file = await _controller!.takePicture();
      widget.onCapture(File(file.path));
    } catch (e) {
      debugPrint("Take picture error: $e");
    } finally {
      if (mounted) {
        setState(() {
          _isTakingPicture = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!_isCameraAvailable || _controller == null) {
      return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Text(
          "Camera tidak tersedia\nGunakan device fisik",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black54),
        ),
      );
    }

    return Stack(
      children: [
        // ================= CAMERA PREVIEW
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: AspectRatio(
            aspectRatio: 3 / 4,
            child: CameraPreview(_controller!),
          ),
        ),

        // ================= OVERLAY BUTTON
        Positioned(
          bottom: 16,
          left: 0,
          right: 0,
          child: Center(
            child: GestureDetector(
              onTap: _takePicture,
              child: Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                child: _isTakingPicture
                    ? const Padding(
                        padding: EdgeInsets.all(12),
                        child: CircularProgressIndicator(strokeWidth: 3),
                      )
                    : const Icon(
                        Icons.camera_alt,
                        size: 32,
                        color: Colors.black,
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
