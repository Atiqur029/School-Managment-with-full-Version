


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schollapp/appcolor/appcolor.dart';
import "package:intl/intl.dart";
import 'package:timer_builder/timer_builder.dart';

class ReusableTimeZone extends StatefulWidget {
  const ReusableTimeZone({super.key});

  @override
  State<ReusableTimeZone> createState() => _ReusableTimeZoneState();
}

class _ReusableTimeZoneState extends State<ReusableTimeZone> {


  
  

    
     
 
  

  
  
  @override
  Widget build(BuildContext context) {
    DateTime date=DateTime.now();

     String format="";
  
     //format = DateFormat('hh:mm a').format(date);
     var day=DateFormat("EEEE").format(date);

    
    return ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [

                    TimerBuilder.periodic(const Duration(minutes: 1), builder: ((context) {
                      format = DateFormat('hh:mm a').format(DateTime.now());
                      return Container(
                      padding: EdgeInsets.all(20.w),
                      
                      width: MediaQuery.of(context).size.width-52,height: 100.h,
                    decoration: BoxDecoration(color:AppColor.primarycolor,borderRadius: BorderRadius.circular(8.r) ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Dhaka",style: TextStyle(fontSize: 20.sp,color: Colors.white,fontWeight: FontWeight.w800),),

                            Text(format,style: TextStyle(fontSize: 20.sp,color: Colors.white,fontWeight: FontWeight.w800),)


                          ],
                        ),
                        SizedBox(height: 5.h,),
                        Center(child: Text("Today",style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w700),)),

                        SizedBox(height: 10.h,),

                         Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                             Text(day,style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w500)),
                             Text('${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',style: TextStyle(fontSize: 18.sp,color: Colors.white,fontWeight: FontWeight.w500)),
                           ],
                         )


                      ],
                    ));
                    

                      
                    }))
                    
                  ],

                );
  }
}