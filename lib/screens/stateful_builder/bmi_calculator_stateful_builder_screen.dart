import 'package:bmi_calculator/component/app_button.dart';
import 'package:bmi_calculator/constant/app_color.dart';
import 'package:bmi_calculator/constant/app_textstyle.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';

class BmiCalculatorStatefulBuilderScreen extends StatelessWidget {
  const BmiCalculatorStatefulBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int age = 30;
    int weight = 78;
    int height = 175;
    bool isMale = false;

    return StatefulBuilder(
      builder: (context, innerState) {
        void updateAge(bool isIncrement) {
          innerState(() {
            if (isIncrement && age < 120) {
              age++;
            } else if (!isIncrement && age > 1) {
              age--;
            }
          });
        }

        void updateWeight(bool isIncrement) {
          innerState(() {
            if (isIncrement && weight < 300) {
              weight++;
            } else if (!isIncrement && weight > 10) {
              weight--;
            }
          });
        }

        builtUserAgeWidget() {
          return Container(
            padding: EdgeInsets.only(top: 14),
            width: (156 / 393) * MediaQuery.of(context).size.width,
            height: (175 / 852) * MediaQuery.of(context).size.height,

            decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text("Age", style: AppTextstyle.tsRegularSize18),
                Text(age.toString(), style: AppTextstyle.tsBoldSize58Navi),
                SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => updateAge(false),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: AppColor.naviColor, // <-- Button color
                        foregroundColor: AppColor.whiteColor,
                      ), // <-- Splash color),
                      child: Icon(Icons.remove),
                    ),
                    ElevatedButton(
                      onPressed: () => updateAge(true),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: AppColor.naviColor, // <-- Button color
                        foregroundColor: AppColor.whiteColor,
                      ), // <-- Splash color),
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          );
        }

        builtUserWeightWidget() {
          return Container(
            width: (156 / 393) * MediaQuery.of(context).size.width,
            height: (175 / 852) * MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(top: 14),
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text("Weight (KG)", style: AppTextstyle.tsRegularSize18),
                Text(weight.toString(), style: AppTextstyle.tsBoldSize58Navi),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () => updateWeight(false),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: AppColor.naviColor, // <-- Button color
                        foregroundColor: AppColor.whiteColor,
                      ), // <-- Splash color),
                      child: Icon(Icons.remove),
                    ),
                    ElevatedButton(
                      onPressed: () => updateWeight(true),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        backgroundColor: AppColor.naviColor, // <-- Button color
                        foregroundColor: AppColor.whiteColor,
                      ), // <-- Splash color),
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          );
        }

        builtUserHeightWidget() {
          return Container(
            height: (183 / 852) * MediaQuery.of(context).size.height,
            width: (333 / 393) * MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 28, right: 28, top: 8),
              child: Column(
                children: [
                  Text("Height (CM)", style: AppTextstyle.tsRegularSize18Navi),

                  Text(height.toString(), style: AppTextstyle.tsBoldSize58Navi),
                  Slider(
                    onChanged: (value) => innerState(() {
                      height = value.toInt();
                    }),

                    value: height.toDouble(),
                    min: 50,
                    max: 300,
                    activeColor: AppColor.naviColor,
                    inactiveColor: AppColor.greyColor,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("50cm"), Text("300cm")],
                  ),
                ],
              ),
            ),
          );
        }

        builtUserGenderWidget() {
          return Container(
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.circular(12),
            ),
            width: (333 / 393) * MediaQuery.of(context).size.width,
            height: (135 / 852) * MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.only(top: 14),
              child: Column(
                children: [
                  Text("Gender", style: AppTextstyle.tsRegularSize18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Male", style: AppTextstyle.tsRegularSize18),
                      Switch(
                        activeTrackColor: AppColor.blueColor,

                        activeThumbColor: AppColor.backgroundColor,
                        value: isMale,
                        onChanged: (value) {
                          innerState(() {
                            isMale = value;
                          });
                        },
                      ),
                      Text("Female", style: AppTextstyle.tsRegularSize18),
                    ],
                  ),
                ],
              ),
            ),
          );
        }

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
                SizedBox(height: 39),
                Row(
                  children: [
                    builtUserAgeWidget(),

                    SizedBox(width: 21),
                    builtUserWeightWidget(),
                  ],
                ),
                SizedBox(height: 23),
                builtUserHeightWidget(),

                SizedBox(height: 23),
                builtUserGenderWidget(),

                SizedBox(height: 31),
                AppButton(
                  textButton: "Calculate BMI",
                  color: AppColor.blueColor,
                  textColor: AppColor.whiteColor,
                  onTap: () {
                    if (weight > 0 && height > 0) {
                      final double bmi =
                          weight / ((height / 100) * (height / 100));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(bmi: bmi),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
