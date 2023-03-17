import 'dart:io';


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
import 'package:schollapp/model/studentmodel.dart';

import 'package:schollapp/reusable/textform.dart';

import 'package:schollapp/service/studentdatabase.dart';

class AddNewStudent extends StatefulWidget {
  const AddNewStudent({super.key});

  @override
  State<AddNewStudent> createState() => _AddNewStudentState();
}

class _AddNewStudentState extends State<AddNewStudent> {
  TextEditingController studentdateofbirthcontrolar=TextEditingController();
  TextEditingController adMissondate=TextEditingController();
  TextEditingController roolnumberControlar =TextEditingController();
  TextEditingController nameControlar =TextEditingController();
  TextEditingController gardinaiidControlar=TextEditingController();
  TextEditingController mobilenumberControlar =TextEditingController();
  TextEditingController adressControlar =TextEditingController();
  TextEditingController gardiantnameControlar =TextEditingController();
  TextEditingController seasonControlar =TextEditingController();

   //final seson="";
   final _fromkey=GlobalKey<FormState>();
   StudentsModel model=StudentsModel();
   StudentDatabase database=StudentDatabase();
   var sessionname="";
   
  @override
  Widget build(BuildContext context) {
    print( "sesson name :$sessionname");
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text("Add Student"),centerTitle: true,),

      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Form(
          key: _fromkey,
          child: ListView(
            shrinkWrap: true,
            children: [
            const SizedBox(height: 10,), 
            TextForm(
              hintText: "Sesson",
              keyboardType: TextInputType.number,
              controller: seasonControlar,
              onChanged: (v) {

                setState(() {
                    sessionname=v;
                  
                });
              

                
              },
             
              validator: (v) {
                if(v!.isEmpty){
                  return "Season doesnot empty ";

                }
                
              },

            ),
              
            const SizedBox(height: 10,), 
             Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
        
              ),
               child: DropdownButtonFormField(
              
                
                validator: ((value) {
                  if(value!.isEmpty){
                    return "fill up";
                    //Get.snackbar("dropdown"," Fillup ClassName");
                  }
                  return null;

                  
                }),
                
               decoration: InputDecoration(
                hintText: "Class name",
                fillColor: Colors.white,
                
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
             
               ),
                
                items: const [
                  DropdownMenuItem(value: "Class_1",child: Text("Class_1")),
                  DropdownMenuItem(value: "Class_2",child: Text("Class_2")),
                  DropdownMenuItem(value: "Class_3",child: Text("class_3")),
                  DropdownMenuItem(value: "Class_4",child: Text("Class_4")),
                  DropdownMenuItem(value: "Class_5",child: Text("Class_5")),
                  DropdownMenuItem(value: "Class_6",child: Text("Class_6")),
                  DropdownMenuItem(value: "Class_7",child: Text("class_7")),
                  DropdownMenuItem(value: "Class_8",child: Text("Class_8")),
                  DropdownMenuItem(value: "Class_9",child: Text("Class_9")),
                  DropdownMenuItem(value: "Class_10",child:Text("Class_10")),
             
             
             
               ],
                 onChanged: ((value) {
        
                  
                  model.setclass(value!);

        
                 
               }),
              
               
               ),
             ),
        
             const SizedBox(height: 20,),
             
             TextForm(
              keyboardType: TextInputType.number,
              hintText: "Student Roll Number",controller: roolnumberControlar,validator: ((value) {
               if(value!.isEmpty){
                return "atlist 2 degit insert";
                //Get.snackbar("Roll Number", "Fill up roll number with atlist 1 degit",snackPosition: SnackPosition.BOTTOM);
               }
               return null;
               
             }),onSaved: (value) {
              model.rollnumber=value;
               
             },),
             const SizedBox(height: 20,),
             TextForm(hintText: "Name Student",controller: nameControlar,validator: (value) {
              if(value!.isEmpty ||value.length<2){
                return "name isrequired fll at least 2 charecter";
                //Get.snackbar("Name", "Fill up name at least 2 charecter",snackPosition: SnackPosition.BOTTOM);
               }
               return null;
               
               
             },onSaved: (value) {
              model.name=value;
               
             },),
             
             const SizedBox(height: 20,),
             TextForm(
              controller: studentdateofbirthcontrolar,
              onTap: () async{
                DateTime ?pickdate=await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2100));
        
                if(pickdate!=null){
                  studentdateofbirthcontrolar.text=DateFormat("yyyy-MM-dd").format(pickdate);
                }
                
              },
              prefixIcon: const Icon(Icons.calendar_today_outlined),
              onSaved: ( value) {
                model.brthdate=DateTime.parse(value!);
                
              },
              
              validator: (value){
                if(value!.isEmpty){
                  return "fill up";
                //Get.snackbar("DateTime", "Fill up DatetimeFiled",snackPosition: SnackPosition.BOTTOM);
               }
               return null;
              } ,
              
             hintText: "Student Date Of Birth",),
             const SizedBox(height: 20,),
             TextForm(hintText: "Guardian ID Number(if any)",controller: gardinaiidControlar,
             onSaved: (value) {
              model.gidnumber=value!;

               
             },validator: (value) {
              if(value!.isEmpty ||value.length<8){
                return "At list 7 degit insert";
//Get.snackbar("Name", "Fill up name at least 7 digit",snackPosition: SnackPosition.BOTTOM);
               }
               return null;
               
             },),
             const SizedBox(height: 20,),
             
             TextForm(hintText: "Father/ Gardiant name ",controller: gardiantnameControlar,onSaved: (save) {
              model.fathername=save;
               
             },
             validator: (value) {
              if(value!.isEmpty ||value.length<2){
                return "at lest two carecter";
                //
                //Get.snackbar("Gerdiant Name", "Fill up name at least 2 carecter",snackPosition: SnackPosition.BOTTOM);
               }
               return null;
               
             },
             ),
             const SizedBox(height: 20,),
             TextForm(hintText: "Phone Number", controller: mobilenumberControlar,
             onSaved: (value) {
              model.mobilenumber=value;
               
             },
             keyboardType: TextInputType.number,
             validator: (value){
              if(value!.isEmpty ||value.length<11){
                return "phone number length 11";
                //Get.snackbar("Number", "Fill up  at least 11 number",snackPosition: SnackPosition.BOTTOM);
               }
               return null;
             },
             ),
             const SizedBox(height: 20,),
              TextForm(hintText: "Address", controller: adressControlar,maxline: 2,
              onSaved: (v) {
                model.address=v;
                
              },validator: (value) {
                if(value!.isEmpty ||value.length<2){
                  return "fill up Address";
                //Get.snackbar("Addres", "Fill up Addres at least 5 charecter",snackPosition: SnackPosition.BOTTOM);
               }
               return null;
                
              },),
              
             const SizedBox(height: 20,),
             TextForm(hintText: "Admisson date ",
             controller: adMissondate,
             onSaved: (value) {
              model.admissondate=DateTime.parse(value.toString());
               
             },
             validator: (value) {
              if(value!.isEmpty ||value.length<2){
                return "fill up date";
                //Get.snackbar("Admisson Date", "Fill up Admisson Date",snackPosition: SnackPosition.BOTTOM);
               }
               return null;
               
             },
        
             prefixIcon: const Icon(Icons.calendar_today_outlined,),
             onTap: ()async {
              DateTime ?pickdate=await  showDatePicker(context: context, initialDate: DateTime.now(), firstDate:DateTime(2000), lastDate: DateTime(2100));
              if(pickdate!=null){
                setState(() {
                  adMissondate.text=DateFormat("yyyy-MM-dd").format(pickdate);
                });
              }
               
             },
             ),
             const SizedBox(height: 20,),
             const Center(child: Text("Select Student  Image",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Colors.white),)),
             const SizedBox(height: 20,),
             _imagefile==null?
            Container(
               height: 150,
               width: 80,
               
               decoration: const BoxDecoration(
                 color: Colors.yellow,
                 shape: BoxShape.circle,
        
        
        
               ),
               
            ):Container(
               height: 150,
               width: 80,
               
               decoration:  BoxDecoration(
                 color: Colors.yellow,
                 shape: BoxShape.circle,
                 image: DecorationImage(image: FileImage(_imagefile!),fit: BoxFit.contain)
        
        
        
            )),
            //const Text("Student Image",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                
                CircleAvatar(
                  child: IconButton(onPressed: (() {
                    selectimage(ImageSource.gallery);
                    
                    
                  }), icon:const Icon( Icons.collections_outlined )),
                ),
                 const SizedBox(width: 10,),
                  
                  CircleAvatar(
                   child: IconButton(onPressed: (() {
                    selectimage(ImageSource.camera);
                    
                               }), icon:const Icon( Icons.camera_alt_outlined )),
                 )
                 
              ],
            ),

            ElevatedButton(onPressed: (() {
              onvalidator();
              //Navigator.of(context).pop();
              
            }),child: const Text("Submit",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,),),),


        
        
             
        
        
        
        
             
        
            ],
          ),
        ),
      ),
    );
  }

  
   File?_imagefile;


   selectimage(ImageSource source) async{

    final pickimage=await ImagePicker().pickImage(source: source,imageQuality: 100);

    if(pickimage==null)return;
    File img=File(pickimage.path);
    setState(() {
      _imagefile=img;
    });
   }
   
      onvalidator() {
        try{
          
        if(_fromkey.currentState!.validate()){
          _fromkey.currentState!.save();

          database.uploadstudentimage(file: _imagefile,imagePath: "student_img",onSucess: (url) {
            model.img=url;

            database.addStudent(model: model,sesion: sessionname);

            Get.snackbar("Submitted", "Succesfully",snackPosition: SnackPosition.BOTTOM);
            _fromkey.currentState!.reset();
          },);
        }
        else{
           Get.snackbar("Submitted", "error",snackPosition: SnackPosition.BOTTOM);

        }
          

          

        }catch(e){
          Get.snackbar("Error", "Something error $e",snackPosition: SnackPosition.BOTTOM);
          _fromkey.currentState!.reset();

        }


      }
 
    
   }

  
