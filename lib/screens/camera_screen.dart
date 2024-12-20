import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/services.dart';

class CameraScreen extends StatefulWidget {
  final CameraDescription camera;

  const CameraScreen({super.key, required this.camera});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  double _zoomLevel = 1.0;
  double _maxZoomLevel = 1.0;
  double _minZoomLevel = 1.0;

  Offset? _focusPoint;

  @override
  void initState() {
    super.initState();

    // Enter fullscreen mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    _initializeControllerFuture = _setupCameraController(widget.camera);
  }

  Future<void> _setupCameraController(CameraDescription camera) async {
    _controller = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
    );

    try {
      await _controller.initialize();
      _maxZoomLevel = await _controller.getMaxZoomLevel();
      _minZoomLevel = await _controller.getMinZoomLevel();
    } catch (e) {
      debugPrint('Error initializing camera: $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    // Exit fullscreen mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.dispose();
  }

  Future<void> _captureImage() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();
      if (!mounted) return;
      Navigator.pop(context, image.path); // Pass the image path back
    } catch (e) {
      debugPrint('Error capturing image: $e');
      _showErrorDialog();
    }
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: const Text('An error occurred while capturing the image.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  Future<void> _handleZoom(double scaleFactor) async {
    final newZoomLevel =
        (_zoomLevel * scaleFactor).clamp(_minZoomLevel, _maxZoomLevel);
    await _controller.setZoomLevel(newZoomLevel);
    setState(() {
      _zoomLevel = newZoomLevel;
    });
  }

  Future<void> _handleFocus(
      TapDownDetails details, BoxConstraints constraints) async {
    final dx = details.localPosition.dx / constraints.maxWidth;
    final dy = details.localPosition.dy / constraints.maxHeight;

    setState(() {
      _focusPoint = details.localPosition;
    });

    await _controller.setFocusPoint(Offset(dx, dy));
    debugPrint('Focus set to: $dx, $dy');

    // Remove focus indicator after a short duration
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _focusPoint = null;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              fit: StackFit
                  .expand, // Ensures the camera preview covers the screen
              children: [
                // Fullscreen Camera Preview
                GestureDetector(
                  onScaleUpdate: (details) async {
                    if (details.scale != 1.0) {
                      await _handleZoom(details.scale);
                    }
                  },
                  onTapDown: (details) async {
                    await _handleFocus(
                        details, BoxConstraints.tight(context.size!));
                  },
                  child: CameraPreview(_controller),
                ),

                // Focus Indicator
                if (_focusPoint != null)
                  Positioned(
                    left: _focusPoint!.dx - 30,
                    top: _focusPoint!.dy - 30,
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.yellow, width: 2),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),

                // Zoom Slider
                Positioned(
                  right: 16,
                  top: 100,
                  bottom: 100,
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Slider(
                      value: _zoomLevel,
                      min: _minZoomLevel,
                      max: _maxZoomLevel,
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey,
                      onChanged: (value) async {
                        setState(() {
                          _zoomLevel = value;
                        });
                        await _controller.setZoomLevel(value);
                      },
                    ),
                  ),
                ),

                // Capture Button
                Positioned(
                  bottom: 30,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: _captureImage,
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 6,
                                offset: const Offset(0, 3),
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            color: Colors.black,
                            size: 32,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Close Button
                Positioned(
                  top: 40,
                  left: 16,
                  child: IconButton(
                    icon:
                        const Icon(Icons.close, color: Colors.white, size: 28),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
