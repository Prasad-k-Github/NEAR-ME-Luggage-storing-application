import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/widgets.dart';
import '../routes.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final PageController _pageController = PageController();
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _toggleSignUp() {
    _pageController.animateToPage(
      _pageController.page == 0 ? 1 : 0,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _handleBackNavigation() {
    if (_pageController.page == 1) {
      _toggleSignUp();
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.confirmPaymentScreen);
    }
  }

  void _navigateToHome() {
    Navigator.of(context).pushReplacementNamed(Routes.homeScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFE2D4E0), // Background color
        child: SafeArea(
          child: PageView(
            controller: _pageController,
            physics: const BouncingScrollPhysics(),
            children: [
              _buildSignInPage(),
              _buildSignUpPage(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignInPage() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back Arrow
            const SizedBox(height: 10),
            AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(milliseconds: 500),
              child: IconButton(
                icon:
                    const Icon(Icons.arrow_back_ios, color: Color(0xFF4C5372)),
                onPressed: _handleBackNavigation,
              ),
            ),
            const SizedBox(height: 10),

            // Welcome Text
            Center(
              child: AnimatedOpacity(
                opacity: 1.0,
                duration: const Duration(milliseconds: 500),
                child: Text(
                  "SIGN IN",
                  style: GoogleFonts.mulish(
                    textStyle: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                      color: Color(0xFF4C5372),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Subtitle
            Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: Text(
                  "Login to your Account",
                  key: const ValueKey<bool>(false),
                  style: const TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF7C7E9D),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Email Input
            buildInputField(
                "Email", false, _obscureText, _togglePasswordVisibility),
            const SizedBox(height: 20),

            // Password Input
            buildInputField(
                "Password", true, _obscureText, _togglePasswordVisibility),
            const SizedBox(height: 30),

            // Sign In Button
            Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4C5372),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 135, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  onPressed: _navigateToHome, // Navigate to HomeScreen
                  child: const Text(
                    "Sign In",
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE2D4E0),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Or sign in with
            Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: const Text(
                  "- Or sign in with -",
                  key: ValueKey<bool>(false),
                  style: TextStyle(
                    fontFamily: 'Calibri',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7C7E9D),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSocialButton("assets/images/google_logo.png"),
                const SizedBox(width: 20),
                buildSocialButton("assets/images/facebook_logo.png"),
                const SizedBox(width: 20),
                buildSocialButton("assets/images/apple_logo.png"),
              ],
            ),
            const SizedBox(height: 40),

            // Sign Up Prompt
            Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: Text.rich(
                  key: const ValueKey<bool>(false),
                  TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(
                      fontFamily: 'Calibri',
                      fontSize: 14,
                      color: Color(0xFF7C7E9D),
                    ),
                    children: [
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: _toggleSignUp,
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              fontFamily: 'Calibri',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4C5372),
                            ),
                          ),
                        ),
                      ),
                    ],
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

  Widget _buildSignUpPage() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Back Arrow
            const SizedBox(height: 10),
            AnimatedOpacity(
              opacity: 1.0,
              duration: const Duration(milliseconds: 500),
              child: IconButton(
                icon:
                    const Icon(Icons.arrow_back_ios, color: Color(0xFF4C5372)),
                onPressed: _handleBackNavigation,
              ),
            ),
            const SizedBox(height: 10),

            // Welcome Text
            Center(
              child: AnimatedOpacity(
                opacity: 1.0,
                duration: const Duration(milliseconds: 500),
                child: Text(
                  "SIGN UP",
                  style: GoogleFonts.mulish(
                    textStyle: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                      color: Color(0xFF4C5372),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Subtitle
            Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: Text(
                  "Create a new Account",
                  key: const ValueKey<bool>(true),
                  style: const TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF7C7E9D),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Email Input
            buildInputField(
                "Email", false, _obscureText, _togglePasswordVisibility),
            const SizedBox(height: 20),

            // Create Password and Confirm Password
            buildInputField("Create Password", true, _obscureText,
                _togglePasswordVisibility),
            const SizedBox(height: 20),
            buildInputField("Confirm Password", true, _obscureText,
                _togglePasswordVisibility),
            const SizedBox(height: 30),

            // Sign Up Button
            Center(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4C5372),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 135, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                  onPressed: _navigateToHome, // Navigate to HomeScreen
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontFamily: 'Arial',
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE2D4E0),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Or sign up with
            Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: const Text(
                  "- Or sign up with -",
                  key: ValueKey<bool>(true),
                  style: TextStyle(
                    fontFamily: 'Calibri',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7C7E9D),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildSocialButton("assets/images/google_logo.png"),
                const SizedBox(width: 20),
                buildSocialButton("assets/images/facebook_logo.png"),
                const SizedBox(width: 20),
                buildSocialButton("assets/images/apple_logo.png"),
              ],
            ),
            const SizedBox(height: 40),

            // Sign In Prompt
            Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: Text.rich(
                  key: const ValueKey<bool>(true),
                  TextSpan(
                    text: "Already have an account? ",
                    style: const TextStyle(
                      fontFamily: 'Calibri',
                      fontSize: 14,
                      color: Color(0xFF7C7E9D),
                    ),
                    children: [
                      WidgetSpan(
                        child: GestureDetector(
                          onTap: _toggleSignUp,
                          child: const Text(
                            "Sign in",
                            style: TextStyle(
                              fontFamily: 'Calibri',
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4C5372),
                            ),
                          ),
                        ),
                      ),
                    ],
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
}
