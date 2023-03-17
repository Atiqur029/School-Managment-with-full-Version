

import 'package:flutter/material.dart';

import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:get/get.dart';
import 'package:schollapp/offlinedatabase/modeloflinedatabase/notice.dart';
import 'package:schollapp/offlinedatabase/sqflitedatabase.dart';
import 'package:schollapp/reusable/textform.dart';

import 'addnoticecontrolar.dart';



class AddNotice extends StatelessWidget {

  AddNotice({super.key});

  final addnotice=Get.put(AddNoticeControlar());

  //  final  _fromkey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text("AddNotice"),centerTitle: true,),
      body: Padding(padding: EdgeInsets.all(15.w),child: Form(
        key: addnotice.fromkey,
        
        child:Center(
          child: Column(
            children: [
              TextForm(
                controller: addnotice.addnoticeControlartext,
                keyboardType: TextInputType.name,
                maxline: 3,
                onSaved: (v) {
                  
                addnotice.onsaved(v);

                  
                  
                  
                  
                },
                validator: (v) {
                  addnotice.validator(v!);
                }
                 
                
                
              ),
              SizedBox(height: 10.h,),
              ElevatedButton(onPressed: ((() async{
                 addnotice.onsave();
                 addnotice.addnoticeControlartext.text="";
                 Navigator.pop(context);
                
              })), child: const Text("Add Notice"))

            ],
          ),
        )),),
      
    );
  }

  // Future onsave() async {

  //   if(_fromkey.currentState!.validate()){
  //     _fromkey.currentState!.save();
      
     

  //     try{
  //        DBhelper.instence.insertData(notice: notice);
         
  //      Get.snackbar("Notice", "Save SucessFully",snackPosition: SnackPosition.BOTTOM);
  //      Navigator.of(context).pop();


  //     }
  //     catch(e){
  //        Get.snackbar("Notice", "Error is occerd $e",snackPosition: SnackPosition.BOTTOM);

  //     }

  //     noticeText.text="";

 




  //   }
  }
