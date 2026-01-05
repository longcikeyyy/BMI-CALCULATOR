
import 'package:bmi_calculator/screens/set_state/bmi_calculator_set_state_screen.dart';
import 'package:bmi_calculator/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  /// Define all routes in the application
  static const String splashScreen = '/splashScreen';
  static const String bmiCalculatorSetStateScreen = '/bmiCalculatorSetStateScreen';
  /// routes map
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.splashScreen: (context) => const SplashScreen(),
    AppRoutes.bmiCalculatorSetStateScreen: (context) =>  BmiCalculatorSetStateScreen(),
  };
}
