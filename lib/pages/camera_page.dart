import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> with WidgetsBindingObserver {
  CameraController? _controller;
  List<CameraDescription> _cameras = [];
  CameraDescription? _currentCamera;

  int _cameraIndex = 0;
  bool _isLoading = true;
  bool _isTakingPicture = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _setupCamera();
  }

  Future<void> _setupCamera() async {
    try {
      _cameras = await availableCameras();
      if (_cameras.isEmpty) {
        setState(() {
          _errorMessage = "No se encontraron camaras";
          _isLoading = false;
        });

        return;
      }

      _cameraIndex = 0;
      await _initializeCamera(_cameras[_cameraIndex]);
    } on CameraException catch (e) {
      print(e);
    }
  }

  Future<void> _initializeCamera(CameraDescription camera) async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    await _controller?.dispose();

    final newController = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    _controller = newController;
    _currentCamera = camera;

    try {
      await newController.initialize();
      if (!mounted) {
        return;
      }

      setState(() {
        _isLoading = false;
      });
    } on CameraException catch (e) {
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
