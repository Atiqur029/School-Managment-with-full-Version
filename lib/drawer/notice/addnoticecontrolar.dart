
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:schollapp/notice/controlar/noticelist.dart';
import 'package:schollapp/offlinedatabase/modeloflinedatabase/notice.dart';

import '../../offlinedatabase/controlar/databasecontrolar.dart';

class AddNoticeControlar extends GetxController{

  final addnotice=Get.put(NoticeControlar());
  final notice=Notice();



  var  addnoticeControlartext=TextEditingController();


   var fromkey=GlobalKey<FormState>();


   onsave(){
    if(fromkey.currentState!.validate()){
      fromkey.currentState!.save();

      try{
        Get.snackbar("Data save", "Save Sucessfully");
        addnotice.addData(notice: notice);
    

      }catch(e){
        Get.snackbar("Failed", "failed is occered $e");

      }
      Get.back();
      addnoticeControlartext.text="";
     

    }

   }


    String? validator(String v){
      
      if(v.isEmpty){
        return "Text is not Empty";
      }else if(v.length<5){
        return "Text Charecter at list 4";
      }
      return null;
      }
    

      onsaved(String? v){
       notice.text=v;
    }
}