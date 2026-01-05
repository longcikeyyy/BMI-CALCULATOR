
import 'package:bmi_calculator/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  /// Define all routes in the application
  static const String splashScreen = '/splashScreen';
  /// routes map
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.splashScreen: (context) => const SplashScreen(),
   
  };
}
