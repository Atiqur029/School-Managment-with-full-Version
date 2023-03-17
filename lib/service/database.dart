import 'dart:io';



import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schollapp/const/importent.dart';
import 'package:schollapp/model/user.dart';


class Database{

  static Database database=Database.database;
  userset({ required User user}) async{

     

    final adduser=firestore.collection("users").doc(auth.currentUser!.uid);

    final addsomeuser=User(

      id:adduser.id,
      name: user.name,
      email: auth.currentUser!.email,
      pasword: user.pasword,
      img:user.img,
    );

    final json=addsomeuser.toMap();
    adduser.set(json);
    }

    
    uploadimage({File? file,Function(String? url)? onSucess , String?imagepath}) async{
      Get.defaultDialog(
      title: 'Uploading Image',
      content: const SizedBox(
        height: 100,
        width: 100,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );


    Reference reference=storage.ref().child("$imagepath/${DateTime.now().microsecondsSinceEpoch}");
    UploadTask uploadTask=reference.putFile(File(file!.path));
    uploadTask.then((res) {
    Get.back();
    
    res.ref.getDownloadURL().then((value) => onSucess!(value));

    Get.snackbar("Save Img", "SucessFully Save",snackPosition: SnackPosition.BOTTOM);

    Get.back();
  });

    }

    void logout(){
      auth.signOut();
    }
  
    
   
    
     
      


     }

  
  

  

  
    // final List<DocumentSnapshot> documents = result.docs;
    // return documents.length == 1;
   



