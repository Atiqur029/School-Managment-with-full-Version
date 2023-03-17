import 'package:cloud_firestore/cloud_firestore.dart';

class Fees{

  String? id;
  String?classes;
  String?name;
  String?roll;
  String?monthyear;
  String ?feesname;
  String?feedate;
  String?img;
  String?amount;
  String?paid;


  Fees({this.id,this.classes,this.name,this.roll,this.monthyear,this.feedate,this.img,this.amount,this.paid,this.feesname});


 Map<String,dynamic>toMap() =>{
  "id":id,
  "classes":classes,
  "name":name,
  "roll":roll,
  "monthyear":monthyear,
  "feedate":feedate,
  "img":img,
  "amount":amount,
  "paid":paid,
  "feesname":feesname

 };

 factory Fees.fromMap(DocumentSnapshot map){

  return Fees(
    id: map.id,
    classes: map["classes"],
    name: map["name"],
    roll: map["roll"],
    monthyear: map["monthyear"],
    feedate: map["feedate"],
    img: map["img"],
    feesname: map["feesname"],
    amount: map["amount"],
    paid: map["paid"]


  );
 }

 void setid(String id)=>this.id=id;
 void setClasses(String classes)=>this.classes=classes;
 void setname(String name)=>this.name=name;
 void setroll(String roll)=>this.roll=roll;
 void setmonthYear(String monthyear)=>this.monthyear=monthyear;
 void setfeedate(String feedate)=>this.feedate=feedate;
 void setimg(String img)=>this.img=img;
 void setamount(String amount)=>this.amount=amount;
 void setpaid(String paid)=>this.paid=paid;

  



}