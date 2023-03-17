import 'package:cloud_firestore/cloud_firestore.dart';

class AttendenceModel{
  String?classname;
  String ?id;
  String?value;
  String ?month;
  String?subject;
  String?date;
  String?classtime;
  String?attendensetime;
  String?persentabsence;
  String?roll;
  

AttendenceModel({this.id,this.month,this.subject,this.date,this.classtime,this.attendensetime,this.persentabsence,this.value,this.roll,this.classname});

Map<String,dynamic> toMap()=>{
  "id":id,
  "classname":classname,
  "month":month,
  "subject":subject,
  "date":date,
  "classtime":classtime,
  "attendensetime":attendensetime,
  "persentabsence":persentabsence,
  "roll":roll
};

factory AttendenceModel.fromMap(DocumentSnapshot data)=>AttendenceModel(
  id: data.id,
  month: data["month"],
  subject: data["subject"],
  date: data["date"],
  classtime: data["classtime"],
  attendensetime: data["attendensetime"],
  persentabsence: data["persentabsence"],
  roll: data["roll"],
  classname: data["classname"]

  


);

setValue(String value)=>this.value=value;

setRoll(String roll)=>this.roll=roll;

String?get getroll=>roll??"";


}