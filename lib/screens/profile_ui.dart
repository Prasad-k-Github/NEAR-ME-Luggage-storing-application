import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/widgets.dart';
import '../routes.dart';

class ProfileUI extends StatelessWidget {
  const ProfileUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2D4E0),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              Center(
                child: Text(
                  "PROFILE",
                  style: GoogleFonts.mulish(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF4C5372),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // User Avatar
              Center(
                child: CircleAvatar(
                  radius: 70, // Increased radius
                  backgroundImage: AssetImage('assets/images/boy.png'),
                ),
              ),

              const SizedBox(height: 20),

              // User Name & Email
              Center(
                child: Column(
                  children: [
                    Text(
                      "User",
                      style: GoogleFonts.mulish(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFF4C5372),
                      ),
                    ),
                    Text(
                      "user@gmail.com",
                      style: GoogleFonts.mulish(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF7C7E9D),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Buttons: Edit Profile, Logout, Delete Profile
              buildProfileButton(
                text: "Edit Profile",
                color: const Color(0xFF3A6A68),
                onPressed: () {
                  Navigator.pushNamed(context, Routes.updateProfileScreen);
                },
              ),
              const SizedBox(height: 15),
              buildProfileButton(
                text: "Logout",
                color: const Color(0xFF4C5372),
                onPressed: () {
                  // Add Logout logic
                },
              ),
              const SizedBox(height: 15),
              buildProfileButton(
                text: "Delete profile",
                color: const Color(0xFF5A3C62),
                onPressed: () {
                  // Add Delete Profile logic
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
