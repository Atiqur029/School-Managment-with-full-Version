// ignore_for_file: public_member_api_docs, sort_constructors_first



import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:schollapp/model/studentmodel.dart';
import 'package:schollapp/reusable/textform.dart';

import '../../service/studentdatabase.dart';

class Update extends StatefulWidget {

    final String ?classname;
   final StudentsModel model;

   
   const Update({
    Key? key,
    required this.model, required this.classname,
  }) : super(key: key);
 


  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {

  TextEditingController ?studentdateofbirthcontrolar;
  TextEditingController ?adMissondate;
  TextEditingController ?roolnumberControlar;
  TextEditingController ?nameControlar;
  TextEditingController? gardinaiidControlar;
  TextEditingController? mobilenumberControlar;
  TextEditingController ?classnameControlar;
  TextEditingController ?gardiantnameControlar;
  TextEditingController ?addresControlar;
  TextEditingController ?imgcontrolar;
  TextEditingController ?sessionControlar;
  StudentDatabase data=StudentDatabase();

  


     
     @override
     void initState() {
    classnameControlar=TextEditingController(text:widget.model.classname!);
    adMissondate=TextEditingController(text:widget.model.admissondate.toString());
    nameControlar=TextEditingController(text:widget.model.name!);
    roolnumberControlar=TextEditingController(text:widget.model.rollnumber!);
    studentdateofbirthcontrolar=TextEditingController(text:widget.model.brthdate.toString());
    gardiantnameControlar=TextEditingController(text:widget.model.fathername!);
    mobilenumberControlar=TextEditingController(text: widget.model.mobilenumber!);
    addresControlar=TextEditingController(text:widget.model.address.toString());
    gardinaiidControlar=TextEditingController(text:widget.model.gidnumber!);
    imgcontrolar=TextEditingController(text:widget.model.img!);
    sessionControlar=TextEditingController(text: widget.model.sesson);

  
    super.initState();
  }
   

   //var reference =firestore.collection("student").doc("students").collection("Class_1");
  
  @override
  void dispose() {
    classnameControlar!.dispose();
    addresControlar!.dispose();
    adMissondate!.dispose();
    roolnumberControlar!.dispose();
    studentdateofbirthcontrolar!.dispose();
    gardiantnameControlar!.dispose();
    mobilenumberControlar!.dispose();
    nameControlar!.dispose();
    gardinaiidControlar!.dispose();
    imgcontrolar!.dispose();
    sessionControlar!.dispose();




    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Editing "),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
            shrinkWrap:  true,
            children: [
              const SizedBox(height: 20,),
              TextForm(controller: sessionControlar,hintText: "Class",),
              const SizedBox(height: 20,),
              TextForm(controller: classnameControlar,hintText: "Class",),
              const SizedBox(height: 20,),
              TextForm(controller: nameControlar, hintText: "Name",),
              const SizedBox(height: 20,),
              TextForm(controller: roolnumberControlar,hintText: "Roll",),
              const SizedBox(height: 20,),
              TextForm(controller: gardiantnameControlar,hintText: "Father Name",),
              const SizedBox(height: 20,),
              TextForm(controller: gardinaiidControlar,hintText: "Father Id Numer",),
              const SizedBox(height: 20,),
              TextForm(controller: mobilenumberControlar, hintText: "Mobile Number",),
              const SizedBox(height: 20,),
              TextForm(controller: adMissondate,hintText: "Addmisson Date",),
              const SizedBox(height: 20,),
              TextForm(controller: addresControlar,hintText: "Address ",),
              const SizedBox(height: 20,),
              TextForm(controller: studentdateofbirthcontrolar,hintText: "Student Date of Birth",),
              const SizedBox(height: 20,),
              TextForm(controller: imgcontrolar,hintText: "Student Date of Birth",),
              ElevatedButton(onPressed: (() async{
                String name=nameControlar!.text;
                String roll=roolnumberControlar!.text;
                String fathername=gardiantnameControlar!.text;
                String addres=addresControlar!.text;
                String mobilenumber=mobilenumberControlar!.text;
                String classname=classnameControlar!.text;
                String addmisson=adMissondate!.text;
                String fatherid=gardinaiidControlar!.text;
                String birthdate=studentdateofbirthcontrolar!.text;
                String sesson=sessionControlar!.text;

                String image=imgcontrolar!.text;
                try{
                  
                final student=StudentsModel(
                  id: widget.model.id,
                  name: name,
                  rollnumber: roll,
                  fathername: fathername,
                  address: addres,
                  mobilenumber: mobilenumber,
                  classname: classname,
                  admissondate: DateTime.parse(addmisson),
                  gidnumber: fatherid,
                  brthdate: DateTime.tryParse(birthdate),
                  img: image,
                  sesson: sesson,


                );
                
                

               data.updated(classname: classname,model: student,);
               Get.snackbar("Update", "Sucessfully Updated");
               Navigator.of(context).pop();
               

                }
                catch(e){
                  Get.snackbar("Failer", "Failer activated $e");

                  
                  

                }

                  
                
                
              }), child: const
              Text("Update"))
             
      
            ],
        ),
      ),
      
      
      );}
}

  