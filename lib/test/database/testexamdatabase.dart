

import 'package:get/get.dart';

import 'package:schollapp/const/importent.dart';

import '../model/addtestmodel.dart';

class TestExamDatabase {

  addExam( { required AddTestModel model})async{

    final testexam=firestore.collection("test").doc("tests").collection("examlist").doc();

    final testmodel=AddTestModel(
      id: testexam.id,
      testname: model.testname

    );

    try{
      await testexam.set(testmodel.toMap());
      Get.snackbar("TestExam","Sucesfully Save",snackPosition: SnackPosition.BOTTOM);

    }catch(e){
      print("Test Exam error is is :$e");
      Get.snackbar("Error","data failed is $e",snackPosition: SnackPosition.BOTTOM);

    }

    



    
  }

}