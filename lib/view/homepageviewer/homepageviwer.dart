import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schollapp/tableclass/routine.dart';
import 'package:schollapp/view/payment/allpayment.dart';

import '../../fee/view/showfee.dart';
import '../../nextscrenn/nextscreen.dart';
import '../allstudentview/resultallviwer/classwisesubjectlist.dart';
import '../allstudentview/resultallviwer/finalresult.dart';
import '../allstudentview/student/routineview/routine.dart';
import '../allstudentview/student/someclassed/attendence_viewer/attendenceview.dart';
import '../allstudentview/student/someclassed/attendence_viewer/viewerlist/viewr/historymonth.dart';
import '../allstudentview/student/someclassed/attendence_viewer/viewerlist/viewr/roolwisehistory.dart';
import '../allstudentview/student/someclassed/clasname.dart';
import '../allstudentview/studentid/viewidstudent.dart';
import '../reusablecontent/reusablecontainer.dart';



class HomePageviwer extends StatefulWidget {
  const HomePageviwer({super.key});

  @override
  State<HomePageviwer> createState() => _HomePageviwerState();
}

class _HomePageviwerState extends State<HomePageviwer> {
  @override
  Widget build(BuildContext context) {
    return Column(

      
      children: [

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                   gotonextscreen(context, const Viewidstudent());
                
              },
              child: SizedBox(
                
                      height: 90.h,
                      width: 140.w,
                  //color: Colors.white.withOpacity(0.5),
                  child: const ReusableContainer(
                    text: "Student",
                    img: "asset/img/schoolstudent.png",
                    
                  ),
            
                    ),
            ),
         InkWell(
          onTap: () {
            gotonextscreen(context, const ClassNameview());
            
          },
           child: SizedBox(
            height: 90.h,
            width:140.w,
               
               child: const ReusableContainer(
                 text: "Class and Section",
                 img: "asset/img/class.jpg",
                 
               ),
         
                 ),
         ),

          ],
        ),
        SizedBox(
          height: 10.h,
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                gotonextscreen(context, const RoutineviewerAllViwer(classname: 'class_1',));
              },
              child: SizedBox(
                
                      height: 90.h,
                      width: 140.w,
                  //color: Colors.white.withOpacity(0.5),
                  child: const ReusableContainer(
                    text: "Routine",
                    img: "asset/img/routine.jpg",
                    
                  ),
            
                    ),
            ),
         InkWell(
          onTap: () {
             gotonextscreen(context,   const AttendenseviewforAllViewer(classname: 'Class_1',docname: "Class_1",));
            
          },
           child: SizedBox(
            height: 90.h,
            width:140.w,
               
               child: const ReusableContainer(
                 text: "Attendence",
                 img: "asset/img/attendence.jpg",
                 
               ),
         
                 ),
         ),

          ],
        ),
        SizedBox(
          height: 10.h,
        ),
         
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                 gotonextscreen(context,  const RollwisehistoryofAllViewer(classname: "Class_11"));
                
              },
              child: SizedBox(
                
                      height: 90.h,
                      width: 140.w,
                  //color: Colors.white.withOpacity(0.5),
                  child: const ReusableContainer(
                    text: "Roll and Class Wise Attendence",
                    img: "asset/img/classwiseattendance.jpg",
                    
                  ),
            
                    ),
            ),
         InkWell(
          onTap: () {
            gotonextscreen(context,  const HistoryMonthforallviwer(classes: "Class_1",monthdoc: "January",));
            
          },
           child: SizedBox(
            height: 90.h,
            width:140.w,
               
               child: const ReusableContainer(
                 text: "Monthly Attendence",
                 img: "asset/img/monthlyattendence.jpg",
                 
               ),
         
                 ),
         ),

          ],
        ),
        SizedBox(
          height: 10.h,
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                 gotonextscreen(context, const ClassWiseSubjectallviwer() );
                
              },
              child: SizedBox(
                
                      height: 90.h,
                      width: 140.w,
                  //color: Colors.white.withOpacity(0.5),
                  child: const ReusableContainer(
                    text: "Subject Wise Mark",
                    img: "asset/img/subjectwise.jpg",
                    
                  ),
            
                    ),
            ),
         InkWell(
          onTap: () {
            gotonextscreen(context,  const FinalResultAllClassallviewer() );
            
          },
           child: SizedBox(
            height: 90.h,
            width:140.w,
               
               child: const ReusableContainer(
                 text: "Result",
                 img: "asset/img/result.jpg",
                 
               ),
         
                 ),
         ),

          ],
        ),
        SizedBox(
          height: 10.h,
        ),
        Center(
          child: InkWell(
              onTap: () {
                gotonextscreen(context,  const Showallfeesview () 

                
                
                );
                
              },
              child: SizedBox(
                
                      height: 90.h,
                      width: 140.w,
                  //color: Colors.white.withOpacity(0.5),
                  child: const ReusableContainer(
                    text: "Tution with Other Fee",
                    img: "asset/img/tutionfee.jpg",
                    
                  ),
            
                    ),
            ),
        
        )
    ]);
  }
}