import 'package:bmi_calculator/component/app_button.dart';
import 'package:bmi_calculator/constant/app_color.dart';
import 'package:bmi_calculator/constant/app_textstyle.dart';
import 'package:bmi_calculator/routes/app_routes.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double? bmi;
  const ResultScreen({super.key, this.bmi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(
          top: 54,
          bottom: 93,
          left: 30,
          right: 30,
        ),
        child: Column(
          children: [
            Center(
              child: Text(
                "BMI CALCULATOR",
                style: AppTextstyle.tsRegularSize18Navi,
              ),
            ),
            SizedBox(height: 67),
            Text("Body Mass Index", style: AppTextstyle.tsRegularSize28Navi),
            SizedBox(height: 42),
            Container(
              padding: EdgeInsets.only(top: 14),
              width: (333 / 393) * MediaQuery.of(context).size.width,
              height: (416 / 852) * MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    "BMI Results",
                    style: AppTextstyle.tsRegularSize28Navi.copyWith(
                      fontSize: 32,
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              bmi?.toStringAsFixed(2).split('.')[0] ??
                              '0', // 22
                          style: AppTextstyle.tsBoldSize58Navi.copyWith(
                            fontSize: 141,
                          ),
                        ),
                        TextSpan(
                          text:
                              '.${bmi?.toStringAsFixed(2).split('.')[1] ?? '0'}', // .54
                          style: AppTextstyle.tsBoldSize58Navi.copyWith(
                            fontSize: 43,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    _getBMICategory(bmi ?? 0),
                    style: AppTextstyle.tsMediumSize24Navi,
                  ),
                  SizedBox(height: 18),
                  Center(
                    child: Text(
                      "Underweight: BMI less than 18.5\nNormal weight: BMI 18.5 to 24.9\nOverweight: BMI 25 to 29.9\nObesity: BMI 30 to 40",
                      style: AppTextstyle.tsMediumSize24Navi.copyWith(
                        fontSize: 13,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50),
            AppButton(
              textButton: "Save the result",
              color: AppColor.blueColor,
              textColor: AppColor.whiteColor,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.bmiCalculatorSetStateScreen,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  String _getBMICategory(double bmi) {
    if (bmi < 18.5) {
      return 'Under BMI';
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return 'Normal BMI';
    } else if (bmi >= 25 && bmi < 29.9) {
      return 'Over BMI';
    } else {
      return 'Obesity BMI';
    }
  }
}
