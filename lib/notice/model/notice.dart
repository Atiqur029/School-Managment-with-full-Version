import 'package:cloud_firestore/cloud_firestore.dart';

class NoticeTable{
  String? id;
  String ?text;

  NoticeTable({this.id, this.text});

  Map<String,dynamic>toMap()=>{

    "id":id,
    "text":text,
  };

  factory NoticeTable.fromMap( DocumentSnapshot data)=>NoticeTable(id: data.id,text: data["text"]);


}