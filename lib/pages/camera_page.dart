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

  Widget _buildCameraBody(CameraController? controller) {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    if (_errorMessage != null) {
      return Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(24),
          child: Text(
            _errorMessage!,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      );
    }

    if (controller == null || !controller.value.isInitialized) {
      return Center(
        child: Text(
          "Cámara no disponible",
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return Column(
      children: [
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              CameraPreview(controller),
              // Positioned(
              //   top: 10,
              //   left: 10,
              //   child: IconButton(
              //     onPressed: () {},
              //     icon: Icon(Icons.arrow_back),
              //   ),
              // ),
              Positioned(
                top: 10,
                right: 10,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.cameraswitch, color: Colors.white, size: 30),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,

                child: Container(
                  height: 120,
                  color: Colors.black,
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      print("Tomar foto");
                    },
                    child: Container(
                      width: 76,
                      height: 76,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 5),
                      ),
                      child: Center(
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: _buildCameraBody(controller)),
    );
  }
}
