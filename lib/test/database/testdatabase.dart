import 'package:get/get.dart';
import 'package:schollapp/const/importent.dart';
import 'package:schollapp/test/model/marktest.dart';

class Test {

   addtest({required MarktestModel test,required String img,required String grade, required String studentname,required String point}) async{
    final firebase=firestore.collection("test").doc("marktest").collection(test.classname!).doc();

    final marktest=MarktestModel(
      id: firebase.id,
      classname: test.classname,
      rollno: test.rollno,
      testname: test.testname,
      testdate: test.testdate,
      studentname: studentname,
      subjectname: test.subjectname,
      img: img,
      totalmark: test.totalmark,
      passmark: test.passmark,
      obtainedmark: test.obtainedmark,
      status: test.status,
      description: test.description,
      grade: grade.toString(),
      point: point,




    );
     var map=marktest.toMap();
   

    try {
      await firebase.set(map);
      Get.snackbar("Mark", "Save Sucesfully",snackPosition: SnackPosition.BOTTOM);
      

      
    } catch (e) {
       Get.snackbar("Fail", "Mark Faild $e",snackPosition: SnackPosition.BOTTOM);
      
    }
    

   }

    addidwisemark({required MarktestModel test,required String img,required String grade, required String studentname,required String point}) async{
    final firebase=firestore.collection("test").doc("rollwise").collection(test.classname!).doc(test.classname).collection(test.rollno!).doc();

    final marktest=MarktestModel(
      id: firebase.id,
      classname: test.classname,
      rollno: test.rollno,
      testname: test.testname,
      testdate: test.testdate,
      studentname: studentname,
      subjectname: test.subjectname,
      img: img,
      totalmark: test.totalmark,
      passmark: test.passmark,
      obtainedmark: test.obtainedmark,
      status: test.status,
      description: test.description,
      grade: grade,
      point: point




    );
     var map=marktest.toMap();
   

    try {
      await firebase.set(map);
      Get.snackbar("Idwise", "Save Sucesfully",snackPosition: SnackPosition.BOTTOM);
      

      
    } catch (e) {
       Get.snackbar("Idwise", "Mark Faild $e",snackPosition: SnackPosition.BOTTOM);
      
    }
}

addexam({required MarktestModel test,required String img,required String grade, required String studentname,required String point,required String session}) async{
    final firebase=firestore.collection("test"). doc(session).collection(session).doc("exams").collection(test.classname!).doc(test.classname).collection(test.testname!).doc();

    final marktest=MarktestModel(
      id: firebase.id,
      classname: test.classname,
      rollno: test.rollno,
      testname: test.testname,
      testdate: test.testdate,
      studentname: studentname,
      subjectname: test.subjectname,
      img: img,
      totalmark: test.totalmark,
      passmark: test.passmark,
      obtainedmark: test.obtainedmark,
      status: test.status,
      description: test.description,
      grade: grade,point: point,
      session: session




    );
     var map=marktest.toMap();
   

    try {
      await firebase.set(map);
      Get.snackbar("classExm", "Save Sucesfully",snackPosition: SnackPosition.BOTTOM);
      

      
    } catch (e) {
       Get.snackbar("classExam Faild", " Databsefaild $e",snackPosition: SnackPosition.BOTTOM);
      
    }
}

addsubjectwise({required MarktestModel test,required String img,required String grade, required String studentname,required String point,required String session}) async{
    final firebase=firestore.collection("test").doc(session).collection(session).doc("subject").collection(test.classname!).doc(test.classname).collection(test.subjectname.toString()).doc();

    final marktest=MarktestModel(
      id: firebase.id,
      classname: test.classname,
      rollno: test.rollno,
      testname: test.testname,
      testdate: test.testdate,
      studentname: studentname,
      subjectname: test.subjectname,
      img: img,
      totalmark: test.totalmark,
      passmark: test.passmark,
      obtainedmark: test.obtainedmark,
      status: test.status,
      description: test.description,
      grade: grade,
      point: point,
      session: session,




    );
     var map=marktest.toMap();
   

    try {
      await firebase.set(map);
      Get.snackbar("subject and class Mark ", "Save Sucesfully",snackPosition: SnackPosition.BOTTOM);
      

      
    } catch (e) {
       Get.snackbar(" Subject and class", " Databse faild $e",snackPosition: SnackPosition.BOTTOM);
      
    }
}

addexamwisedresult({required MarktestModel test,required String img,required String grade, required String studentname,required String point,required String session}) async{
    final firebase=firestore.collection("test").doc(session).collection(session).doc("rollwise").collection(test.testname.toString()).doc(test.testname).collection(test.classname!).doc(test.classname).collection(test.rollno.toString()).doc();

    final marktest=MarktestModel(
      id: firebase.id,
      classname: test.classname,
      rollno: test.rollno,
      testname: test.testname,
      testdate: test.testdate,
      studentname: studentname,
      subjectname: test.subjectname,
      img: img,
      totalmark: test.totalmark,
      passmark: test.passmark,
      obtainedmark: test.obtainedmark,
      status: test.status,
      description: test.description,
      grade: grade,
      point: point,
      session: session
      




    );
     var map=marktest.toMap();
   

    try {
      await firebase.set(map);
      Get.snackbar("ExamWise Subject and class Mark ", "Save Sucesfully",snackPosition: SnackPosition.BOTTOM);
      

      
    } catch (e) {
       Get.snackbar("ExamWise Subject and class Mark", " Databse faild $e",snackPosition: SnackPosition.BOTTOM);
      
    }
}



}