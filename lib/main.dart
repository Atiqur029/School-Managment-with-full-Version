
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:schollapp/auth/signin.dart';

import 'package:schollapp/controlar/authcontrolar.dart';
import 'package:schollapp/splashscreen/splashscreen.dart';





void main()async {
  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthControlar()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      
      builder: (context, child) =>
       
      
      
       GetMaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          
          
          primarySwatch: Colors.blue,
          
        ),
        home:  const SplashScreen(),
          
           
          
          
          
        ),
      );
  
  }
}

