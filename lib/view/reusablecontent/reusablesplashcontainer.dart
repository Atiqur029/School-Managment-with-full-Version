



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableContainersplash extends StatelessWidget {
  //final String text;
  final String img;
  const ReusableContainersplash({super.key,  required this.img});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 150.h,
          width: 250.w,
          decoration: BoxDecoration(
            //image:  DecorationImage(image: AssetImage(img),fit: BoxFit.cover),
            color: Colors.white,
            border: Border.all(color: Colors.blueGrey,width: 2),
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                spreadRadius: 3,

                offset: const Offset(0, 3),
                

              )
            ]

          ),
          child: Padding(padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10.h),
                child: Image.asset(img,fit: BoxFit.cover,height: 100.h,)//width: 150.w,),
              ),
            //   
            ]
          ),),
          
          
          
        ),
         
      ],
    );
  }
}