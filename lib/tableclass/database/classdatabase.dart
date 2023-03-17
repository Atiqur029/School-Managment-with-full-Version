
import 'package:get/get.dart';
import 'package:schollapp/const/importent.dart';

import 'package:schollapp/tableclass/database/classmodel.dart';

class ClassDatabase{
  addclass(TableClass model) async{

    final  section=firestore.collection("tableClass").doc();
    final tableclass=TableClass(
      id: section.id,
      classname: model.classname,
      

    );
    try{
      final json=tableclass.toMap();
      await section.set(json);
      Get.snackbar("Section and Class","Save Succesfully");

    }catch(e){
      print("Classand Section error is:$e ");

    }
  }

  updateclassandsection(TableClass model)async{
    
     final  section=firestore.collection("tableClass").doc(model.id);
    final sectonandclass=TableClass(
      id: model.id,
      classname: model.classname,
      

    );
    try{
      final json=sectonandclass.toMap();
      await section.update(json);
      Get.snackbar("Section and Class","Save Succesfully");

    }catch(e){
      print("Classand Section error is:$e ");

    }


  }

  Future delete(String id) async{
    try{
       await firestore.collection("tableClass").doc(id).delete();
     Get.snackbar("Delete", "This Document  Succesfully delete",snackPosition: SnackPosition.BOTTOM);

    }catch(e){
      print("Firebase error $e");

    }
     


  }


}