// ignore_for_file: public_member_api_docs, sort_constructors_first






import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import 'package:schollapp/attendence/database/attendencedancedatabase.dart';
import 'package:schollapp/attendence/database/historydatabase.dart';
import 'package:schollapp/attendence/database/monthhistory.dart';
import 'package:schollapp/attendence/model/attendence.dart';

import 'package:schollapp/const/importent.dart';

import 'package:intl/intl.dart';
import 'package:schollapp/nextscrenn/nextscreen.dart';
import 'package:schollapp/reusable/textform.dart';

class AddAttendese extends StatefulWidget {

  final String classname;
 
  const AddAttendese({
    Key? key,  required this.classname,
   
  }) : super(key: key);

  @override
  State<AddAttendese> createState() => _AddAttendeseState();
}

class _AddAttendeseState extends State<AddAttendese> {

  AttendenceModel model=AttendenceModel();
  AttendenceDatabase data=AttendenceDatabase();
  Historydatabase historydatabase=Historydatabase();
  MonthHistory monthhistory=MonthHistory();
  
  
  
  String monthvalue="";
  String dropdownclass="";
  DateTime firstDate=DateTime(2000);
  DateTime lastdate=DateTime(2100);
  
  ValueNotifier<bool> isvalueopen=ValueNotifier(false);

 
  List ofMonth=[
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"

  ];

  List ofSubject=[
   "Bangla",
   "English",
   "Mathmatics",
   "Ict",
   "Islam",
   "Physics",
   "Chemistry",
   "Biology"
  ];
  
 

   
  String attendencesession="";
  String classname="";

  String selectedvalue="";

  

  //String valus="";

  
  
  TimeOfDay?classTime;
  TimeOfDay?attendaystime;
  final _fromkey=GlobalKey<FormState>();
  TextEditingController pa=TextEditingController();
  TextEditingController pickdateControlar=TextEditingController();
  TextEditingController pickclass=TextEditingController();
  TextEditingController attendenceclass=TextEditingController();
  final sesionControlar=TextEditingController();
   String sessionvalue="2014";
  String catagory="";
 



 @override
  void initState() {
    classname=widget.classname;
    
    
    super.initState();
    
  }

 
  @override
  Widget build(BuildContext context) {
    print("session:$sessionvalue");
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text("Mark Attendense"),centerTitle: true,),
      body: Padding(padding:
      const EdgeInsets.all(16),child: 
        
           
        Form(
             key: _fromkey,
             child: ListView(
              shrinkWrap: true,
              children: [

                SizedBox(height: 10.h,),

                TextForm(
                  controller: sesionControlar,
                  hintText: "Session",
                  onChanged: (v) {
                    setState(() {
                      sessionvalue=v;
                    });
                    
                  },
                  validator: (v) {
                    if(v!.isEmpty){
                      return "required session";
                    }
                    
                  },

                ),
                SizedBox(height: 10.h,),

                StreamBuilder(
                 stream: firestore.collection("student").doc(sessionvalue).collection(sessionvalue).doc("students").collection(classname).snapshots(),
             
            
            
            builder: ((context, snapshot){
              if(snapshot.hasError){
                Center(child: Text("Error is happand ${snapshot.error}"),);
              }else if(snapshot.hasData){
                List dropdownlist=[];

                String values="";

               //ListView.builder(itemBuilder: )
               
      
               for(var i=0;i<snapshot.data!.docs.length;i++){
                 final list=snapshot.data!.docs[i].data()["rollnumber"];
                 
                  
                 
                 dropdownlist.add(list);
                 values=list;
                 //selectedvalue=dropdownlist[i];

                 
               }
               
      
               return Container(
                padding:  const EdgeInsets.only(left: 20),
                 
                 color: Colors.white,
                 child: DropdownButtonFormField(
                  
                     
                   

                   
                   hint: const Text("Select Roll*"),
                   value: values,
                   isExpanded: true,
                   onSaved: (v) {
                    values=v.toString();
                     model.roll=values;
                     
                   },
                   //value: selectedvalue,
                   
                   //value:   selectedvalue ,//== null ? selectedvalue : .where( (i) => i.name == selectedType.name).first as BuildingType,,
                   items: dropdownlist.map((e){
                     //selectedvalue=e;
                     
                     return DropdownMenuItem(value: e.toString() ,child:Text(e.toString()));
                   }).toList(), onChanged: ((value) {
                    
                     
                     setState(() {
                       
                       model.setValue(value.toString());
                      
                     });

                     //print( " value print ${model.setValue(value.toString())}");
                    
                     
                     // setState(() {
                     //   selectedvalue=value.toString();
                     // });
                     
                     
                     
                     
      
                     
                       
                   
                    // model.value=value.toString();
                     
                   })),
               );
              
      
             
               
               
            
               
             
            }
            return const Center(child: CircularProgressIndicator(),);
           
            })),
      

               
               const SizedBox(height: 15,),
                         Container(
                          padding: const EdgeInsets.only(left: 10),
                           decoration: BoxDecoration(
                            
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(blurRadius: 0.2,offset: Offset(0, 2),spreadRadius: 0.5)
      
                                    ]),
                           child: DropdownButtonFormField(
                          
                            
                        
                        
                             hint: const Text("  Month*"),
                        
                            items:ofMonth.map((v){
                              monthvalue=v;
                              
      
                            return DropdownMenuItem(value: monthvalue,child:Padding(padding: const EdgeInsets.only(left: 20),child: Text(monthvalue),));
                            
                        } ).toList() , onChanged: ((value) {
                          monthvalue=value!;

                          model.month=value;

                          //print("value is:${model.month}");

                         
                          
                          
                            
                        })),
                         ),
                        const SizedBox(height: 15,),
      
                         Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(blurRadius: 0.2,offset: Offset(0, 2),spreadRadius: 0.5)
      
                                    ]),
                           child: DropdownButtonFormField(
                            
                              hint: const Text("  Subject*"),
                              onSaved: (value) {
                                model.subject=value.toString();
                                
                              },
                              
                            
                        
                        
                           
                        
                        items:ofSubject.map((v){
      
                            return DropdownMenuItem(
                              
                              value: v,child:Padding(padding: const EdgeInsets.only(left: 20),child: Text(v),));
                            
                        } ).toList() , onChanged: ((value) {
                            
                        })),
                         ),
      
      
                        const SizedBox(height: 15,),
                        TextForm(controller: pickdateControlar,
                        onSaved: (v) {
                          monthvalue=v!;
                          model.date=monthvalue;
                          
                        },
                        hintText: "Pick Date *",
                        onChanged: (v) {
                          
                          setState(() {
                            monthvalue=v;
                            
                          });
                        
                        
                          
                        },
                        onTap: () async{
                          if(monthvalue=="January"){
                          
                              firstDate=DateTime(2023,1,1);
                              lastdate=DateTime(2023,1,31);
                              
                          
                            
      
                          } else if(monthvalue=="February"){
                            
                              firstDate=DateTime(2023,2,1);
                              lastdate=DateTime(2023,2,28);
                              
                          
                          }else if(monthvalue=="March"){
                            
                              firstDate=DateTime(2023,3,1);
                              lastdate=DateTime(2023,3,31);
                          
                         
                          }else if(monthvalue=="April"){
                            
                              firstDate=DateTime(2023,4,1);
                              lastdate=DateTime(2023,4,31);
                          
                         
                          }
                          else if(monthvalue=="May"){
                            
                              firstDate=DateTime(2023,5,1);
                              lastdate=DateTime(2023,5,31);
                          
                         
                          }else if(monthvalue=="June"){
                            
                              firstDate=DateTime(2023,6,1);
                              lastdate=DateTime(2023,6,30);
                          
                         
                          }else if(monthvalue=="July"){
                            
                              firstDate=DateTime(2023,7,1);
                              lastdate=DateTime(2023,7,31);
                          
                         
                          }else if(monthvalue=="August"){
                            
                              firstDate=DateTime(2023,8,1);
                              lastdate=DateTime(2023,8,31);
                          
                         
                          }else if(monthvalue=="September"){
                            
                              firstDate=DateTime(2023,9,1);
                              lastdate=DateTime(2023,9,30);
                          
                         
                          }
                          else if(monthvalue=="October"){
                            
                              firstDate=DateTime(2023,10,1);
                              lastdate=DateTime(2023,10,31);
                          
                         
                          } else if(monthvalue=="November"){
                            
                              firstDate=DateTime(2023,11,1);
                              lastdate=DateTime(2023,11,30);
                          
                         
                          }else if(monthvalue=="December"){
                            
                              firstDate=DateTime(2023,12,1);
                              lastdate=DateTime(2023,12,31);
                          
                         
                          }
                          else{
                              firstDate=DateTime.now();
                              lastdate=DateTime(2100);
      
                          }
      
                         
                          
                          
                          DateTime? picdates=await showDatePicker(
                            initialDate: lastdate,
                            //initialDateRange: DateTimeRange(start: DateTime(2023,1,1),end: DateTime(2023,1,31)),
                           
                           firstDate: firstDate,lastDate: lastdate, context: context,
                         );
                                             
                         if(picdates!=null){
                           setState(() {
      
                             pickdateControlar.text=DateFormat("dd-MMMM-yyyy").format(picdates);
                            
                           });
                         }
                         
                          
                        
                        
                          
                }),
        
                          
                         
                        const SizedBox(height: 15,),
                          TextForm(
                            onSaved: (v) {
                              model.classtime=v;
                              
                            },
                            validator: (v) {
                              if(v!.isEmpty){
                            return "required attendence";
                          }
                              
                            },
                         controller: pickclass,
                         hintText: "Present class Time",
                         onTap: ()  async{
                           TimeOfDay?pickcurrenttimes=await showTimePicker(context: context, initialTime:  TimeOfDay.now());
        
                           if(pickcurrenttimes!=null){
                             setState(() {
                                pickclass.text=pickcurrenttimes.format(context);
                               
                             });
                            
                           }
                           
                         },
                          ),
                          const SizedBox(height: 15,),
                          TextForm(
                         controller: attendenceclass,
                         onSaved: (v) {
                          model.attendensetime=v!;
                           
                         },
                         hintText: "attendence time",
                         validator: (v) {
                          if(v!.isEmpty){
                            return "required attendence";
                          }
                           
                         },
                         onTap: ()  async{
                           TimeOfDay?pickcurrenttime=await showTimePicker(context: context, initialTime:  TimeOfDay.now());
        
                           if(pickcurrenttime!=null){
                             setState(() {
                                attendenceclass.text=pickcurrenttime.format(context);
                               
                             });
                            
                           }
                           
                         },
                          ),
                           const SizedBox(height: 15,),
                          TextForm(
                            onSaved: (v) {
                              model.persentabsence=v;
                              
                            },
                         controller: pa,
                         hintText: "Present/Absence",
                         validator: (v) {
                          if(v!.isEmpty){
                            return "required field";
                          }
                           
                         },
                         
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          ElevatedButton(onPressed: (() {
                            if(_fromkey.currentState!.validate()){
                              _fromkey.currentState!.save();
                              try{
                                data.addAttendenceDatabase(model: model,classname: widget.classname,sesson: sessionvalue);
                                historydatabase.addhistorydatabase(model: model, classname: widget.classname,session: sessionvalue);
                                monthhistory.addMonthHistory(model: model, classname: widget.classname,session: sessionvalue);
                                Get.snackbar("Attendence "," Sucessfully Save");
                                _fromkey.currentState!.reset();
                                Navigator.of(context).pop();
      
      
      
                              }catch(e){
                                Get.snackbar("Error "," Error is $e for Attendence");
                                 _fromkey.currentState!.reset();
                                Navigator.of(context).pop();
                                print("error is happend :$e");
      
                              }
                              _fromkey.currentState!.reset();
      
                            }
                            
                          }), child: const Text("Save"))
      
            ],))
            
        
        
      )
      
      ,
      floatingActionButton: SpeedDial(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.brown,
        activeBackgroundColor: Colors.green,
        activeIcon: Icons.menu,
         spacing: 15,
         animatedIcon: AnimatedIcons.menu_close,
         openCloseDial: isvalueopen,
         children: [
          SpeedDialChild(
            label: "Class-1",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const AddAttendese(classname: "Class_1",));
            },


          ),
          SpeedDialChild(
            label: "Class-2",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const AddAttendese(classname: "Class_2",));
            },


          ),
          SpeedDialChild(
            label: "Class-3",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const AddAttendese(classname: "Class_3",));
            },


          ),
          SpeedDialChild(
            label: "Class-4",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const AddAttendese(classname: "Class_4",));
            },


          ),
          SpeedDialChild(
            label: "Class-5",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const AddAttendese(classname: "Class_5",));
            },


          ),
          SpeedDialChild(
            label: "Class-6",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const AddAttendese(classname: "Class_6",));
            },


          ),
          SpeedDialChild(
            label: "Class-7",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const AddAttendese(classname: "Class_7",));
            },


          ),
          SpeedDialChild(
            label: "Class-8",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const AddAttendese(classname: "Class_8",));
            },


          ),
          SpeedDialChild(
            label: "Class-9",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const AddAttendese(classname: "Class_9",));
            },


          ),
          SpeedDialChild(
            label: "Class-10",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const AddAttendese(classname: "Class_10",));
            },


          )
         ],

      ),
      );
          

              
            
         
        
     
      
   
    
  }

  // Future <void >getdata(String name) async{
  //   await firestore.collection("student").doc("students").collection(name). snapshots();
  //               //stream:getdata(widget.classname),
  // }
  
  //Stream<List<StudentsModel>>getdata(String classname)=>firestore.collection("student").doc("students").collection(classname).snapshots().map((event) => event.docs.map((e) => StudentsModel.fromMap(e.data())).toList());
  
}
