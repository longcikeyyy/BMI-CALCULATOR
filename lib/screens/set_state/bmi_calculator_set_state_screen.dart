import 'package:bmi_calculator/component/app_button.dart';
import 'package:bmi_calculator/constant/app_color.dart';
import 'package:bmi_calculator/constant/app_textstyle.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';

class BmiCalculatorSetStateScreen extends StatefulWidget {
  const BmiCalculatorSetStateScreen({super.key});

  @override
  State<BmiCalculatorSetStateScreen> createState() =>
      _BmiCalculatorSetStateScreenState();
}

class _BmiCalculatorSetStateScreenState
    extends State<BmiCalculatorSetStateScreen> {
  int _age = 30;
  int _height = 175;
  int _weight = 78;
  bool _isMale = false;

  void _updateAge(bool isIncrement) {
    setState(() {
      if (_age <= 1) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Age cannot be less than 1 year")),
        );
        return;
      }
      if (isIncrement && _age < 120) {
        _age++;
      } else if (!isIncrement && _age > 1) {
        _age--;
      }
    });
  }

  void _updateWeight(bool isIncrement) {
    setState(() {
      if (_weight <= 10) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Weight cannot be less than 10 kg")),
        );
        return;
      }
      if (isIncrement && _weight < 300) {
        _weight++;
      } else if (!isIncrement && _weight > 10) {
        _weight--;
      }
    });
  }

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
                _buildAgeWeightWidget(
                  title: 'Age',
                  value: _age.toString(),
                  onMinusPressed: () => _updateAge(false),
                  onPlusPressed: () => _updateAge(true),
                ),
                SizedBox(width: 21),
                _buildAgeWeightWidget(
                  title: 'Weight',
                  value: _weight.toString(),
                  onMinusPressed: () => _updateWeight(false),
                  onPlusPressed: () => _updateWeight(true),
                ),
              ],
            ),
            SizedBox(height: 23),
            _builtUserHeightWidget(),
            SizedBox(height: 23),
            _builtUserGenderWidget(),
            SizedBox(height: 31),
            AppButton(
              textButton: "Calculate BMI",
              color: AppColor.blueColor,
              textColor: AppColor.whiteColor,
              onTap: () {
                if (_weight > 0 && _height > 0) {
                  final double bmi =
                      _weight / ((_height / 100) * (_height / 100));
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

  /// DRY -> Don't Repeat Yourself

  Container _buildAgeWeightWidget({
    required String title,
    required String value,
    required VoidCallback onMinusPressed,
    required VoidCallback onPlusPressed,
  }) {
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
          Text(title, style: AppTextstyle.tsRegularSize18),
          Text(value, style: AppTextstyle.tsBoldSize58Navi),
          SizedBox(height: 3),
          _buildMinusPlusButtonWidget(
            onMinusPressed: onMinusPressed,
            onPlusPressed: onPlusPressed,
          ),
        ],
      ),
    );
  }

  Row _buildMinusPlusButtonWidget({
    required VoidCallback onMinusPressed,
    required VoidCallback onPlusPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: onMinusPressed,
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: AppColor.naviColor,
            foregroundColor: AppColor.whiteColor,
          ),
          child: Icon(Icons.remove),
        ),
        ElevatedButton(
          onPressed: () => onPlusPressed,
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            backgroundColor: AppColor.naviColor,
            foregroundColor: AppColor.whiteColor,
          ),
          child: Icon(Icons.add),
        ),
      ],
    );
  }

  Container _builtUserHeightWidget() {
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
            Text(_height.toString(), style: AppTextstyle.tsBoldSize58Navi),
            Slider(
              onChanged: (value) => setState(() {
                _height = value.toInt();
              }),
              padding: EdgeInsets.zero,
              value: _height.toDouble(),
              min: 50,
              max: 300,
              activeColor: AppColor.naviColor,
              inactiveColor: AppColor.greyColor,
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("50cm"), Text("300cm")],
            ),
          ],
        ),
      ),
    );
  }

  Container _builtUserGenderWidget() {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      width: (333 / 393) * MediaQuery.of(context).size.width,
      height: (135 / 852) * MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Gender", style: AppTextstyle.tsRegularSize18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Male", style: AppTextstyle.tsRegularSize18),
              Switch(
                activeTrackColor: AppColor.blueColor,
                activeThumbColor: AppColor.backgroundColor,
                value: _isMale,
                onChanged: (value) {
                  setState(() {
                    _isMale = value;
                  });
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
