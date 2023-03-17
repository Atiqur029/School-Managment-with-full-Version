import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schollapp/class/classandsectionmodel.dart';
import 'package:schollapp/class/classdatabase.dart';
import 'package:schollapp/class/sectionandclassedit.dart';
import 'package:schollapp/const/importent.dart';
import 'package:schollapp/nextscrenn/nextscreen.dart';
import 'package:schollapp/reusable/textform.dart';

class ClassName extends StatefulWidget {
  const ClassName({super.key});

  @override
  State<ClassName> createState() => _ClassNameState();
}

class _ClassNameState extends State<ClassName> {
  ClassDatabase database=ClassDatabase();

   final _fromkey=GlobalKey<FormState>();
   final classControlar=TextEditingController();
   final sectionControlar=TextEditingController();
   final serchControlar=TextEditingController();
   Widget text=const Text("Class and Section Name");
   Icon customicon=const Icon(Icons.search);

   String classes="";

  SectionandClassModel model=SectionandClassModel();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        title: text,centerTitle: true,
        actions: [
        InkWell(
          onTap: () {
            
            if(customicon.icon==Icons.search){
              text= TextForm(
                
                controller: sectionControlar,
                onChanged: ((v) {
                  setState(() {
                    classes=v;
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
                
                if(classes.isEmpty){
                  return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      Row(children: [
                        Text(classlist.classes!,style: const TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                        Text("(${classlist.section})",style: const TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),

                        const SizedBox(width: 120,),
                         Row(
                         
                          
                          children: [
                            IconButton(onPressed: (() {
                              gotonextscreen(context, EditingClassandSection(model: SectionandClassModel(id: classlist.id,classes: classlist.classes,section: classlist.section)));
                              
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
               

                }if(classlist.classes.toString().contains(classes.toUpperCase())){
                  return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      
                      Row(
                        
                        children: [
                        
                        Text(classlist.classes!,style: const TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                        Text("(${classlist.section})",style: const TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                          const SizedBox(width: 120,),
                         Row(
                          
                          children: [
                            InkWell(onTap: (() async{
                               
                               gotonextscreen(context, EditingClassandSection(model: SectionandClassModel(id: classlist.id,classes: classlist.classes,section: classlist.section),));
                              
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
                   controller: classControlar,
                   
                   validator: ((v) {
                    if(v!.isEmpty||v.length<2){
                      return "Field isnot emty or field must be 2 charecter";
                      

                    }else{
                      return null;
                    }
        
                   }),
                   onSaved:((v) {
                     model.classes=v;
                     
                   }) ,
                   ),
                   const SizedBox(height: 20,),
                   TextForm(hintText: "Section name",
                   controller: sectionControlar,
                   keyboardType: TextInputType.number,
                   validator: ((v) {
                    if(v!.isEmpty){
                      return "Field isnot emty or field must be 2 charecter";
                      

                    }else{
                      return null;
                    }
        
                   }),
                   onSaved:((v) {
                     model.section=v;
                     
                   }) ,
                   
                   ),
                   const SizedBox(height: 20,),
                   ElevatedButton(onPressed: (() {
                    if(_fromkey.currentState!.validate()){
                      _fromkey.currentState!.save();
                      database.addclassandSection(model);
                     Get.snackbar("Class and Section","Save Sucessfully",snackPosition: SnackPosition.BOTTOM);
                    }
                    else{
                      Get.snackbar("Faild", "Save");
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
  
  Stream<List<SectionandClassModel>>getdata()=>firestore.collection("sectionandclass").snapshots().map((event) => event.docs.map((e) => SectionandClassModel.fromMap(e)).toList());
}