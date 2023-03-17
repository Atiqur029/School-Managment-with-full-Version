// ignore_for_file: public_member_api_docs, sort_constructors_first


class StudentsModel {

  String ?id;
  String?classname;
  String?rollnumber;
  String? name;
  DateTime? brthdate;
  String?gidnumber;
  String?mobilenumber;
  String?address;
  DateTime? admissondate;
  String ?img;
  String? fathername;
  String?sesson;
  
  StudentsModel({this.id,this.classname,this.rollnumber,this.name,this.brthdate,this.gidnumber,this.mobilenumber,this.address, this.admissondate,this.img,this.fathername,this.sesson});

  Map<String,dynamic>toMap()=>{
     "id":id,
     "classname":classname,
     "rollnumber":rollnumber,
     "name":name,
     "brthdate":brthdate,
     "gidnumber" :gidnumber,
     "mobilenumber":mobilenumber,
     "address":address,
     "admissondate":admissondate,
     "img":img,
     "fathername":fathername,
     "sesson":sesson



  };


  factory StudentsModel.fromMap(Map<dynamic,dynamic> data){
    return StudentsModel(
      id:data["id"],
      classname: data["classname"],
      rollnumber: data["rollnumber"],
      name: data["name"],
      brthdate: (data["brthdate"]).toDate(),
      gidnumber: data["gidnumber"],
      mobilenumber: data["mobilenumber"],
      address: data["address"],
      admissondate: (data["admissondate"]).toDate(),
      img: data["img"],
      fathername: data["fathername"],
      sesson: data["sesson"]
      

      );
     
  }


  
  setclass(String classname)=>this.classname=classname;

  





}

