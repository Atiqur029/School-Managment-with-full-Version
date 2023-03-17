import 'package:cloud_firestore/cloud_firestore.dart';

class AddTestModel{

  String?id;
  String?testname;

  AddTestModel({
    this.id,
    this.testname
  });


  Map<String,dynamic>toMap()=>{
    "id":id,
    "testname":testname
  };

  factory AddTestModel.fromMap(DocumentSnapshot snapshot){
    return AddTestModel(id: snapshot.id,testname: snapshot["testname"]);
  }



}