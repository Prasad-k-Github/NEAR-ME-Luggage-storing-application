import 'package:flutter/material.dart';
import '../routes.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> _subtitles = [
    "Store Your Bags Securely Anywhere",
    "Find Nearby Storage Locations",
    "Easy and Convenient Booking"
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onNextPressed() {
    if (_currentIndex == 2) {
      Navigator.pushReplacementNamed(context, Routes.signInScreen);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _onSkipPressed() {
    Navigator.pushReplacementNamed(context, Routes.signInScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2D4E0), // Background Color
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // PageView for scrolling between states
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _subtitles.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0), // Add padding to move content down
                    child: Stack(
                      children: [
                        Center(
                          child: AnimatedSwitcher(
                            duration: const Duration(milliseconds: 500),
                            transitionBuilder:
                                (Widget child, Animation<double> animation) {
                              return FadeTransition(
                                  opacity: animation, child: child);
                            },
                            child: Container(
                              key: ValueKey<int>(index),
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Image.asset(
                                'assets/images/intro_image_0${index + 1}.png', // Replace with your image path
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 8.0,
                          right: 32.0, // Move the Skip button a bit to the left
                          child: GestureDetector(
                            onTap: _onSkipPressed,
                            child: const Text(
                              "Skip",
                              style: TextStyle(
                                fontFamily: 'Arial',
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4C5372),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // Dots Indicator
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_subtitles.length,
                  (index) => _buildDot(index == _currentIndex)),
            ),
            const SizedBox(height: 20),

            // Subtitle Text
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: Text(
                _subtitles[_currentIndex],
                key: ValueKey<int>(_currentIndex),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Calibri',
                  fontSize: 16.0,
                  color: Color(0xFF7C7E9D),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Next Button
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4C5372), // Button color
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                onPressed: _onNextPressed,
                child: Text(
                  _currentIndex == 2 ? "GET STARTED" : "NEXT",
                  style: const TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE2D4E0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Function to create dots for the indicator
  Widget _buildDot(bool isActive) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      width: isActive ? 12 : 8,
      height: isActive ? 12 : 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF4C5372) : const Color(0xFF7C7E9D),
        shape: BoxShape.circle,
      ),
    );
  }
}
