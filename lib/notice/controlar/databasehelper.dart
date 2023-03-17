import 'package:get/get.dart';

import 'package:schollapp/const/importent.dart';

import '../model/notice.dart';

class DatabaseHelper{


  addData({ required NoticeTable noticeTable}) async{

    var firestorefile=firestore.collection("Notice").doc("notices").collection("noticelist").doc();

    var noticemodel=NoticeTable(

      id: firestorefile.id,
      text: noticeTable.text,
    );

    var json=noticemodel.toMap();

     try{
     await  firestorefile.set(json);
      Get.snackbar("Notice Added", "Saved Success",snackPosition: SnackPosition.BOTTOM);

     }catch(e){
      print("data error :$e");
      Get.snackbar("Notice Added", "Failed Has Occerd $e",snackPosition: SnackPosition.BOTTOM);
     }
    

  }

  Future delete(String id) async{
    await firestore.collection("notice").doc("notices").collection("noticelist").doc(id).delete();

    

    
  }

  uddate({ required NoticeTable noticeTable}) async{

    final firestorefile=firestore.collection("notice").doc("notices").collection("noticelist").doc();

    final noticemodel=NoticeTable(

      id: noticeTable.id,
      text: noticeTable.text
    );

    final json=noticemodel.toMap();

     try{
      firestorefile.update(json);

     }catch(e){
      Get.snackbar("Notice Added", "Failed Has Occerd $e",snackPosition: SnackPosition.BOTTOM);
     }
    

  }
}