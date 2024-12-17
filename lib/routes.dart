import 'package:flutter/material.dart';
import 'screens/loading_screen.dart';
import 'screens/intro_screen.dart';
import 'screens/sign_in_screen.dart';

class Routes {
  static const String loadingScreen = '/';
  static const String introScreen = '/intro';
  static const String signInScreen = '/sign-in';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      loadingScreen: (context) => const LoadingScreen(),
      introScreen: (context) => const IntroScreen(),
      signInScreen: (context) => const SignInScreen(),
    };
  }
}
