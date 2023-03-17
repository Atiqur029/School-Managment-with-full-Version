import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schollapp/const/importent.dart';
import 'package:schollapp/reusable/textform.dart';
import 'package:schollapp/test/database/testexamdatabase.dart';
import 'package:schollapp/test/model/addtestmodel.dart';




class Test extends  StatefulWidget{
   const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {

  final _formkey=GlobalKey<FormState>();
  final examnamecontrolar=TextEditingController();
  AddTestModel model=AddTestModel();
  TestExamDatabase db=TestExamDatabase();

  
  

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(title: const Text("Test Name"),centerTitle: true,),
      body: Padding(padding: const EdgeInsets.only(left: 20,right: 20,top: 20),child: StreamBuilder(
        stream: examname(),
        
        builder: (context, snapshot) {
          if(snapshot.hasError){

            return const Center(child: Text("No Data Found"),);
          }else if(snapshot.hasData){
            return ListView.builder(
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: ((context, index) {
                final examlist=snapshot.data![index];
                return Text(examlist.testname!,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.deepPurple),);

              
            }));
          }return const Center(child: CircularProgressIndicator(),);
        
      },),),
      
      floatingActionButton: FloatingActionButton(onPressed: () {

        buildmethode();
        
      },child: const Icon(Icons.add),),
    );
  }

 buildmethode() {
  return Get.bottomSheet(Container(

    decoration: const BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),),),
    child:  Padding(padding: const EdgeInsets.all(20),
    child:
       Form(
      
      key: _formkey,
      child: ListView(
      shrinkWrap: true,
      children: [
        const Text("Add Exam Name",style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold,fontSize: 18),),

        const SizedBox(height: 20,),
         TextForm(
          controller: examnamecontrolar,
          validator: (v) {
            if(v!.isEmpty){
              return "Exam Text Required";
            }
            else{
              return null;
            }
            
          },
          onSaved: (v) {
           
              model.testname=v;
            
            
          },
         ),
        const SizedBox(height: 20,),
        ElevatedButton(onPressed: (() {
          if(_formkey.currentState!.validate()){
            _formkey.currentState!.save();
            db.addExam(model: model);
            _formkey.currentState!.reset();
            Navigator.of(context).pop();


          }

          
          
          
        }), child: const Text("Add"))

    
      ],

    )))));
 
    
      
    }
    
      Stream <List<AddTestModel>>examname() =>firestore.collection("test").doc("tests").collection("examlist").snapshots().map((event) => event.docs.map((e) => AddTestModel.fromMap(e)).toList());

    
}
