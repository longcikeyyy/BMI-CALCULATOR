
import 'package:bmi_calculator/constant/app_color.dart';
import 'package:bmi_calculator/constant/app_textstyle.dart';
import 'package:flutter/material.dart';


class AppButton extends StatelessWidget {
  final String textButton;
  final Color? color;
  final Color? textColor;
  final Function()? onTap;

  const AppButton({super.key, required this.textButton, this.onTap,this.color,this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width - 31 - 30,
        height: 75,
        decoration: BoxDecoration(color: color ?? AppColor.buttonColor, 
        borderRadius: BorderRadius.circular(63)
        ),
        alignment: Alignment.center,
        child: Text(
          textButton,
          style: AppTextstyle.tsMediumSize18White.copyWith(
            color: textColor ?? AppColor.naviColor,
          ),
        ),
      ),
    );
  }
}
