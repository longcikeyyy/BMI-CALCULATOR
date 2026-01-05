import 'package:bmi_calculator/constant/app_color.dart';
import 'package:bmi_calculator/constant/app_textstyle.dart';
import 'package:flutter/material.dart';


class BmiCalculatorSetStateScreen extends StatefulWidget {
  const BmiCalculatorSetStateScreen({super.key});
  

  @override
  State<BmiCalculatorSetStateScreen> createState() => _BmiCalculatorSetStateScreenState(); 
}
  

class _BmiCalculatorSetStateScreenState extends State<BmiCalculatorSetStateScreen> {
  int age = 30;
  double height = 175;
  double weight = 78;
  void incrementAge() {
    setState(() {
      age++;
    });
  }
  void decrementAge() {
    setState(() {
      age--;
    });
  }
  String getAge() {
    return age.toString();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body:Column(
        children:[
          SizedBox(height:54,),
          Center(child: Text("BMI CALCULATOR",
          style:AppTextstyle.tsRegularSize18Navi)),
          SizedBox(height:39),
          Row(
            children:[
              Container(
                width:156,
                height:175,
                margin:EdgeInsets.only(left:30),
                decoration:BoxDecoration(
                  color:AppColor.whiteColor,
                  borderRadius:BorderRadius.circular(12)
                ),
                child:Column(
                  children:[
                      Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: Text("Age",
                        style:AppTextstyle.tsRegularSize18Navi.copyWith(
                          color:Color(0xFF2F2E41))),
                      ),
                      //SizedBox(height:3),
                      Text(getAge(),
                      style:AppTextstyle.tsBoldSize25White.copyWith(
                        color:AppColor.blueColor,fontSize:58)),
                   Flexible(
                     child: Row(
                            children:[
                                Padding(
                                  padding: const EdgeInsets.only(bottom:14),
                                  child: ElevatedButton(
                                   onPressed: () {
                                    setState(() {
                                      decrementAge();
                                    });
                                   },
                                   style: ElevatedButton.styleFrom(
                                   shape: CircleBorder(),
                                   backgroundColor: AppColor.naviColor, // <-- Button color
                                   foregroundColor: AppColor.whiteColor,), // <-- Splash color),
                                   child: Icon(Icons.remove),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom:14),
                                  child: ElevatedButton(
                                   onPressed: () {
                                    setState(() {
                                      incrementAge();
                                    });
                                   },
                                   style: ElevatedButton.styleFrom(
                                   shape: CircleBorder(),
                                   backgroundColor: AppColor.naviColor, // <-- Button color
                                   foregroundColor: AppColor.whiteColor,), // <-- Splash color),
                                   child: Icon(Icons.add),
                                  ),
                                ),
                            ]
                          ),
                   ),
                  ]
                )
              )
            ]
          )
        ]
      )
    );
    
  }


}