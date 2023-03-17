
import 'package:cloud_firestore/cloud_firestore.dart';

class BookModel{
  String? id;
  String?classname;
  String?bookname;
  String?num;
  String?file;
 



  BookModel({this.id,this.bookname,this.num,this.classname,this.file});

   Map<String,dynamic>toMap()=>{
    "id":id,
    "classname":classname,
    "bookname":bookname,
    "num":num,
    "file":file,
    
   };

   factory BookModel.fromMap(DocumentSnapshot data)=>BookModel(

    id: data.id,
    classname: data["classname"],
    bookname: data["bookname"],
    num:data["num"],
    file: data["file"],
   );

   setclassname(String classname)=>this.classname=classname;
  
}