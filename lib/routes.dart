import 'package:flutter/material.dart';
import 'screens/loading_screen.dart';
import 'screens/intro_screen.dart';
import 'screens/sign_in_screen.dart';
import 'screens/home_screen.dart';

class Routes {
  static const String loadingScreen = '/';
  static const String introScreen = '/intro';
  static const String signInScreen = '/sign-in';
  static const String homeScreen = '/home';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      loadingScreen: (context) => const LoadingScreen(),
      introScreen: (context) => const IntroScreen(),
      signInScreen: (context) => const SignInScreen(),
      homeScreen: (context) => const HomeScreen(),
    };
  }
}
