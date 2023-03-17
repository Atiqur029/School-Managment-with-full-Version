import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:schollapp/auth/signin.dart';
import 'package:schollapp/const/importent.dart';
import 'package:schollapp/page/home.dart';
import 'package:schollapp/splashscreen/splashscreen.dart';

import 'package:schollapp/view/allstudentview/student/viewer.dart';


class AuthControlar extends GetxController{


  late Rx<User?>?firebaseuser;

  
  
  @override
  void onReady() {
    
    super.onReady();

    firebaseuser=Rx<User?>(auth.currentUser);
    firebaseuser!.bindStream(auth.userChanges());
    ever(firebaseuser!, _initScren);
    

  }
  
  _initScren(User?user){

    if(user==null){
      Get.offAll(const Signin());
    }
   
     else if(user.email=="ab@gmail.com"){
     
      //  firebaseuser=Rx<User?>(auth.currentUser);
      //  firebaseuser!.bindStream(auth.userChanges());
       Get.offAll( const Homepage() );

        
       
       

       
     }
    else {
      Get.offAll( StudentViwer());
    }
  }
}