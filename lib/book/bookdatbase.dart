import 'dart:io';


import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schollapp/book/model.dart';
import 'package:schollapp/const/importent.dart';

class BookDatabase{

  addBook(BookModel model){


    try{
      final book=firestore.collection("book").doc("books").collection(model.classname!).doc();
  final booklist=BookModel(
    id: book.id,
    classname: model.classname,
    bookname: model.bookname,
    num: model.num,
    file: model.file

  );
  final json=booklist.toMap();
  book.set(json);

    }catch(e){
      Get.snackbar("Error","Error is $e",snackPosition: SnackPosition.BOTTOM,);

    }
    
  

  }


  uploadbook({File?file,String ?filePath,Function(String ?url)?onSuccess}){

    try{
      Get.defaultDialog(
      title: 'Uploading Pdf',
      content: const SizedBox(
        height: 100,
        width: 100,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),

    );
    Reference reference=storage.ref("books").child("$filePath/${DateTime.now().microsecondsSinceEpoch}");
    UploadTask uploadTask=reference.putFile(File(file!.path));
    uploadTask.then((res){
      Get.back();
      res.ref.getDownloadURL().then((value) => onSuccess!(value));

    });


    



  }

    catch(e){
      Get.snackbar("Error", "Upload error $e");

    
  }

  
  }
  Stream<List<BookModel>>getdisplay({required String name}){
    return  firestore.collection("book").doc("books").collection(name).snapshots().map((event) => event.docs.map((e) => BookModel.fromMap(e)).toList());
    

  }

  

  
  }