import 'package:flutter/material.dart';

import 'package:schollapp/class/classandsectionmodel.dart';
import 'package:schollapp/class/classdatabase.dart';

import 'package:schollapp/const/importent.dart';

import 'package:schollapp/reusable/textform.dart';

class ClassNameview extends StatefulWidget {
  const ClassNameview({super.key});

  @override
  State<ClassNameview> createState() => _ClassNameState();
}

class _ClassNameState extends State<ClassNameview> {
  ClassDatabase database=ClassDatabase();

  
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
        
  },));
  }
  
   Stream<List<SectionandClassModel>>getdata()=>firestore.collection("sectionandclass").snapshots().map((event) => event.docs.map((e) => SectionandClassModel.fromMap(e)).toList());}