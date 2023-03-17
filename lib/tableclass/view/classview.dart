import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schollapp/class/classandsectionmodel.dart';
import 'package:schollapp/const/importent.dart';
import 'package:schollapp/model/studentmodel.dart';
import 'package:schollapp/page/home.dart';
import 'package:schollapp/reusable/textform.dart';
import 'package:schollapp/tableclass/database/classdatabase.dart';
import 'package:schollapp/tableclass/database/classmodel.dart';
import 'package:schollapp/tableclass/database/model/scedule.dart';
import 'package:schollapp/tableclass/view/addroutine.dart';

import '../../nextscrenn/nextscreen.dart';
import '../edit/classedit.dart';


class ClassView extends StatefulWidget {
  const ClassView({super.key});

  @override
  State<ClassView> createState() => _ClassViewState();
}

class _ClassViewState extends State<ClassView> {
  TextEditingController serchControlar=TextEditingController();
   TextEditingController nameControlar=TextEditingController();
   final _fromkey=GlobalKey<FormState>();
   ClassDatabase database=ClassDatabase();
   TableClass classes=TableClass();

  Widget text= const Text("Class Schedule");
  Icon customicon=const Icon(Icons.search);
  String  serch="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
     
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        leading: IconButton(onPressed: (() {
          gotonextscreen(context,  Homepage());
          
        }), icon: const Icon(Icons.arrow_back)),
          
        
        backgroundColor: Colors.grey,
        elevation: 0,
        title: text,centerTitle: true,
        actions: [
        InkWell(
          onTap: () {
            
            if(customicon.icon==Icons.search){
              text= TextForm(
                
                controller: serchControlar,
                onChanged: ((v) {
                  setState(() {
                    serch=v;
                  });
                  
                }),
                  
                  hintText: "Search",
              );
              customicon=const Icon(Icons.cancel);
              
              setState(() {
                
              });
            }else{
              text=const Text("Class and Section Name");
                
                
                  
             
              customicon=const Icon(Icons.search);
              setState(() {
                
              });

            }
          },
          child: customicon,
        ),
        const InkWell(
          child: Icon(Icons.more_vert),
        ),
      ],),
      body: StreamBuilder(
        stream: getdata(),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Center(child: Text("Somrthing has happend ${snapshot.error}"),);

          }else if(snapshot.hasData){
            
            
              return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              
              itemBuilder: ((context, index) {
                final classlist=snapshot.data![index];
                
                if(serch.isEmpty){
                  return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Row(children: [
                        InkWell(
                          onTap: () {
                            gotonextscreen(context,  ClassSceduleWithRoutine(schedules: Schedules(id: classlist.id,classname: classlist.classname),));
                          },
                          
                          child: Text(classlist.classname!,style: const TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)),
                        //Text("(${classlist.section})",style: const TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),

                        const SizedBox(width: 160,),
                         Row(
                         
                          
                          children: [
                            IconButton(onPressed: (() {
                              gotonextscreen(context, ClassEdit(tableCell:TableClass(id: classlist.id,classname: classlist.classname) ,));
                              
                            }), icon: const Icon(Icons.edit,color: Colors.red,)),
                             IconButton(onPressed: (() async{
                               ClassDatabase database=ClassDatabase();
                               database.delete(classlist.id!);
                              
                            }), icon: const Icon(Icons.delete,color: Colors.red,))

                          ],
                         )

                      ],)
                    ],

                  ),
                );
               

                }if(classlist.classname.toString().contains(serch.toUpperCase())){
                  return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Row(children: [
                        InkWell(
                          onTap: () {
                            gotonextscreen(context,  ClassSceduleWithRoutine(schedules: Schedules(id: classlist.id,classname: classlist.classname),));
                          },
                          
                          child: Text(classlist.classname!,style: const TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),)),
                        //Text("(${classlist.section})",style: const TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                         const SizedBox(width: 150,),
                         Row(
                          
                          children: [
                            InkWell(onTap: (() async{
                               
                               gotonextscreen(context,ClassEdit(tableCell: TableClass(id: classlist.id,classname: classlist.classname),) );
                              
                            }),child: const Icon(Icons.edit,color: Colors.red,),  ),
                             IconButton(onPressed: (() async{
                              ClassDatabase database=ClassDatabase();
                               database.delete(classlist.id!);
                             
                              
                            }), icon: const Icon(Icons.delete,color: Colors.red,))
                      
                          ],
                        )
                      
                      ],)
                    ],

                  ),
                );
                

                }
                return Container();
                //end of condition
            }));
              
            
              
            }
          
          
          else{
            return const Center(child: CircularProgressIndicator(),);
          }
        
  },),
      floatingActionButton: FloatingActionButton(onPressed: (() {
        showDialog(context: context, builder: ((context) {
          return Dialog(
            child: Container(
              height: 300,
              width: 200,
              color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _fromkey,
                  child:ListView(shrinkWrap: true,
                children: [
                   const SizedBox(height: 50,),
                   TextForm(hintText: "Class Name",
                   controller: nameControlar,
                   
                   validator: ((v) {
                    if(v!.isEmpty||v.length<2){
                      return "Field isnot emty or field must be 2 charecter";
                      

                    }else{
                      return null;
                    }
        
                   }),
                   onSaved:((v) {
                     classes.classname=v;
                     
                   }) ,
                   ),
                   const SizedBox(height: 20,),
                   
                   const SizedBox(height: 20,),
                   ElevatedButton(onPressed: (() {
                    if(_fromkey.currentState!.validate()){
                      _fromkey.currentState!.save();
                      database.addclass(classes);
                     Get.snackbar("Class and Section","Save Sucessfully",snackPosition: SnackPosition.BOTTOM);
                     Navigator.of(context).pop();
                    }
                    else{
                      Get.snackbar("Faild", "Failed saved");
                    }
                    
                    
                    
                     
                   }), child: const Text("Save"))
                ],)),
              ),
            ),
          );
          
        }));
        
      }),child: const Icon(Icons.add),),
      
    );


    
  }
  Stream<List<TableClass>> getdata()=>firestore.collection("tableClass").snapshots().map((event) => event.docs.map((e) => TableClass.fromMap(e)).toList());
}

