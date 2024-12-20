import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/widgets.dart';
import 'your_luggage_ui.dart';
import 'profile_ui.dart';
import 'pick_location.dart';
import 'camera_screen.dart'; // Import the CameraScreen
import 'package:camera/camera.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late List<Widget> _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      // Home Screen UI
      HomeUI(
        navigateToYourLuggage: _navigateToYourLuggage,
        navigateToPickLocation: _navigateToPickLocation,
      ),
      // Your Luggage UI
      YourLuggageUI(navigateToDropBags: _navigateToDropBags),
      // Pick Location Screen UI
      const PickLocation(),
      // Profile Screen UI
      ProfileUI(navigateToYourLuggage: _navigateToYourLuggage),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToYourLuggage() {
    setState(() {
      _selectedIndex = 1;
    });
  }

  void _navigateToDropBags() {
    setState(() {
      _selectedIndex = 2;
    });
  }

  void _navigateToPickLocation() {
    setState(() {
      _selectedIndex = 2;
    });
  }

  Future<void> _openCamera() async {
    try {
      final cameras = await availableCameras();
      final imagePath = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CameraScreen(camera: cameras.first),
        ),
      );

      if (imagePath != null) {
        debugPrint('Image captured at: $imagePath');
        // Handle the captured image path if needed
      }
    } catch (e) {
      debugPrint('Error opening camera: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2D4E0), // Background color
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
      ),
      bottomNavigationBar:
          buildBottomNavigationBar(_selectedIndex, _onItemTapped, _openCamera),
    );
  }
}

// Home Screen UI
class HomeUI extends StatelessWidget {
  final VoidCallback navigateToYourLuggage;
  final VoidCallback navigateToPickLocation;

  const HomeUI({
    super.key,
    required this.navigateToYourLuggage,
    required this.navigateToPickLocation,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text(
            "Welcome To",
            style: GoogleFonts.mulish(
              fontSize: 35,
              fontWeight: FontWeight.w900,
              color: const Color(0xFF4C5372),
            ),
          ),
          Text(
            "NEAR ME",
            style: GoogleFonts.mulish(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: const Color(0xFF5A3C62),
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 20),

          // Large Image Section
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ), // Add left and right padding
            child: Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'assets/images/large_image.png',
                  height: 80,
                  width: 80,
                ),
              ),
            ),
          ),
          const SizedBox(height: 25),

          // Horizontal Cards Section
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: SizedBox(
              height: 140,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                children: [
                  SingleChildScrollView(
                    child: buildInfoCard(
                      "Book on the app",
                      'assets/images/small_image_01.png',
                      imageHeight: 60,
                      imageWidth: 70,
                    ),
                  ),
                  SingleChildScrollView(
                    child: buildInfoCard(
                      "Enjoy the day",
                      'assets/images/small_image_02.png',
                      imageHeight: 60,
                      imageWidth: 80,
                    ),
                  ),
                  SingleChildScrollView(
                    child: buildInfoCard(
                      "Head to the location",
                      'assets/images/small_image_03.png',
                      imageHeight: 60,
                      imageWidth: 70,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Luggage Storage Section
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
            ), // Add left and right padding
            child: Container(
              height: 160,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFFFFFFF),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 6,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Luggage storage near you",
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C5372),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF8D5B8C),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    onPressed: navigateToPickLocation,
                    child: const Text(
                      "Find closest locations",
                      style: TextStyle(
                        fontFamily: 'Arial',
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
