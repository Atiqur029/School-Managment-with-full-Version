
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/state_manager.dart';
import 'package:schollapp/const/importent.dart';
import 'package:schollapp/notice/controlar/databasehelper.dart';
import 'package:schollapp/notice/model/notice.dart';

class NoticeList extends GetxController{
  late CollectionReference reference;
  DatabaseHelper helper =DatabaseHelper();

  RxBool isload=false.obs;

  var noticelist=RxList<NoticeTable>([]);

  @override
  void onInit() {
    isload(true);
    reference=firestore.collection("Notice").doc("notices").collection("noticelist");
    noticelist.bindStream(getnoticeList());
    isload(false);
    super.onInit();
  }
  
  Stream<List<NoticeTable>> getnoticeList(){
    
    return reference.snapshots().map((event) => event.docs.map((e) => NoticeTable.fromMap(e)).toList());


    

}

  Future delete(String id) async{
    

    await  reference.doc(id).delete();
  }



  Future updated({ required NoticeTable table}) async{
    
    await reference.doc(table.id).update(table.toMap());
  }

}

