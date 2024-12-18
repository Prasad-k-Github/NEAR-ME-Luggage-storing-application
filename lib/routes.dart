import 'package:flutter/material.dart';
import 'screens/loading_screen.dart';
import 'screens/intro_screen.dart';
import 'screens/sign_in_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_ui.dart';
import 'screens/update_profile_ui.dart';
import 'screens/update_profile_details_ui.dart';
import 'screens/change_password_ui.dart';

class Routes {
  static const String loadingScreen = '/';
  static const String introScreen = '/intro';
  static const String signInScreen = '/sign-in';
  static const String homeScreen = '/home';
  static const String profileScreen = '/profile';
  static const String updateProfileScreen = '/update-profile';
  static const String updateProfileDetailsScreen = '/update-profile-details';
  static const String changePasswordScreen = '/change-password';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      loadingScreen: (context) => const LoadingScreen(),
      introScreen: (context) => const IntroScreen(),
      signInScreen: (context) => const SignInScreen(),
      homeScreen: (context) => const HomeScreen(),
      profileScreen: (context) => const ProfileUI(),
      updateProfileScreen: (context) => const UpdateProfileUI(),
      updateProfileDetailsScreen: (context) => const UpdateProfileDetailsUI(),
      changePasswordScreen: (context) => const ChangePasswordUI(),
    };
  }
}
