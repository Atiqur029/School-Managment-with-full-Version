

import 'package:get/get.dart';
import 'package:schollapp/offlinedatabase/modeloflinedatabase/notice.dart';
import 'package:schollapp/offlinedatabase/sqflitedatabase.dart';

class NoticeControlar extends GetxController{

  
  //final _someNotice=<Notice,dynamic>{}.obs;

  //get someprodoct=>_someNotice;

  var allNotice=<Notice>[].obs;

  RxBool isLoad=false.obs;
  

  @override
  void onInit() {
    fetchNotice().obs;
    
    DBhelper.instence.db.obs;
    super.onInit();
    
  }

  addData({ required Notice notice}) async{

    await DBhelper.instence.insertData(notice: notice);
  }
  

   
  
   Future fetchNotice() async{
    isLoad(true);
    var student= await DBhelper.instence.getData();
    allNotice.value=student!.obs;
    isLoad(false);



  }
  delete({ required int id})async{
    fetchNotice().obs;
    await DBhelper.instence.delete(id);
  }

  updatedata ({required Notice notice}) async{
    fetchNotice().obs;
    await DBhelper.instence.update(notice,notice.id!);

  }


}