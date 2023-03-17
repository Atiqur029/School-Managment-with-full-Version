import 'package:flutter/material.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:schollapp/const/importent.dart';
import 'package:schollapp/nextscrenn/nextscreen.dart';
import 'package:schollapp/page/home.dart';
import 'package:schollapp/tableclass/database/model/scedule.dart';

class Routineview extends StatefulWidget {
  final String classname;
  const Routineview({super.key,  required this.classname});

  @override
  State<Routineview> createState() => _RoutineviewState();
}



class _RoutineviewState extends State<Routineview> {
  ValueNotifier<bool> isvalueopen=ValueNotifier(false);
  String name="";

  @override
  void initState() {
    name=widget.classname;
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        leading: IconButton(onPressed: (() {
          gotonextscreen(context,  Homepage());
          
        }), icon: const Icon(Icons.arrow_back)),
        
        title: const Text("Routine view"),),
      body: Padding(padding: const
      EdgeInsets.all(15),
      child: StreamBuilder(
        stream: getdata(name),
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Center(child: Text("Error is ${snapshot.error}"),);
          }
          else if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              
              itemBuilder: ((context, index) {
                final schedulelist=snapshot.data![index];
                return  Container(
                  height: 100,
                  decoration: BoxDecoration(
                    
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: const Offset(0, 5)
                      )
                    ]
                    
                  ),
                  child: Card(color: Colors.white,
                  child:  ListTile(
                    leading: Container(
                      //height: 120,
                      width: 150,
                      color: Colors.red,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                             
                              children: [
                                Text(schedulelist.starttime!,style: const TextStyle(fontSize: 10,color: Colors.white),),
                                const Text("-----",style: TextStyle(color: Colors.white),),
                                Text(schedulelist.endtime!,style: const TextStyle(fontSize: 10,color: Colors.white),),
                                
                                
                              ],
                            ),
                          ),
                          const SizedBox(height:10 ,),
                          Text(schedulelist.subjectname!,style: const TextStyle(fontSize: 12,color: Colors.white,fontWeight: FontWeight.bold),)
                        ],
                      ),
                      
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(" Teacher Name:${schedulelist.sirname!}",style: const TextStyle(color: Colors.orange,fontSize: 13,fontWeight: FontWeight.bold),),
                    ),
                    subtitle: Column(
                      children: [
                        Text(" Weak of ${schedulelist.weakday!}",style: const TextStyle(color: Colors.green,fontSize: 9),),
                        Text(" ${schedulelist.classname!}",style: const TextStyle(color: Colors.cyan,fontSize: 8),),
                      ],
                      
                    ),
                  ),
                  ),
                );
                
              }));
          }else{
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
      ),
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
              gotonextscreen(context, const Routineview(classname: "Class1",));
            },


          ),
          SpeedDialChild(
            label: "Class-2",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const Routineview(classname: "Class2",));
            },


          ),
          SpeedDialChild(
            label: "Class-3",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const Routineview(classname: "Class3",));
            },


          ),
          SpeedDialChild(
            label: "Class-4",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const Routineview(classname: "Class4",));
            },


          ),
          SpeedDialChild(
            label: "Class-5",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const Routineview(classname: "Class5",));
            },


          ),
          SpeedDialChild(
            label: "Class-6",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const Routineview(classname: "Class6",));
            },


          ),
          SpeedDialChild(
            label: "Class-7",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const Routineview(classname: "Class7",));
            },


          ),
          SpeedDialChild(
            label: "Class-8",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const Routineview(classname: "Class8",));
            },


          ),
          SpeedDialChild(
            label: "Class-9",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const Routineview(classname: "Class9",));
            },


          ),
          SpeedDialChild(
            label: "Class-10",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const Routineview(classname: "Class10",));
            },


          )
         ],

      ),
    );
  }

  Stream<List<Schedules>>getdata(String ?name){
    if(name!=null){
      return firestore.collection("Schedule").doc("allclasses").collection(name).snapshots().map((event) => event.docs.map((e) => Schedules.fromMap(e)).toList());

    }
    else{
      return firestore.collection("Schedule").doc("allclasses").collection("Class1").snapshots().map((event) => event.docs.map((e) => Schedules.fromMap(e)).toList());
    }
    
    
    
}}