






import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schollapp/auth/authcredential.dart';
import 'package:schollapp/auth/signup.dart';
import 'package:schollapp/const/importent.dart';
import 'package:schollapp/nextscrenn/nextscreen.dart';





import 'package:schollapp/reusable/textform.dart';


import '../view/allstudentview/student/viewer.dart';


class Signin extends StatefulWidget {
   
   const Signin({super.key,  });

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {

 

     
     @override
  void initState() {
    
    super.initState();
  }

  

  bool isPasswordVisibled=false;
  

  final emailControlar=TextEditingController();
  final passwordControlar=TextEditingController();
  final fromkey=GlobalKey<FormState>();

  visiblepassword() {
    setState(() {
      isPasswordVisibled = true;
      Future.delayed(const Duration(seconds: 3)).then((value) {
        setState(() {
          isPasswordVisibled = false;
        });
      });
    });

 

  }
 
  @override
  Widget build(BuildContext context) {
    
    

   
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Sign in Page"),centerTitle: true,
        
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Form(
          key: fromkey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                
                TextForm(
                      
        
                      prefixIcon: const Icon(Icons.email_outlined),
                      controller:emailControlar ,
                      hintText: "Enter Your Email",
                      // onSaved: (value) {
                      //   emailControlar.text!=value;
                        
                      //},
                      validator: (value) {

                           if(value!.isEmpty || !EmailValidator.validate(value)){

                            return "InValid Email ";
                           }
                           
                           else {
                            return null;
                           }
                           
                      
                      
                      }
                      
                      
                      ),
                    

                        
                     
                         
                        

        
                  
                    const SizedBox(height: 20,),
                    TextForm(
                      obscureText: !isPasswordVisibled,
                      
                     
                       validator: (value) {
                        
                           if(value!.isEmpty || value.length<5){

                            return "required at least 5 number ";
                           }
                          
                           else{
                            return null;
                           }
                           
                      
                       },

                        

        
                      
                      
                      prefixIcon: const Icon(Icons.lock),
                      controller:passwordControlar ,
                      suffixIcon: IconButton(
                              icon: isPasswordVisibled
                                  ? const Icon(
                                      Icons.visibility_off,
                                      color: Colors.brown,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      color: Colors.amber,
                                    ),
                              onPressed: () {
                                visiblepassword();
                              },
                            ),
                      hintText: "Enter Your Password",
        
                    ),
                    const SizedBox(height: 20,),
        
                    ElevatedButton(onPressed: (() async {
                      
                    
                      if(fromkey.currentState!.validate()){

                        try{
                          AuthCredentials.instance.loggin(emailControlar.text, passwordControlar.text);
                     
                         


                        }on FirebaseException catch (e){
                          if(e.code=="user-not-found"){
                             Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Signin()));
                            Get.snackbar("User", "User NotFound $e",snackPosition: SnackPosition.BOTTOM);
                          }else if(e.code=="wrong-password"){
                             Navigator.of(context).push(MaterialPageRoute(builder: (_)=> Signin()));
                            Get.snackbar("User", "Wrong password $e",snackPosition: SnackPosition.BOTTOM);
                            
                          }

                        
                         

                        
                        
                        
                        //   else if(emailControlar.text=="ab@gmail.com" && passwordControlar.text=="12345678"){
                        //     gotonextscreen(context, const Homepage());

                        //  }
                        
                           Navigator.of(context).push(MaterialPageRoute(builder: (_)=> StudentViwer()));
                          Get.snackbar("Sign in", "Sign in Succcesfull",snackPosition: SnackPosition.BOTTOM);
                      
                        
                         
                        

                        }
                        //Get.snackbar("error", "Sign in error",snackPosition: SnackPosition.BOTTOM);

                        emailControlar.text="";
                        passwordControlar.text="";

          
                     

                     
                    
                     


                    
                

                       

                        //Database database=Database();
                        //database.signin(emailControlar.text.toString(), passwordControlar.text.toString());
                        //Get.snackbar("Sign in", "Suessfully",snackPosition: SnackPosition.BOTTOM);

                        
                        //fromkey.currentState!.reset();

                      
                      
                    }}), child: const Text("Sign in")),
        
                    const SizedBox(
                      height: 20,
                    ),
                     InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const SignUp()));
                      },
                       child: RichText(
                                 
                                 text:  const TextSpan(
                                   children: [
                                     TextSpan(
                        text:  " Forget Your Password?",
                                     ),
                                     
                     
                                     
                                     TextSpan(
                        text:  "Sign Up",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.blue ),
                                     ),
                     
                                   ]
                                 ),
                     
                               ),
                     )
        
        
        
              ],
        
        
            ),
          ),
        ),
      ),
    );
  }
}