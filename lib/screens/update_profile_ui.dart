import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/widgets.dart';
import '../routes.dart';

class UpdateProfileUI extends StatelessWidget {
  const UpdateProfileUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2D4E0),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),

            // Profile Title
            Text(
              "PROFILE",
              style: GoogleFonts.mulish(
                fontSize: 35,
                fontWeight: FontWeight.w900,
                color: const Color(0xFF4C5372),
                letterSpacing: 1.5,
              ),
            ),

            const SizedBox(height: 20),

            // Profile Image
            Image.asset(
              'assets/images/profile.png',
              height: 250,
              width: 500,
            ),

            const SizedBox(height: 20),

            // Update Profile Button
            buildProfileButton(
              text: "Update Profile",
              color: const Color(0xFF3A6A68),
              onPressed: () {
                Navigator.pushNamed(context, Routes.updateProfileDetailsScreen);
              },
            ),

            const SizedBox(height: 20),

            // Change Password Button
            buildProfileButton(
              text: "Change Password",
              color: const Color(0xFF5A3C62),
              onPressed: () {
                Navigator.pushNamed(context, Routes.changePasswordScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
