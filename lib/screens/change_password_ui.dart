import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePasswordUI extends StatelessWidget {
  const ChangePasswordUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2D4E0), // Background Color
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // Password Title
              Center(
                child: Text(
                  "PASSWORD",
                  style: GoogleFonts.mulish(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF4C5372),
                    letterSpacing: 1.5,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Password Image
              Center(
                child: Image.asset(
                  'assets/images/password.png',
                  height: 150,
                  width: 150,
                ),
              ),

              const SizedBox(height: 40),

              // Instruction Text
              Center(
                child: Text(
                  "Click the button below to change your password. Then check your email.",
                  style: GoogleFonts.mulish(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF4C5372),
                    letterSpacing: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 40),

              // Send Password Change Link Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5A3C62), // Button Color
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // Logic to send password change link
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Password change link sent."),
                      ),
                    );
                  },
                  child: Text(
                    "Send Password Change Link",
                    style: GoogleFonts.mulish(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
