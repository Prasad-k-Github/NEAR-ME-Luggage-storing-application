import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../routes.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    // Delay for 3 seconds and navigate to IntroScreen
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routes.introScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2D4E0), // Background Color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Main Text: NEAR ME
            Text(
              "NEAR ME",
              style: GoogleFonts.mulish(
                fontSize: 64.0,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF4C5372), // Text Color
                letterSpacing: 1.5,
              ),
            ),
            const SizedBox(height: 12.0), // Spacing between text
            // Subtitle Text
            Text(
              "Luggage Storage, Simplified.",
              style: GoogleFonts.nokora(
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF7C7E9D), // Subtitle Color
                letterSpacing: 0.8,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
