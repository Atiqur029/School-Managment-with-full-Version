






import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:schollapp/auth/signin.dart';

import 'package:schollapp/view/reusablecontent/reusablesplashcontainer.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    
     
        Future.delayed(const Duration(seconds: 15)).then((value) {
          if(mounted){
            Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: ((context) => const Signin())));

          }
          
        } );
        
      
      
       
      
    


    
    super.initState();
    
   

    
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            const ReusableContainersplash(
              img: "asset/img/schoolmanagment.jpg",
            
              
              
    
            ),
            SizedBox(
              height: 160.h,
            ),
              SpinKitThreeInOut(
        color: Colors.red,
        size: 50.sp,
        //controller: AnimationController(vsync: this., duration: const Duration(milliseconds: 1200)),
    ),
     SizedBox(
              height: 10.h,
            ),
    
            Text("Made By Md.Atiqur Rahman Sumon",style: TextStyle(color: Colors.white,fontSize: 12.sp,fontWeight: FontWeight.bold),)
    
            
          ],
        ),
      ),
    );
  }
}