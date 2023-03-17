import 'package:cloud_firestore/cloud_firestore.dart';

class MarktestModel{
  String? id;
  String?classname;
  String?rollno;
  String?testname;
  String?testdate;
  String?img;
  String?studentname;
  String?subjectname;
  String?totalmark;
  String?passmark;
  String?obtainedmark;
  String?status;
  String?description;
  String?grade;
  String?point;
  String?session;

  MarktestModel({this.id,this.classname,this.rollno,this.testname,this.testdate,this.img,this.studentname,this.subjectname,this.totalmark,this.passmark,this.description,this.obtainedmark,this.status,this.grade,this.point,this.session});


  Map<String,dynamic>toMap()=>{
    "id":id,
    "classname":classname,
    "rollno":rollno,
    "testname":testname,
    "testdate":testdate,
    "img":img,
    "studentname":studentname,
    "subjectname":subjectname,
    "totalmark":totalmark,
    "passmark":passmark,
    "obtainedmark":obtainedmark,
    "status":status,
    "description":description,
    "grade":grade,
    "point":point,
    "session":session,
  };

  factory MarktestModel.fromMap( DocumentSnapshot data){
    return MarktestModel(
      id: data.id,
      classname: data["classname"],
      rollno: data["rollno"],
      testname: data["testname"],
      testdate: data["testdate"],
      img: data["img"],
      studentname: data["studentname"],
      subjectname: data["subjectname"],
      totalmark: data["totalmark"],
      passmark: data["passmark"],
      obtainedmark: data["obtainedmark"],
      status: data["status"],
      description: data["description"],
      grade: data["grade"],
      point: data["point"],
      session: data["session"]



    );
  }
   

  void setid(String id)=>this.id=id;
  void setclassname(String classname)=>this.classname=classname;
  void setrool(String roll)=>rollno=roll;
  void testnames(String testname)=>this.testname=testname;

  
  void settestedate(String  date)=>testdate=date;
  void setimg(String img)=>this.img=img;
  void setstudentname(String sname)=>studentname=sname;
  void setsubjectname(String subjectname)=>this.subjectname=subjectname;

   
  void settotalmark(String  tmark)=>totalmark=tmark;
  void setpmark(String pmark)=>passmark=pmark;
  void setinputmark(String imark)=>obtainedmark=imark;
  void setstatus(String status)=>this.status=status;
  void setdescription(String description)=>this.description=description;
  void setgrade(String grade)=>this.grade=grade;
  //void setsubjectname(String subjectname)=>this.subjectname=subjectname;







}