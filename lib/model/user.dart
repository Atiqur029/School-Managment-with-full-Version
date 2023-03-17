
import 'package:cloud_firestore/cloud_firestore.dart';

class User{

  String?id;
  String?name;
  String?email;
  String? pasword;
  String ?img;


  User({
    this.id,
    this.name,
    this.email,
    this.pasword,
    this.img
  });

  Map<String,dynamic> toMap()=>{"id":id,"name":name,"email":email,"pasword":pasword,"img":img};
  

  factory User.fromMap(DocumentSnapshot data)=>User(
    id:data["id"],
    name: data["name"],
    email: data["email"],
    pasword: data["pasword"],
    img: data["img"]
  );

  setimg(String ?img)=>this.img=img;

}