import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UpdateProfileDetailsUI extends StatelessWidget {
  const UpdateProfileDetailsUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2D4E0), // Background Color
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),

              // Profile Title
              Center(
                child: Text(
                  "PROFILE",
                  style: GoogleFonts.mulish(
                    fontSize: 35,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF4C5372),
                    letterSpacing: 1.5,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // User Avatar
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                    border: Border.all(
                      color: const Color(0xFF4C5372),
                      width: 4,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 70, // Increased radius
                    backgroundImage: const AssetImage('assets/images/boy.png'),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Name Input Field
              _buildInputField(hintText: "Name"),
              const SizedBox(height: 20),

              // Phone Number Input Field
              _buildInputField(hintText: "Phone No"),
              const SizedBox(height: 20),

              // Address Input Field
              _buildInputField(hintText: "Address"),
              const SizedBox(height: 40),

              // Update Profile Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5A3C62),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    // Add Update Profile Logic
                  },
                  child: Text(
                    "Update Profile",
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

  // Input Field Widget
  Widget _buildInputField({required String hintText}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE2D4E0),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xFF7C7E9D),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        ),
      ),
    );
  }
}
