

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:schollapp/attendence/model/attendence.dart';
import 'package:schollapp/const/importent.dart';
import 'package:schollapp/page/home.dart';
import 'package:schollapp/view/allstudentview/student/viewer.dart';

import '../../nextscrenn/nextscreen.dart';
import '../../reusable/textform.dart';

class Attendenseview extends StatefulWidget {
   final String classname;

   final String docname;
   const Attendenseview({super.key, required this.classname, required this.docname});

  @override
  State<Attendenseview> createState() => _AttendenseviewState();
}

class _AttendenseviewState extends State<Attendenseview> {
  ValueNotifier<bool> isvalueopen=ValueNotifier(false);
   final sesionControlar=TextEditingController();
   String sessionvalue="2014";

  
  @override
  Widget build(BuildContext context) {
    String classname=widget.classname;

  String docnames=widget.docname;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        
        leading: IconButton(onPressed: (() {
          gotonextscreen(context,  const Homepage());
          
        }), icon: const Icon(Icons.arrow_back)),
          
        
        title: const Text("View"),centerTitle: true,),
      body: Padding(padding: const EdgeInsets.all(10),
      
      child: ListView(
        shrinkWrap: true,
        children:[

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

                SizedBox(
                  height: 560.h,
                  child: StreamBuilder(
          stream: getdata(classname: classname,docnames: docnames,session: sessionvalue),
          builder: (context, snapshot) {
            if(snapshot.hasError){
              return Center(child: Text("Something Error ${snapshot.error}"),);
            }else if(snapshot.hasData){
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: ((context, index){
                  final viewlist=snapshot.data![index];
                  return Container(
                   
                    decoration: const BoxDecoration(
                       color: Colors.cyan,
                       boxShadow: [
                        BoxShadow(spreadRadius: 0.5,blurRadius: 1.0,color: Colors.amber,offset: Offset(1,2))
                       ]
      
                    ),
                    height: 100,
                    child: Card(
                      color: Colors.red,
                      child: ListTile(
                        leading: Container(
                          height: 100,
                          width: 115,
                          color: Colors.amber,
                          child: Column(
                            children: [
                              //Text("Roll ${snapshot.data}"),
                              Text(' Roll:${viewlist.getroll}',style: const TextStyle(fontSize: 11,color: Colors.white,fontWeight: FontWeight.bold ),),
                              //const SizedBox(height: 10,),
                              Text(viewlist.classname!,style: const TextStyle(fontSize: 11,color: Colors.red,fontWeight: FontWeight.bold ),),
                              //const SizedBox(height: 10,),
                              Text( "Subject ${viewlist.subject!}",style: const TextStyle(fontSize: 11,color: Colors.blue,fontWeight: FontWeight.bold ),),
                        
                              
                              
                        
                            ],
                          ),
                        ),
                        title: Column(
                          children: [
                            const SizedBox(height: 15,),
                            RichText(text: TextSpan(
                              children: [
                                TextSpan(text:"Class Time ${viewlist.classtime}",style: const TextStyle(fontSize: 8.5,color: Colors.white,fontWeight: FontWeight.bold)),
                                const TextSpan(text: "--"),
                                TextSpan(text:"Attendance Time ${viewlist.attendensetime}",style: const TextStyle(fontSize: 8.5,color: Colors.white,fontWeight: FontWeight.bold)),
      
                                
                                //style: const TextStyle(fontSize: 10,color: Colors.white,fontWeight: FontWeight.bold)),
                                
                              ]
                            ),),
                            Text("Date:${viewlist.date}",style: const TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 204, 217, 228)),),
                            Text("Present/Absence ${viewlist.persentabsence}",style: const TextStyle(fontSize: 10,fontWeight: FontWeight.bold,color: Colors.white),),
                          
      
                          ],
                          
                        ),
                        //subtitle: 
                      ),
      
                    ),
                  );
      
                }));
            }
            return const Center(child:CircularProgressIndicator());
          },
      
        ),
                )
        ]
         
         
      ) ,),
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
              gotonextscreen(context,  const Attendenseview(classname: "Class_1",docname:"Class_1" ,));
            },


          ),
          SpeedDialChild(
            label: "Class-2",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
               gotonextscreen(context, const Attendenseview(classname: "Class_2",docname: "Class_2",));
            }


          ),
          SpeedDialChild(
            label: "Class-3",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const Attendenseview(classname: "Class_3",docname: "Class_3",));
            },


          ),
          SpeedDialChild(
            label: "Class-4",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const Attendenseview(classname: "Class_4",docname: "Class_4",));
            },


          ),
          SpeedDialChild(
            label: "Class-5",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
               gotonextscreen(context, const Attendenseview(classname: "Class_5",docname: "Class_5",));
            },


          ),
          SpeedDialChild(
            label: "Class-6",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const Attendenseview(classname: "Class_6",docname: "Class_6",));
            },


          ),
          SpeedDialChild(
            label: "Class-7",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const Attendenseview(classname: "Class_7",docname: "Class_7",));
            },


          ),
          SpeedDialChild(
            label: "Class-8",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const Attendenseview(classname: "Class_8",docname: "Class_8",));
            },


          ),
          SpeedDialChild(
            label: "Class-9",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const Attendenseview(classname: "Class_9",docname: "Class_9",));
            },


          ),
          SpeedDialChild(
            label: "Class-10",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context, const Attendenseview(classname: "Class_10",docname: "Class_10",));
            },


          )

      


    ]));
    
    
  }
  
  

  Stream<List<AttendenceModel>>getdata({required classname ,required docnames,required String session})=>
  firestore.collection("Attendence").doc(session.isEmpty?"_1":session).collection(session.isEmpty?"_1":session).doc(classname).collection(classname).snapshots()
  .map((event) => event.docs.map((e) => AttendenceModel.fromMap(e)).toList());
  
}