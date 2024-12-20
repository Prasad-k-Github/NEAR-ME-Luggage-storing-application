import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'update_profile_details_ui.dart';
import 'change_password_ui.dart';

class ProfileUI extends StatefulWidget {
  final VoidCallback navigateToYourLuggage;

  const ProfileUI({super.key, required this.navigateToYourLuggage});

  @override
  State<ProfileUI> createState() => _ProfileUIState();
}

class _ProfileUIState extends State<ProfileUI> {
  String _currentView = "Profile";
  void _switchView(String view) {
    setState(() {
      _currentView = view;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2D4E0),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
          child: AppBar(
            backgroundColor: const Color(0xFF5A3C62),
            title: Text(
              _currentView == "Profile"
                  ? "Profile"
                  : _currentView == "Edit Profile"
                      ? "Edit Profile"
                      : "Change Password",
              style: GoogleFonts.mulish(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: const Color(0xFFE2D4E0),
              ),
            ),
            centerTitle: true,
            elevation: 0,
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: Color(0xFFE2D4E0)),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              height: 150, // Adjusted height
              decoration: const BoxDecoration(
                color: Color(0xFF5A3C62),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(70),
                  bottomRight: Radius.circular(70),
                ),
              ),
              child: DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50, // Adjusted radius for a smaller avatar
                      backgroundImage:
                          const AssetImage('assets/images/boy.png'),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person, color: Color(0xFF4C5372)),
              title: Text(
                "Profile",
                style:
                    GoogleFonts.mulish(fontSize: 16, color: Color(0xFF4C5372)),
              ),
              onTap: () {
                Navigator.pop(context);
                _switchView("Profile");
              },
            ),
            ListTile(
              leading: const Icon(Icons.edit, color: Color(0xFF4C5372)),
              title: Text(
                "Edit Profile",
                style:
                    GoogleFonts.mulish(fontSize: 16, color: Color(0xFF4C5372)),
              ),
              onTap: () {
                Navigator.pop(context);
                _switchView("Edit Profile");
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock, color: Color(0xFF4C5372)),
              title: Text(
                "Change Password",
                style:
                    GoogleFonts.mulish(fontSize: 15, color: Color(0xFF4C5372)),
              ),
              onTap: () {
                Navigator.pop(context);
                _switchView("Change Password");
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Color(0xFF4C5372)),
              title: Text(
                "Logout",
                style:
                    GoogleFonts.mulish(fontSize: 16, color: Color(0xFF4C5372)),
              ),
              onTap: () {
                // Logic for Logout
              },
            ),
            ListTile(
              leading: const Icon(Icons.delete, color: Color(0xFF4C5372)),
              title: Text(
                "Delete Profile",
                style:
                    GoogleFonts.mulish(fontSize: 16, color: Color(0xFF4C5372)),
              ),
              onTap: () {
                // Logic for Delete Profile
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: _currentView == "Profile"
            ? _buildProfileView()
            : _currentView == "Edit Profile"
                ? const UpdateProfileDetailsUI()
                : const ChangePasswordUI(),
      ),
    );
  }

  Widget _buildProfileView() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 80),
          Center(
            child: Text(
              "KENULA",
              style: GoogleFonts.mulish(
                fontSize: 50,
                fontWeight: FontWeight.w900,
                color: const Color(0xFF4C5372),
              ),
            ),
          ),
          const SizedBox(height: 30),

          // Enhanced User Avatar
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
                radius: 100,
                backgroundImage: const AssetImage('assets/images/boy.png'),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // User Name & Email
          Center(
            child: Column(
              children: [
                Text(
                  "kenula@gmail.com",
                  style: GoogleFonts.mulish(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF4C5372),
                  ),
                ),
                Text(
                  "+94761234567",
                  style: GoogleFonts.mulish(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF7C7E9D),
                  ),
                ),
                const SizedBox(height: 20),
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
                  onPressed: widget.navigateToYourLuggage,
                  child: const Text(
                    "View your luggages",
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

          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
