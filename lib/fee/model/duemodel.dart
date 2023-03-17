// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:cloud_firestore/cloud_firestore.dart';

class Duemodel {

  String? id;
  String? classes;
  String ?roll;
  String ?name;

  double ?due;
  String ?monthofdate;
  String ?feesname;

  String ?amount;
  String ?payment;

  Duemodel({
    this.id,
    this.classes,
    this.roll,
    this.name,
    this.due,
    this.monthofdate,
    this.feesname,
    this.payment,
    this.amount
  });




  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'classes': classes,
      'roll': roll,
      'name': name,
      'due': due,
      'feesname':feesname,
      'monthofdate': monthofdate,
      "payment":payment,
      "amount":amount
    };
  }

  factory Duemodel.fromMap(DocumentSnapshot map) {
    return Duemodel(
      id: map["id"],
      classes:map["classes"] ,
      roll: map["roll"],
      name: map["name"],
      due: map["due"],
      feesname: map["feesname"],
      monthofdate: map["monthofdate"],
      amount: map["amount"],
      payment: map["payment"]
    );
  }

 void setid(String id)=>this.id=id;
 void setClasses(String classes)=>this.classes=classes;
 void setname(String name)=>this.name=name;
 void setroll(String roll)=>this.roll=roll;
 void setmonthYear(String monthofdate)=>this.monthofdate=monthofdate;
 void setdue(double due)=>this.due=due;
 
}
