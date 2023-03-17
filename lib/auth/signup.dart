



import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:schollapp/const/importent.dart';

import 'package:schollapp/model/user.dart';
import 'package:schollapp/page/home.dart';

import 'package:schollapp/reusable/textform.dart';
import 'package:schollapp/service/database.dart';

class SignUp extends StatefulWidget {
   const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
    bool isLoding=false;

      File? file;
      String? filename;
      PlatformFile?pickedfile;
      FilePickerResult?result;
    final namecontrolar=TextEditingController();
    final passwordControlar=TextEditingController();
    final cpasswordControlar=TextEditingController();
    final emailControlar=TextEditingController();
    final fromKey=GlobalKey<FormState>();
    bool isPasswordVisibled=false;

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


     User user=User();
      imageset() async{
    

         setState(() {
           isLoding=true;
         });

       result= await FilePicker.platform.pickFiles(type: FileType.image,allowMultiple: false);

      if(result!=null){
        filename=result!.files.first.name;
        pickedfile=result!.files.first;
        file=File(pickedfile!.path.toString());
       
        

      }
       setState(() {
          isLoding=false;
        });
      

      

      
      

    }


  @override
  Widget build(BuildContext context) {
    


    
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text("Sign Up"),centerTitle:  true,),

       
        body:ListView(
    
        shrinkWrap:  true,

        children: [
          const SizedBox(height: 20,),

          //const Center(child:  Text("Sign Up ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
             
          
           
           Stack(
            children: [
             // file!=null?

              _image9==null?
                const SizedBox(
                    height: 200,
                    width: 400,
                    //color: Colors.cyan,

                    child: CircleAvatar()):
               Container(
                width: 400,
               
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  
                        
                  image: DecorationImage(
                    
                    fit: BoxFit.contain,
                    image:FileImage(_image9!,),))),
           
                  
                  // Container(
                  //   height: 200,
                  //   width: 400,
                  //   //color: Colors.cyan,

                  //   child: const CircleAvatar()),
             // child: Image.file(file!,fit:BoxFit.cover,)),
              

           

            ]),
            isLoding?const Center(child:CircularProgressIndicator()):IconButton(onPressed: (() async{
             pickimage(ImageSource.gallery);
           
           }), icon:const Icon( Icons.image,size: 40,)
            
           ),
             
          

          const SizedBox(height: 20,),

          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Form(
              key: fromKey,
              child: Column(
              children: [
                TextForm(
                  prefixIcon: const Icon(Icons.person),
                  controller:namecontrolar ,
                  hintText: "Enter Your Name",
                  onSaved: ((save) {
                    user.name=save;
                    
                  }),
                  validator: ((value) {
                     if(value!.isEmpty || value.length<5){
                      return "please valid name";
                    }
                    else{
                      return null;
                    }
                    
                  }),

                ),
                const SizedBox(height: 20,),
                TextForm(
                  

                  prefixIcon: const Icon(Icons.email_outlined),
                  controller:emailControlar ,
                  hintText: "Enter Your Email",
                  // onSaved: ((value) {
                  //   user.email=value;
                    
                  // }),
                  validator: ((value) {
                    if(value!.isEmpty || value.length<5|| !EmailValidator.validate(value)){
                      return "please valid email";
                    }
                    else{
                      return null;
                    }
                    
                  }),

                ),
                const SizedBox(height: 20,),
                TextForm(
                  obscureText: !isPasswordVisibled,
                  onSaved: ((value){
                    user.pasword=value;
                  }),
                  validator: ((value) {
                    if(value!.isEmpty || value.length<5){
                      return "Requre password field with atleast 5 number";
                    }
                    return null;
                    
                  }),
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
                TextForm(

                  prefixIcon: const Icon(Icons.lock),
                  controller:cpasswordControlar ,
                  keyboardType: TextInputType.number, validator: (value) {
                        if (value!.isEmpty) {
                          return "Confirm Password";
                        } else if (value != passwordControlar.text) {
                          return "Password MisMatch";
                        }

                        return null;
                      },
                  obscureText: true,
                  hintText: "Confirm Passsword ",
                  
                      ),
              

        
                const SizedBox(height: 20,),

                ElevatedButton(onPressed: (() {
                  onsaved();
                  
                }), child:const Text("Sign up") ),

                const SizedBox(height: 20,),

                

          
               
              ],
            )),
          ),

          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const SignUp()));
            },
            child: RichText(
              
              text:  const TextSpan(
                children: [
                  TextSpan(
                    text:  "Already Have Accont?",
                  ),
                  
          
                  
                  TextSpan(
                    text:  "Sign In",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.blue ),
                  ),
          
                ]
              ),
          
            ),
          )
        ],
        ));
      }
      
         onsaved()  async{

          try{
            if(fromKey.currentState!.validate()) {
            fromKey.currentState!.save();
            Database data=Database();
           
            await auth.createUserWithEmailAndPassword(email: emailControlar.text, password: passwordControlar.text).then((value){
               data.uploadimage(file: _image9,imagepath: "img_path",onSucess: (url) {
                user.img=url;

                data.userset(user: user);
              
              
              
            },);
               
            });


              //  AuthCredentials.instance.createAccount(emailControlar.text, passwordControlar.text).then((value){
              //   data.userset(user: user);
            //});

           

            Get.snackbar("Sign up", "Save and verified Sucessfully",snackPosition: SnackPosition.BOTTOM);
           
            // ignore: use_build_context_synchronously
            Navigator.push(context, MaterialPageRoute(builder: (_)=> Homepage()));

            fromKey.currentState!.reset();
           
                  

          }
          

          }catch(e){
            Get.snackbar("Error",  "Sign in UnSecessfull because $e problem");

          }

          


         }

         File? _image9;

         pickimage( ImageSource source)async{
    

    final image9 = await ImagePicker().pickImage(
                  source: source, imageQuality: 50
      );
           if(image9 == null) return;
            File? img9 = File(image9.path);

              setState(() {
                     _image9 = img9;
                 });

  }
  
  }
