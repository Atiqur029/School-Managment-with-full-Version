import 'dart:io';



import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schollapp/const/importent.dart';
import 'package:schollapp/model/studentmodel.dart';

class StudentDatabase{
  addStudent({required StudentsModel model,required String sesion} ) async {
      final addstudent=firestore.collection("student").doc(sesion).collection(sesion).doc("students") .collection(model.classname!).doc(model.rollnumber);

      try{
        final students=StudentsModel(

        id: addstudent.id,
        rollnumber: model.rollnumber,
        name: model.name,
        brthdate: model.brthdate,
        gidnumber: model.gidnumber,
        fathername: model.fathername,
        mobilenumber: model.mobilenumber,
        address: model.address,
        admissondate: model.admissondate,
        img: model.img,
        classname: model.classname,
        sesson: sesion

      );
      final json=students.toMap();

      addstudent.set(json);
      


      }catch(e){
        Get.snackbar("Firebase add", "Firebase Error $e");

      }

      
      



    }
  uploadstudentimage({File? file,Function(String?url )?onSucess,String ?imagePath})
  async{
    try{

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

    Reference reference=storage.ref().child("$imagePath/${DateTime.now().microsecondsSinceEpoch}");
    UploadTask uploadTask=reference.putFile(File(file!.path));
    uploadTask.then((v) {
      Get.back();
      v.ref.getDownloadURL().then((value) => onSucess!(value));

    });

    

  

    }catch(e){
      Get.snackbar("Error", "Error for $e");

    }
    
   
}
updated({ required String classname, required StudentsModel model})async{

final collection=firestore.collection("student").doc(model.sesson).collection(model.sesson!).doc("students") .collection(model.classname!);

    //final collection= firestore.collection("student").doc("students").collection(classname);

    final docref= collection.doc(model.id);

    final student=StudentsModel(
      id:model.id,
      name: model.name,
      
        
        rollnumber: model.rollnumber,
        
        brthdate: model.brthdate,
        gidnumber: model.gidnumber,
        fathername: model.fathername,
        mobilenumber: model.mobilenumber,
        address: model.address,
        admissondate: model.admissondate,
        img: model.img,
        classname: model.classname,
        sesson: model.sesson,
        



    );

    final json=student.toMap();

    try{
      await docref.update(json);

    }catch(e){
      Get.snackbar("Update", "Update error occerd $e");
      

    }

    

   }  

   Future delete( { required String classname,required StudentsModel model}) async{
    firestore.collection("student").doc(model.sesson).collection(model.sesson!).doc("students") .collection(model.classname!).doc(model.rollnumber).delete();

     //await firestore.collection("student").doc("students").collection(classname).doc(model.id).delete();


   }

}