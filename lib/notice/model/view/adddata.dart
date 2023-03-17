
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:get/get.dart';
import 'package:schollapp/notice/controlar/databasehelper.dart';
import 'package:schollapp/notice/model/notice.dart';
import 'package:schollapp/page/home.dart';
import 'package:schollapp/reusable/textform.dart';

import '../../../nextscrenn/nextscreen.dart';

class AddNoticelist extends StatefulWidget {
  const AddNoticelist({super.key});

  @override
  State<AddNoticelist> createState() => _AddNoticeState();
}

class _AddNoticeState extends State<AddNoticelist> {

  final _fromkey=GlobalKey<FormState>();
  final noticeControlar=TextEditingController();
  final NoticeTable noticeTable=NoticeTable();

  String notice="";
  DatabaseHelper helper=DatabaseHelper();
  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text("Add Notice"),leading: IconButton(onPressed: () {
        gotonextscreen(context,  const Homepage());
        
      },icon: const Icon(Icons.arrow_back),),),
      body: Form(
        key: _fromkey,
        
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
          children: [
            SizedBox(height: 20.h,),
            TextForm(
              maxline: 3,
              hintText: "Notice",
               keyboardType: TextInputType.name,
              
              controller: noticeControlar,
            validator: (v) {
              if(v!.isEmpty){
                return "Notice is not Empty";

              }else if(v.length<5){
                return "Notice length atleast 4 chacecter";
              }
              return null;
              

              
              
            },
             onSaved: (v) {
              noticeTable.text=v;
               
             },
             onChanged: (v) {
              
                notice=v;
            
               
             },
            
            ),
            SizedBox(height: 15.h,),
            ElevatedButton(onPressed:(()async {
                await onsave();
               Navigator.of(context).pop();
              
            }), child: const Text("Add Notice"))
          ],
      ),
        ),) 

    );
  }
  
 Future onsave() async{

    if(_fromkey.currentState!.validate()){
      _fromkey.currentState!.save();
      

      try{
         await helper.addData(noticeTable: noticeTable);
         Get.snackbar("Add", "Sucessfullyadded",snackPosition: SnackPosition.BOTTOM);

      }catch(e){
        Get.snackbar("Failed", "Failed",snackPosition: SnackPosition.BOTTOM);

        print("error is:$e" );

      }

     
     


    }
   
    //noticeControlar.text="";
  }

  
}