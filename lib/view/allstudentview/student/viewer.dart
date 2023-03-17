

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:marquee/marquee.dart';



import '../../../graph/view/barchartview.dart';



import '../../../notice/controlar/databasehelper.dart';
import '../../../notice/controlar/noticelist.dart';
import '../../../offlinedatabase/controlar/databasecontrolar.dart';
import '../../../page/timer/firsttime.dart';


import '../../drawers/showdrowers.dart';
import '../../homepageviewer/homepageviwer.dart';

import '../../reusablecontent/reusabletimezone.dart';


class StudentViwer extends StatelessWidget {
  final noticeControlar=Get.put(NoticeControlar());

  final noticelistControlar=Get.put(NoticeList());

  final helper =DatabaseHelper();
  
  StudentViwer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Smart School"),centerTitle: true,),
    body: ListView(
      shrinkWrap: true,
      children: [

        
         const SizedBox(height: 10,),
        
          Obx(() {
            return SizedBox(height: 60.h,
           child: noticelistControlar.isload.value==true?const Center(child: CircularProgressIndicator(),):
           
                    
                   ListView.builder(
                    shrinkWrap: true,
                    itemCount:noticelistControlar.noticelist.length ,
                    
                    itemBuilder: ((context, index) {
                     
                        final listnoticeofdata=noticelistControlar.noticelist[index];
                        
                     
                      
                  return  Row(
                 children: [
              Container(height: 50.h,
              width: 80.w,
              color: Colors.amber,
              child: Center(child: Text("Notice",style: TextStyle(color: Colors.red,fontSize: 15.sp,fontWeight: FontWeight.bold),)),
              ),
              Expanded(child: Container(height: 50.h,
              
              color: Colors.green,
              child: Marquee(text: "***${listnoticeofdata.text}***",style: TextStyle(fontSize: 14.sp,color: Colors.white),)),
              
              

                  )],

          
           
                  );})));
          },),

          SizedBox(
            height: 400.h,
            child: Column(
              children: [
                

                const TimeofDay(),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(" Time Zone",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400),),
                      Divider(color: Colors.black45,height: 5.h,),

                  ],
                ),
                 const Expanded(child: ReusableTimeZone())
             
               
                

                //Center(child: AddjustTime(TimeModel(hour: 5,min: 15,sec: 30))),
              ],
            ) ,
          ),
          SizedBox(height: 10.h,),
          //SizedBox(height: 10.h,),
          Center(child: Text("Class Wise 2023 Students Chart",style: TextStyle(fontSize: 21.sp,fontWeight: FontWeight.bold,color: Colors.red),)),

          

         // Text("Total Students Chart",style: TextStyle(fontSize: 10.sp,color: Colors.red,fontWeight: FontWeight.bold),),
          SizedBox(height: 10.h,),
          SizedBox(
            height: 250.h,
            child: const Barchartview(),
          ),
            Divider(
              thickness: 3,
              indent: 5,
              endIndent: 10,
          color: Colors.black,
          height: 10.h,
        ),

        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            color: Colors.grey,
            padding: EdgeInsets.all(20.w),
            height: 540.h,
            child: const HomePageviwer(),
          ),
        ),
       
         





        


      ],
    ),
     drawer:const Drawersomethingview(),
    
    );
  }
}