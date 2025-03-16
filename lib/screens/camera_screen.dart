import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _cameraController;
  List<CameraDescription>? cameras;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    // Request camera and storage permissions
    await Permission.camera.request();
    await Permission.storage.request();

    // Initialize the camera after permissions are granted
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    // Get the list of available cameras
    cameras = await availableCameras();

    // Initialize the camera controller with the first camera
    if (cameras!.isNotEmpty) {
      _cameraController = CameraController(
        cameras![0],
        ResolutionPreset.high,
        imageFormatGroup: ImageFormatGroup.jpeg,
      );

      // Initialize the controller
      await _cameraController!.initialize();

      // Set the flash mode to off
      await _cameraController!.setFlashMode(FlashMode.off);

      setState(() {
        _isCameraInitialized = true;
      });
    }
  }

  Future<void> _takePhoto() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      try {
        // Capture the photo
        final XFile photo = await _cameraController!.takePicture();

        // Get the directory to save the photo
        final directory = await getExternalStorageDirectory();
        final String filePath = '${directory!.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

        // Save the photo to the device
        await photo.saveTo(filePath);

        // Optionally, show a message or perform additional actions
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Photo saved to $filePath')),
        );
      } catch (e) {
        print('Error taking photo: $e');
      }
    }
  }


  @override
  void dispose() {
    // Dispose the camera controller when the widget is disposed
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: _isCameraInitialized
                ? CameraPreview(_cameraController!)
                : const Center(child: CircularProgressIndicator()),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _takePhoto,
              child: const Text('Capture Photo'),
            ),
          ),
        ],
      ),
    );
  }
}
