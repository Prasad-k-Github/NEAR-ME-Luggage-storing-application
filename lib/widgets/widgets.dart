import 'package:flutter/material.dart';

Widget buildInputField(String hint, bool isPassword, bool obscureText,
    VoidCallback togglePasswordVisibility) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFFE2D4E0),
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
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFE2D4E0),
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
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Color(0xFF7C7E9D),
                ),
                onPressed: togglePasswordVisibility,
              )
            : null,
      ),
    ),
  );
}

Widget buildSocialButton(String assetPath) {
  return Container(
    width: 90,
    height: 45,
    decoration: BoxDecoration(
      color: const Color(0xFFE2D4E0),
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
