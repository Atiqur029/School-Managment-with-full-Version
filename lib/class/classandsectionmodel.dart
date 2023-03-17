// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';

class SectionandClassModel {

  String? id;
  String ?classes;
  String ?section;
  SectionandClassModel({
     this.id,
     this.classes,
     this.section,
  });


  Map<String,dynamic>toMap()=>{
    "id":id,
    "classes":classes,
    "section":section
  };

  factory SectionandClassModel.fromMap(DocumentSnapshot data){
    return SectionandClassModel(
      id: data.id,
      classes: data["classes"],
      section: data["section"],
    );
  }

}
