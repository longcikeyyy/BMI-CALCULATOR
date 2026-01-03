import 'package:bmi_calculator/component/app_button.dart';
import 'package:bmi_calculator/constant/app_color.dart';
import 'package:bmi_calculator/constant/app_path.dart';
import 'package:bmi_calculator/constant/app_textstyle.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body:Column(
        children: [
          SizedBox(height: 81),
          Center(
            child: Text("BMiDO",
            style:AppTextstyle.tsItalicSize31White,),
          ),
          SizedBox(height: 59),
          Image.asset(AppPath.imgPersonWithBike),
          SizedBox(height: 95),
          Text("Get Started with\nTracking Your Health!",
          style: AppTextstyle.tsBoldSize25White),
          SizedBox(height:15),
          Text("Calculate your BMI and stay on top of\nyour wellness journey, effortlessly.",
          style: AppTextstyle.tsRegularSize16White.copyWith(
            color:Color(0xFFC6C3F9)
          )),
          SizedBox(height:38),
       AppButton(textButton: "Get Started"),   
        ],
      )
    );
  }
}