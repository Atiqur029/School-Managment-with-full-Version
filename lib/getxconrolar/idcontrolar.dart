
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:schollapp/const/importent.dart';
// import 'package:schollapp/screen/student/student.dart';
// import 'package:schollapp/service/studentdatabase.dart';

// import '../model/studentmodel.dart';

// class IdCartControlar extends GetxController{

//   late CollectionReference reference ;

//   StudentsModel ?model;

//   RxList<StudentsModel> idcardlist=RxList<StudentsModel>([]);

//   @override
//   void onInit() {
   
//     super.onInit();
//      reference=firestore.collection("student").doc("students").collection("Class_1");
//     idcardlist.bindStream((getidcardlist()));
//   }
  
//  //Stream<List<StudentsModel>> getidcardlist()=>reference.snapshots().map((event) => event.docs.map((e) => StudentsModel.fromMap(e)).toList());

 
  
  
// }