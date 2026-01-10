import 'package:bmi_calculator/component/app_button.dart';
import 'package:bmi_calculator/constant/app_color.dart';
import 'package:bmi_calculator/constant/app_textstyle.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';

final ValueNotifier<int> ageNotifier = ValueNotifier<int>(30);
final ValueNotifier<int> weightNotifier = ValueNotifier<int>(78);
final ValueNotifier<int> heightNotifier = ValueNotifier<int>(175);
final ValueNotifier<bool> isMaleNotifier = ValueNotifier<bool>(false);

class BmiCalculatorValueListenableScreen extends StatelessWidget {
  const BmiCalculatorValueListenableScreen({super.key});

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
            SizedBox(height: 39),
            Row(
              children: [
                _buildAgeWidget(context, ageNotifier),
                SizedBox(width: 21),
                _buildWeightWidget(weightNotifier),
              ],
            ),
            SizedBox(height: 23),
            _buildHeightWidget(context, heightNotifier),
            SizedBox(height: 23),
            _buildGenderWidget(isMaleNotifier),
            SizedBox(height: 31),
            AppButton(
              textButton: "Calculate BMI",
              color: AppColor.blueColor,
              textColor: AppColor.whiteColor,
              onTap: () {
                final int weight = weightNotifier.value;
                final int height = heightNotifier.value;

                if (weight > 0 && height > 0) {
                  final double bmi = weight / ((height / 100) * (height / 100));
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
  }

  Container _buildAgeWidget(
    BuildContext context,
    ValueNotifier<int> ageNotifier,
  ) {
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
          ValueListenableBuilder(
            valueListenable: ageNotifier,
            builder: (context, age, child) {
              return Column(
                children: [
                  Text(age.toString(), style: AppTextstyle.tsBoldSize58Navi),
                  SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (ageNotifier.value > 0) {
                            ageNotifier.value--;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor:
                              AppColor.naviColor, // <-- Button color
                          foregroundColor: AppColor.whiteColor,
                        ), // <-- Splash color),
                        child: Icon(Icons.remove),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (ageNotifier.value < 120) {
                            ageNotifier.value++;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor:
                              AppColor.naviColor, // <-- Button color
                          foregroundColor: AppColor.whiteColor,
                        ), // <-- Splash color),
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Container _buildWeightWidget(ValueNotifier<int> weightNotifier) {
    return Container(
      width: 156,
      height: 175,
      padding: EdgeInsets.only(top: 14),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text("Weight (KG)", style: AppTextstyle.tsRegularSize18),
          ValueListenableBuilder(
            valueListenable: weightNotifier,
            builder: (context, weight, child) {
              return Column(
                children: [
                  Text(weight.toString(), style: AppTextstyle.tsBoldSize58Navi),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (weightNotifier.value > 10) {
                            weightNotifier.value--;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: AppColor.naviColor,
                          foregroundColor: AppColor.whiteColor,
                        ),
                        child: Icon(Icons.remove),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (weightNotifier.value < 300) {
                            weightNotifier.value++;
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          backgroundColor: AppColor.naviColor,
                          foregroundColor: AppColor.whiteColor,
                        ),
                        child: Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Container _buildHeightWidget(
    BuildContext context,
    ValueNotifier<int> heightNotifier,
  ) {
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

            ValueListenableBuilder(
              valueListenable: heightNotifier,
              builder: (context, height, child) {
                return Column(
                  children: [
                    Text(
                      height.toString(),
                      style: AppTextstyle.tsBoldSize58Navi,
                    ),
                    Slider(
                      onChanged: (value) {
                        heightNotifier.value = value.toInt();
                      },
                      value: height.toDouble(),
                      min: 50,
                      max: 300,
                      activeColor: AppColor.naviColor,
                      inactiveColor: AppColor.greyColor,
                    ),
                  ],
                );
              },
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

  Container _buildGenderWidget(ValueNotifier<bool> isMaleNotifier) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      width: 333,
      height: 135,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Gender", style: AppTextstyle.tsRegularSize18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Male", style: AppTextstyle.tsRegularSize18),
              ValueListenableBuilder(
                valueListenable: isMaleNotifier,
                builder: (context, isMale, child) {
                  return Switch(
                    activeTrackColor: AppColor.blueColor,
                    activeThumbColor: AppColor.backgroundColor,
                    value: isMale,
                    onChanged: (value) {
                      isMaleNotifier.value = value;
                    },
                  );
                },
              ),
              Text("Female", style: AppTextstyle.tsRegularSize18),
            ],
          ),
        ],
      ),
    );
  }
}
