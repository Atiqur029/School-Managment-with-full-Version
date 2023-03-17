


import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' ;
import 'package:timer_builder/timer_builder.dart';

import '../../clock/model/timemodel.dart';
import '../../clock/view/addjustime.dart';

class TimeofDay extends StatefulWidget {
  const TimeofDay({super.key});

  @override
  State<TimeofDay> createState() => _TimeofDayState();
}

class _TimeofDayState extends State<TimeofDay> {
  final colorizeColors = [
  Colors.purple,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];
final colorizeTextStyle = TextStyle(
  fontSize: 20.sp,
  fontWeight: FontWeight.bold,
  fontFamily: 'Horizon',
);

  @override
  Widget build(BuildContext context) {
    var date=DateTime.now();
    String day = DateFormat('EEEE').format(date);
      
    return TimerBuilder.periodic(const Duration(seconds: 1), builder: ((context) {
      
     
          
              String timeformates=DateFormat('hh:mm:ss a').format(DateTime.now());
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 30.h,
                      padding: EdgeInsets.only(left: 10.w,right: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                           Text("Today",style: TextStyle(fontSize: 18.sp,color:Colors.black,fontWeight: FontWeight.w500),),
                          
                           Text('${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',style: TextStyle(fontSize: 18.sp,color: Color.fromARGB(255, 114, 105, 240),fontWeight: FontWeight.w500)),
                    
                    
                          Text(timeformates,style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.bold,color: Colors.deepPurple),),
                    
                        ],
                        
                      ),
                    ),
                    SizedBox(height: 5.h,),
                    
                    //Container(child: Text(dateFormat,style: TextStyle(fontSize: 18.sp,color:const Color.fromARGB(255, 134, 118, 93),fontWeight: FontWeight.w500),)),
                    
                    
                    
                    Center(
                      child: AddjustTime (TimeModel(hour: DateTime.now().hour,min: DateTime.now().minute,sec: DateTime.now().second))
                    
                    ),
                 
                    SizedBox(
                    
              width: 220.w,
            child: Center(
            child: AnimatedTextKit(
           animatedTexts: [
      ColorizeAnimatedText(
        
        
        day,
        textStyle: colorizeTextStyle,
        colors: colorizeColors,
        speed: const Duration(seconds: 1)
      ),
      
    ],
    isRepeatingAnimation: true,
    
  ),
          ),),

                  ],
                );
              }));
  }
  }
