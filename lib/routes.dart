import 'package:flutter/material.dart';
import 'screens/loading_screen.dart';
import 'screens/intro_screen.dart';
import 'screens/sign_in_screen.dart';
import 'screens/home_screen.dart';
import 'screens/profile_ui.dart';
import 'screens/update_profile_ui.dart';
import 'screens/update_profile_details_ui.dart';
import 'screens/change_password_ui.dart';
import 'screens/pick_location.dart';
import 'screens/drop_bags_ui.dart';
import 'screens/booking_ui.dart';
import 'screens/confirm_payment_ui.dart'; // Import ConfirmPaymentUI

class Routes {
  static const String loadingScreen = '/';
  static const String introScreen = '/intro';
  static const String signInScreen = '/sign-in';
  static const String homeScreen = '/home';
  static const String profileScreen = '/profile';
  static const String updateProfileScreen = '/update-profile';
  static const String updateProfileDetailsScreen = '/update-profile-details';
  static const String changePasswordScreen = '/change-password';
  static const String pickLocationScreen = '/pick-location';
  static const String dropBagsScreen = '/drop-bags';
  static const String bookingScreen = '/booking';
  static const String confirmPaymentScreen = '/confirm-payment';

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
      pickLocationScreen: (context) => const PickLocation(),
      dropBagsScreen: (context) => const DropBagsUI(),
      bookingScreen: (context) => const BookingUI(),
      confirmPaymentScreen: (context) => const ConfirmPaymentUI(),
    };
  }
}
