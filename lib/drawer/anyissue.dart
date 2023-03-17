
 import 'package:flutter/material.dart';
 import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schollapp/page/home.dart';

import '../nextscrenn/nextscreen.dart';


class AnyIssueforadmin extends StatelessWidget {
  const AnyIssueforadmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: const Text("Isues"),centerTitle: true,
       leading: IconButton(onPressed: (() {
          gotonextscreen(context,  Homepage());
          
        }), icon: const Icon(Icons.arrow_back)),
      
      ),
      body: Padding(padding: EdgeInsets.all(20.h),child: Center(
        child: Container(
          height: 300,
          width: 250,
          decoration: const BoxDecoration(
            color: Colors.yellow,
            //borderRadius: BorderRadius.circular(10.w),
            border:  Border(left: BorderSide(color: Colors.green,width: 10),
                right: BorderSide(color: Colors.black,width: 10),
                top: BorderSide(color: Colors.red,width: 20),
                bottom: BorderSide(color: Colors.purple,width: 30))
          ),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Any Problem Fetch,Please Contact.",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold,color: Colors.red),),
              ),
              SizedBox(height: 15.h,),
              Text("01740070497",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold,color: Colors.red),),
            ],
          )),
      ),
      
      ),
    );
  }
}