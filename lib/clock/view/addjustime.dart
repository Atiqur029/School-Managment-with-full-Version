
import 'dart:math';

import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:schollapp/appcolor/appcolor.dart';

import '../model/timemodel.dart';

class AddjustTime extends StatefulWidget {
    const AddjustTime(   this.model,{super.key});
  final TimeModel model;

  @override
  State<AddjustTime> createState() => _AddjustTimeState();
}

class _AddjustTimeState extends State<AddjustTime> {
  @override
  Widget build(BuildContext context) {


     

    return Column(
      children: [
        Container(
          height: 150.h,
          width: 150.w,
          decoration:  BoxDecoration(
           // color: Colors.amber,
            shape: BoxShape.circle,
            //boxshadow
            boxShadow: [
              BoxShadow(color: Colors.red.withAlpha(40),blurRadius: 38.r)
            ]
          ),
          child: CustomPaint(
            painter: ClockPointer(widget.model),

          )
          



        ),
      ],
    );
  }
}
class ClockPointer extends CustomPainter{
  TimeModel? time;

  ClockPointer(this.time);
  @override
  void paint(Canvas canvas, Size size) {
   //point cordinator
   var  cenTerX= size.height/2;
   var cenTerY=size.width/2;
   var center=Offset(cenTerX, cenTerY);
   var radius=min(cenTerX,cenTerY);

   //setting brash
   var brash=Paint()
   ..color=AppColor.primarycolor
   ..strokeCap=StrokeCap.round;
   var centerdotbrash=Paint()..color=Colors.deepOrange;

   //draw centerCircle

   canvas.drawCircle(center, radius-15.w, brash);

   canvas.drawCircle(center, 10.r, centerdotbrash);

   //set time Calculate
   double secRad=((pi/2)-(pi/30)*time!.sec!)%(2*pi);
   double minRad=((pi/2)-(pi/30)*time!.min!)%(2*pi);
   double hourRad=((pi/2)-(pi/6)*time!.hour!)%(2*pi);

   //set the clock ordinate
   var secHeight=radius/2;
   var minHeight=radius/2-10;
   var hourHeight=radius/2-25;

   var seconds=Offset(cenTerX+secHeight*cos(secRad), cenTerY-secHeight*sin(secRad));
   var minutes=Offset(cenTerX+minHeight*cos(minRad), cenTerY-minHeight*sin(minRad));
   var hours=Offset(cenTerX+hourHeight*cos(hourRad), cenTerY-hourHeight*sin(hourRad));

   //set the time brash

   var secBrash=Paint()..color=const Color.fromARGB(255, 118, 255, 64)..style=PaintingStyle.stroke..strokeCap=StrokeCap.round..strokeWidth=2.w..strokeJoin=StrokeJoin.round;
   var minBrash=Paint()..color=Colors.red..style=PaintingStyle.stroke..strokeCap=StrokeCap.round..strokeWidth=3.w..strokeJoin=StrokeJoin.round;
   var hourBrash=Paint()..color=const Color.fromARGB(255, 54, 238, 244)..style=PaintingStyle.stroke..strokeCap=StrokeCap.round..strokeWidth=4.w..strokeJoin=StrokeJoin.round;

   
   //canvas line time
   canvas.drawLine(center, seconds, secBrash);
   canvas.drawLine(center, minutes, minBrash);
   canvas.drawLine(center, hours, hourBrash);



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
   
    return true;
  }


}