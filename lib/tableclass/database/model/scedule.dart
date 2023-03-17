// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
 
class Schedules {
  String? id;
  String?classname;
  String?weakday;
  String?subjectname;
  String?starttime;
  String? endtime;
  String?sirname;
  Schedules({
    this.sirname,
    this.id,
    this.classname,
    this.weakday,
    this.subjectname,
    this.starttime,
    this.endtime
  });


  Map<String,dynamic>toMap()=>{
    "id":id,
    "classname":classname,
    "weakday":weakday,
    "subjectname":subjectname,
    "starttime":starttime,
    "endtime":endtime,
    "sirname":sirname
  };

 



  factory Schedules.fromMap( DocumentSnapshot data){
    return Schedules(
      id:data.id,
      classname:data["classname"],
      weakday:data["weakday"],
      subjectname:data["subjectname"],
      starttime:data["starttime"],
      endtime:data["endtime"],
      sirname: data["sirname"],


    );
    
  }

  setweakday(String weakday)=>weakday=weakday;
  setclassname(String classname)=>classname=classname;

  setstarttime(TimeOfDay?starttime)=>starttime=starttime;
  setendtime(TimeOfDay?endtimetime)=>endtime=endtime;


}
