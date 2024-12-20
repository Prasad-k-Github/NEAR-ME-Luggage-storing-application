import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Builds a custom input field with optional password visibility toggle.
Widget buildInputField(String hint, bool isPassword, bool obscureText,
    VoidCallback togglePasswordVisibility,
    {VoidCallback? onTap, Widget? suffixIcon, EdgeInsets? contentPadding}) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 8,
          offset: const Offset(3, 7),
        ),
      ],
    ),
    child: TextField(
      obscureText: isPassword ? obscureText : false,
      readOnly: onTap != null,
      onTap: onTap,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFFFFFFF),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Color(0xFF7C7E9D),
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Color(0xFF7C7E9D),
                ),
                onPressed: togglePasswordVisibility,
              )
            : suffixIcon,
      ),
    ),
  );
}

/// Builds a social media button with the provided asset path.
Widget buildSocialButton(String assetPath) {
  return Container(
    width: 90,
    height: 45,
    decoration: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 8,
          offset: const Offset(3, 7),
        ),
      ],
    ),
    child: Center(
      child: Image.asset(
        assetPath,
        width: 24,
        height: 24,
      ),
    ),
  );
}

/// Builds an information card with a title and image.
Widget buildInfoCard(String title, String imagePath,
    {double imageHeight = 50, double imageWidth = double.infinity}) {
  return Container(
    width: 220,
    margin: const EdgeInsets.only(right: 12),
    padding: const EdgeInsets.all(16), // Increased padding
    decoration: BoxDecoration(
      color: const Color(0xFFFFFFFF),
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.3),
          blurRadius: 4,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              imagePath,
              height: imageHeight,
              width: imageWidth,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Center(
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'Arial',
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4C5372),
            ),
          ),
        ),
      ],
    ),
  );
}

/// Builds a navigation bar item with an icon and active state.
Widget buildNavBarItem({required bool isActive, required IconData icon}) {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: isActive
        ? const BoxDecoration(
            color: Color(0xFFE2D4E0),
            shape: BoxShape.circle,
          )
        : null,
    child: Icon(
      icon,
      size: 30,
      color: isActive ? const Color(0xFF4C5372) : Colors.white,
    ),
  );
}

/// Builds a custom bottom navigation bar with the provided selected index and onTap callback.
Widget buildBottomNavigationBar(
    int selectedIndex, Function(int) onTap, VoidCallback onCameraTap) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
    height: 65,
    decoration: BoxDecoration(
      color: const Color(0xFF4C5372), // Navigation bar background color
      borderRadius: BorderRadius.circular(30),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          blurRadius: 6,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildNavBarItem(
          icon: Icons.home,
          isActive: selectedIndex == 0,
          onTap: () => onTap(0),
        ),
        _buildNavBarItem(
          icon: Icons.description,
          isActive: selectedIndex == 1,
          onTap: () => onTap(1),
        ),
        // Camera Button
        GestureDetector(
          onTap: onCameraTap,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              color: Color(0xFF4C5372), // Camera button background color
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.camera_alt,
              size: 30,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
          ),
        ),
        _buildNavBarItem(
          icon: Icons.location_on,
          isActive: selectedIndex == 2,
          onTap: () => onTap(2),
        ),
        _buildNavBarItem(
          icon: Icons.person,
          isActive: selectedIndex == 3,
          onTap: () => onTap(3),
        ),
      ],
    ),
  );
}

/// Builds a navigation bar item with an icon, active state, and onTap callback.
Widget _buildNavBarItem({
  required IconData icon,
  required bool isActive,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(7.0),
      decoration: isActive
          ? const BoxDecoration(
              color: Color(0xFFFFFFFF), // Active item background color
              shape: BoxShape.circle,
            )
          : null, // No decoration for inactive items
      child: Icon(
        icon,
        size: 30,
        color: isActive ? const Color(0xFF4C5372) : Colors.white,
      ),
    ),
  );
}

/// Reusable button widget
Widget buildProfileButton({
  required String text,
  required Color color,
  required VoidCallback onPressed,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.mulish(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

/// Builds a custom AppBar with rounded corners and a title.
PreferredSizeWidget buildRoundedAppBar({
  required String title,
  double height = 100,
  Color backgroundColor = const Color(0xFF5A3C62),
  Color titleColor = Colors.white,
  double borderRadius = 40,
  double titleFontSize = 30,
}) {
  return PreferredSize(
    preferredSize: Size.fromHeight(height),
    child: ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(borderRadius),
        bottomRight: Radius.circular(borderRadius),
      ),
      child: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          title,
          style: GoogleFonts.mulish(
            fontSize: titleFontSize,
            fontWeight: FontWeight.w900,
            color: titleColor,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
    ),
  );
}
