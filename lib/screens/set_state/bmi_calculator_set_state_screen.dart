import 'package:bmi_calculator/component/app_button.dart';
import 'package:bmi_calculator/constant/app_color.dart';
import 'package:bmi_calculator/constant/app_textstyle.dart';
import 'package:bmi_calculator/screens/result_screen.dart';
import 'package:flutter/material.dart';


class BmiCalculatorSetStateScreen extends StatefulWidget {
  const BmiCalculatorSetStateScreen({super.key});
  

  @override
  State<BmiCalculatorSetStateScreen> createState() => _BmiCalculatorSetStateScreenState(); 
}
  

class _BmiCalculatorSetStateScreenState extends State<BmiCalculatorSetStateScreen> {
  int _age = 30;
  int _height = 175;
  int _weight = 78;
  bool _isMale = false;
  
  
  void _updateAge(bool isIncrement){
  setState((){
    if(isIncrement && _age<120){
      _age++;
    }else if(!isIncrement && _age>1){
      _age--;
    }
  });
  }
 void _updateWeight(bool isIncrement){
  setState((){
    if(isIncrement && _weight<300){
      _weight++;
    }else if(!isIncrement && _weight>10){
      _weight--;
    }
  });
 }
 
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body:Padding(
        padding: const EdgeInsets.only(top:54,bottom:93,left:30,right:30),
        child: Column(
          children:[
            Center(child: Text("BMI CALCULATOR",
            style:AppTextstyle.tsRegularSize18Navi)),
            SizedBox(height:39),
            Row(
              children:[
                _builtUserAgeWidget(),
                SizedBox(width:21),
                _builtUserWeightWidget()
              ]
            ),
            SizedBox(height: 23),
                _builtUserHeightWidget(),
            SizedBox(height:23),
                _builtUserGenderWidget(),
            SizedBox(height:31),
            AppButton(
              textButton: "Calculate BMI",
              color:AppColor.blueColor,
              textColor:AppColor.whiteColor,
              onTap:(){
                if (_weight > 0 && _height > 0) { 
                final double bmi = _weight / ((_height / 100) * (_height / 100));
                Navigator.push(context,MaterialPageRoute(builder: (context) => ResultScreen(bmi: bmi)));
              
              }
              }
              )
          ]
        ),
      ),
    );
    }
    
   Container _builtUserAgeWidget(){
      return Container(
                  padding:EdgeInsets.only(top:14),
                  width:(156/393) * MediaQuery.of(context).size.width ,
                  height:(175/852) * MediaQuery.of(context).size.height,
                  
                  decoration:BoxDecoration(
                    color:AppColor.whiteColor,
                    borderRadius:BorderRadius.circular(12)
                  ),
                  child:Column(
                    children:[
                        Text("Age",
                          style:AppTextstyle.tsRegularSize18),
                        Text(_age.toString(),
                        style:AppTextstyle.tsBoldSize58Navi),
                        SizedBox(height:3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                  ElevatedButton(
                                     onPressed: () => _updateAge(false),
                                     style: ElevatedButton.styleFrom(
                                     shape: CircleBorder(),
                                     backgroundColor: AppColor.naviColor, // <-- Button color
                                     foregroundColor: AppColor.whiteColor,), // <-- Splash color),
                                     child: Icon(Icons.remove),
                                    ),
                                  ElevatedButton(
                                     onPressed: () => _updateAge(true),
                                     style: ElevatedButton.styleFrom(
                                     shape: CircleBorder(),
                                     backgroundColor: AppColor.naviColor, // <-- Button color
                                     foregroundColor: AppColor.whiteColor,), // <-- Splash color),
                                     child: Icon(Icons.add),
                                    ),
                                  
                              ]
                            ),
                    ]
                  )
                );         
                
  }

   Container _builtUserWeightWidget(){
      return Container(
                  width:(156/393) * MediaQuery.of(context).size.width,
                  height:(175/852) * MediaQuery.of(context).size.height,
                  padding:EdgeInsets.only(top:14),
                  decoration:BoxDecoration(
                    color:AppColor.whiteColor,
                    borderRadius:BorderRadius.circular(12)
                  ),
                  child:Column(
                    children:[
                          Text("Weight (KG)",
                          style:AppTextstyle.tsRegularSize18),
                        Text(_weight.toString(),
                        style:AppTextstyle.tsBoldSize58Navi),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                   ElevatedButton(
                                     onPressed:()=> _updateWeight(false),
                                     style: ElevatedButton.styleFrom(
                                     shape: CircleBorder(),
                                     backgroundColor: AppColor.naviColor, // <-- Button color
                                     foregroundColor: AppColor.whiteColor,), // <-- Splash color),
                                     child: Icon(Icons.remove),
                                    ),
                                  ElevatedButton(
                                     onPressed:()=>_updateWeight(true),
                                     style: ElevatedButton.styleFrom(
                                     shape: CircleBorder(),
                                     backgroundColor: AppColor.naviColor, // <-- Button color
                                     foregroundColor: AppColor.whiteColor,), // <-- Splash color),
                                     child: Icon(Icons.add),
                                    ),
                              ]
                            ),
                    ]
                  )
                );}
   Container _builtUserHeightWidget(){
                  return Container(
              height: (183/852)*MediaQuery.of(context).size.height,
              width: (333/393)*MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(12)
              ),
              child: Padding(
                padding: const EdgeInsets.only(left :28,right:28,top:8),
                child: Column(
                  children: [
                    Text("Height (CM)",style:AppTextstyle.tsRegularSize18Navi),
                    
                    Text(_height.toString(),
                    style:AppTextstyle.tsBoldSize58Navi),
                    Slider(
                      onChanged:(value) => setState(() {
                        _height = value.toInt();
                      }),
                      
                      value: _height.toDouble(),
                      min: 50,
                      max: 300,
                      activeColor: AppColor.naviColor,
                      inactiveColor: AppColor.greyColor,  
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("50cm"),
                        Text("300cm")
                      ],
                    )
                  ]
                ),
              ),
            );
                }

   Container _builtUserGenderWidget(){
    return Container(
              decoration: BoxDecoration(
                color:AppColor.whiteColor,
                borderRadius: BorderRadius.circular(12)
              ),
              width:(333/393)* MediaQuery.of(context).size.width,
              height:(135/852)*MediaQuery.of(context).size.height,
              child:Padding(
                padding: const EdgeInsets.only(top:14),
                child: Column(
                  children:[
                    Text("Gender",style:AppTextstyle.tsRegularSize18),
                    Row(
                      
                      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                      children:[
                        Text("Male",style:AppTextstyle.tsRegularSize18),
                        Switch(
                          activeTrackColor:AppColor.blueColor,
                        
                          activeThumbColor:AppColor.backgroundColor,
                          value: _isMale,
                          onChanged: (value) {
                          setState(() {
                          _isMale = value;
                               });
                               },
                             ),
                         Text("Female",style:AppTextstyle.tsRegularSize18)    
                      ]
                    )
                  ]
                        
                ),
              )
            );
   }
}