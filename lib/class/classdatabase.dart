

import 'package:get/get.dart';
import 'package:schollapp/class/classandsectionmodel.dart';
import 'package:schollapp/const/importent.dart';
import 'package:schollapp/model/studentmodel.dart';

class ClassDatabase{

  
  addclassandSection(SectionandClassModel model) async{

    final  section=firestore.collection("sectionandclass").doc();
    final sectonandclass=SectionandClassModel(
      id: section.id,
      classes: model.classes,
      section: model.section

    );
    try{
      final json=sectonandclass.toMap();
      await section.set(json);
      Get.snackbar("Section and Class","Save Succesfully");

    }catch(e){
      print("Classand Section error is:$e ");

    }
  }

  updateclassandsection(SectionandClassModel model)async{
    
    final  section=firestore.collection("sectionandclass").doc(model.id);
    final sectonandclass=SectionandClassModel(
      id: model.id,
      classes: model.classes,
      section: model.section

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
      await firestore.collection("sectionandclass").doc(id).delete();
     Get.snackbar("Delete", "This Document  Succesfully delete",snackPosition: SnackPosition.BOTTOM);

    }catch(e){
      print("Firebase error $e");

    }
     


  }
}