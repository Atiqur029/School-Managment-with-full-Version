// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:cloud_firestore/cloud_firestore.dart';


class TableClass {

  String ?id;
  String ?classname;
  TableClass({
     this.id,
     this.classname,
  });
  

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'classname': classname,
    };
  }
  factory TableClass.fromMap(DocumentSnapshot data){
    return TableClass(
      id: data.id,
      classname: data["classname"]
    );
  }

}

