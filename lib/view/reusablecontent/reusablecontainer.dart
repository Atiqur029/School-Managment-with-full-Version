



import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReusableContainer extends StatelessWidget {
  final String text;
  final String img;
  const ReusableContainer({super.key, required this.text, required this.img});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90.h,
          width: 140.w,
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
                child: Image.asset(img,fit: BoxFit.cover,height: 40.h,width: 100.w,),
              ),
              SizedBox(
                height: 30.h,
                
                
                
                child: Text(
                  
                  
                  text,style: const TextStyle(color: Colors.black,fontWeight: FontWeight.w600,),textAlign: TextAlign.center,),)
            ],
          ),),
          
          
          
        ),
         
      ],
    );
  }
}