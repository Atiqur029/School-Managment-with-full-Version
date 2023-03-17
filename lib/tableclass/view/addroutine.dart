
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:schollapp/reusable/textform.dart';
import 'package:schollapp/tableclass/database/model/scedule.dart';
import 'package:schollapp/tableclass/database/seduledatabase.dart';

class ClassSceduleWithRoutine extends StatefulWidget {
  //final Schedules schedules=Schedules();
   const ClassSceduleWithRoutine({super.key, required this.schedules});
   final Schedules schedules;
   
    


  @override
  State<ClassSceduleWithRoutine> createState() => _ClassSceduleWithRoutineState();
}

class _ClassSceduleWithRoutineState extends State<ClassSceduleWithRoutine> {
  final _fromkey=GlobalKey<FormState>();
  
  Schedules schedules=Schedules();
  TextEditingController starttimeControlar=TextEditingController();
  TextEditingController endtimeControlar=TextEditingController();
  TextEditingController subjectControlar=TextEditingController();
  TextEditingController ?classnameControlar;
  TextEditingController  sirnameControlar=TextEditingController();
  Sheduledatabase database=Sheduledatabase();

  @override
  void initState() {
    classnameControlar=TextEditingController(text: widget.schedules.classname);
    
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text("Class Routine With Subject"),centerTitle: true,
        

      ),
      body:  Padding(padding: const EdgeInsets.all(16),child: Form(
        key: _fromkey,
        
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 50,),
            TextForm(
              controller: classnameControlar,
              hintText: "Class Name",
              textStyle: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.red),
              onSaved: (v) {
                schedules.classname=v;
                
              },
            ),
            const SizedBox(height: 15,),

            
            const SizedBox(height: 15,),
            
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
        
              ),
               child: DropdownButtonFormField(
                
                menuMaxHeight: 250,
                
               
              
                
                validator: ((value) {
                  if(value!.isEmpty){
                    return "fill up";
                    //Get.snackbar("dropdown"," Fillup ClassName");
                  }
                  return null;

                  
                }),
                
               decoration: InputDecoration(
                hintText: "DayWise Routine",
                fillColor: Colors.white,
                
                
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
             
               ),
                
                items:  const [
                  DropdownMenuItem(value: "All-Day",child: Text("All-day")),
                  DropdownMenuItem(value: "Sunday",child: Text("Sunday")),
                  DropdownMenuItem(value: "Monday",child: Text("MonDay")),
                  DropdownMenuItem(value: "Tuesday",child: Text("Twesday")),
                  DropdownMenuItem(value: "Wednesday",child: Text("Wednesday")),
                  DropdownMenuItem(value: "Thursday",child: Text("Thirstday")),
                  
             
             
               ],
              //  onSaved: (value){
              //   schedules.weakdey=value;
              //  } ,
               onChanged: (value) {
                 schedules.weakday=value;
               },
              //    onChanged: ((value) {
        
                  
              //     schedules.setweakday(value!);

        
                 
              //  }),
              
               
               ),
             ),
             const SizedBox(height: 15,),
             TextForm(
              hintText: "Sir Name",
              controller: sirnameControlar,
              validator: (v) {
                if(v!.isEmpty){
                  return "Sir Name Requred*";
                }
                return null;
              },
              onSaved: (v) {
                schedules.sirname=v;
                
              },
            ),
             const SizedBox(height: 15,),
             TextForm(
              controller: subjectControlar,
              hintText: "Subject Name*",
              onSaved: (v) {
                schedules.subjectname=v;
              },
              validator: (v) {
                if(v!.isEmpty){
                  return "required subject name";
            
                }
                
              },
             ),

             const SizedBox(height: 15,),
             TextForm(
              hintText: "Start Time",
               onSaved: ((v) {
                schedules.starttime=v;
                 
               }),
              
               controller: starttimeControlar,
                  onTap: () async{
                    TimeOfDay?picktime= await showTimePicker(context: context, initialTime: TimeOfDay.now());
                    setState(() {
                      starttimeControlar.text=picktime!.format(context);
                    });

                    
                  },
             ),
              const SizedBox(height: 15,),
             TextForm(
              hintText: "End Time",
              onSaved: (v) {
                schedules.endtime=v;
                
              },
               controller: endtimeControlar,
                  onTap: () async{
                    TimeOfDay?picktime= await showTimePicker(context: context, initialTime: TimeOfDay.now());
                    setState(() {
                      endtimeControlar.text=picktime!.format(context);
                    });

                    
                  },
             ),
             const SizedBox(
              height: 15,
             ),
             ElevatedButton(onPressed: (() {
              
              if(_fromkey.currentState!.validate()){
                _fromkey.currentState!.save();
                try{
                  database.adddatabase(model: schedules);
                  Get.snackbar("Data Save","Sucessfully",snackPosition: SnackPosition.BOTTOM);
                  Navigator.of(context).pop();

                }catch(e){
                  print("Error is $e");
                  Get.snackbar("Data error","error is $e",snackPosition: SnackPosition.BOTTOM);


                }

                

              }
               
             }), child: Text("Save"))
             




          ],
        )),),
    );
  }
}