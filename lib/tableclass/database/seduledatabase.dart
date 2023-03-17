import 'package:get/get.dart';
import 'package:schollapp/tableclass/database/classmodel.dart';
import 'package:schollapp/tableclass/database/model/scedule.dart';

import '../../const/importent.dart';

class Sheduledatabase{
  //TableClass table=TableClass();
    adddatabase({Schedules? model}) async{
    
    final  section=firestore.collection("Schedule").doc("allclasses").collection(model!.classname!).doc();
    final scedule=Schedules(
      id: section.id,
      classname: model.classname,
      weakday: model.weakday,
      subjectname: model.subjectname,
      starttime: model.starttime,
      endtime: model.endtime,
      sirname: model.sirname,
      

    );
    try{
      final json=scedule.toMap();
      await section.set(json);
      Get.snackbar("Section and Class","Save Succesfully");

    }catch(e){
      print("Classand Section error is:$e ");

    }
  }

  updateclassandsection(Schedules model)async{
    //TableClass classes=TableClass();
    
     final  section=firestore.collection("Schedule").doc("allclasses").collection(model.classname!).doc();
    final scedule=Schedules(
      id: model.id,
      classname: model.classname,
      weakday: model.weakday,
      subjectname: model.subjectname,
      starttime: model.starttime,
      endtime: model.endtime,
      
      

    );
    try{
      final json=scedule.toMap();
      await section.update(json);
      Get.snackbar("Section and Class","Save Succesfully");

    }catch(e){
      print("Classand Section error is:$e ");

    }


  }

  Future delete(String id) async{
    try{
       await firestore.collection("Schedule").doc("allclasses").collection(id).doc().delete();
     Get.snackbar("Delete", "This Document  Succesfully delete",snackPosition: SnackPosition.BOTTOM);

    }catch(e){
      print("Firebase error $e");

    }
     


  }
    
    


  }
