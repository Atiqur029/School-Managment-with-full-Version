import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:schollapp/auth/signin.dart';
import 'package:schollapp/const/importent.dart';
import 'package:schollapp/nextscrenn/nextscreen.dart';

class AuthCredentials{

  static AuthCredentials instance=AuthCredentials();

  Future<void> createAccount(String email,String password)async{

    try{
      await  auth.signInWithEmailAndPassword(email: email, password: password);

    }catch(e){
      Get.snackbar("Sign Up","Error $e",backgroundColor: const Color.fromARGB(8, 95, 129, 39));

    }
  }


  Future<void> loggin(String  email,String password) async{


    

    try{
    await auth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseException catch (e){
      if(e.code=="user-not-found"){
        
                            Get.snackbar("User", "User NotFound $e",snackPosition: SnackPosition.BOTTOM);
                          }else if(e.code=="wrong-password"){
                             //Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Signin()));
                            Get.snackbar("User", "Wrong password $e",snackPosition: SnackPosition.BOTTOM);
                            
                          }
    }

      Future<void> loggout() async{
        await auth.signOut();
        Get.to(const Signin());
        






  }

  
}}