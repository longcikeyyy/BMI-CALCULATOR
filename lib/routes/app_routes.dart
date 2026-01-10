
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:bmi_calculator/screens/set_state/bmi_calculator_set_state_screen.dart';
import 'package:bmi_calculator/screens/splash_screen.dart';
import 'package:bmi_calculator/screens/stateful_builder/bmi_calculator_stateful_builder_screen.dart';
import 'package:bmi_calculator/screens/value_listenable_builder/bmi_calculator_value_listenable_builder_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  /// Define all routes in the application
  static const String splashScreen = '/splashScreen';
  static const String bmiCalculatorSetStateScreen = '/bmiCalculatorSetStateScreen';
  static const String resultScreen = '/resultScreen';
  static const String bmiCalculatorStatefulBuilderScreen = '/bmiCalculatorStatefulBuilderScreen';
  static const String bmiCalculatorValueListenableBuilderScreen = '/bmiCalculatorValueListenableBuilderScreen';
  /// routes map
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRoutes.splashScreen: (context) =>  SplashScreen(),
    AppRoutes.bmiCalculatorSetStateScreen: (context) =>  BmiCalculatorSetStateScreen(),
    AppRoutes.resultScreen: (context) =>  ResultScreen(),
    AppRoutes.bmiCalculatorStatefulBuilderScreen: (context) =>  BmiCalculatorStatefulBuilderScreen(),
    AppRoutes.bmiCalculatorValueListenableBuilderScreen: (context) =>  BmiCalculatorValueListenableScreen(),
  };
}
