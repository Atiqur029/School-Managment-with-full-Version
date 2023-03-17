// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:schollapp/attendence/model/attendence.dart';


import 'package:schollapp/const/importent.dart';
import 'package:schollapp/nextscrenn/nextscreen.dart';


import '../../../../../../../reusable/textform.dart';




class RollwisehistoryofAllViewer extends StatefulWidget {

  
    final String classname;
   const RollwisehistoryofAllViewer({
     required this.classname,
    Key? key,
    
  }) : super(key: key);

  @override
  State<RollwisehistoryofAllViewer> createState() => _RollwisehistorryState();
}

class _RollwisehistorryState extends State<RollwisehistoryofAllViewer> {
  ValueNotifier<bool> isvalueopen=ValueNotifier(false);
   final sesionControlar=TextEditingController();
   String sessionvalue="2014";

  String  presentclass="-1";

  
  String  rollid="_1"; 
 

  String ?classname;

 
 @override
  void initState() {
    classname=widget.classname;
    
  
  //rolldoc=widget.rooldoc;
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
 


    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(

       
        title:  Text("Roll $rollid "),centerTitle: true,),
      body:  Padding(padding: const EdgeInsets.all(12),
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
                  

                ),
          SizedBox(height: 10.h,),
         StreamBuilder(
          stream: firestore.collection("student").doc(sessionvalue.isEmpty?"-1":sessionvalue).collection(sessionvalue.isEmpty?"-1":sessionvalue).doc("students").collection(classname!).snapshots(),
          builder: (context, snapshot) {
            if(snapshot.hasError){
              return Center(child: Text("Something Error ${snapshot.error}"),);
            }else if(snapshot.hasData){
            
              String roolidlist="";

              List rolllist=[];

              for(int i=0;i<snapshot.data!.docs.length;i++){
                final classroll=snapshot.data!.docs[i].data()["rollnumber"];
                
                rolllist.add(classroll);
                roolidlist=classroll;
              
              
                
                
                

              }
      
              return Container(
                
             
              color: Colors.yellow,
              padding: EdgeInsets.only(left: 15.w),
              
                child:DropdownButtonFormField(
                  dropdownColor: Colors.white,
                  items: rolllist.map((e) {
                
                  return DropdownMenuItem( value: e.toString(),child: Text(e.toString()));

                }).toList(), 
                value: roolidlist,
                
                onChanged:((value) {
                  setState(() {
                     roolidlist=value.toString();
                     rollid=roolidlist;
                    
                  });
                  
                    
                  
                  
                  
                })) ,
              );
               
      
      
      
              // return ListView.builder(
              //   shrinkWrap: true,
              //   itemCount: snapshot.data!.length,
              //   itemBuilder: ((context, index){
              //     final viewlist=snapshot.data![index];
      
                  
                  
              //   }));
            }
            return const Center(child:CircularProgressIndicator());
          },
      
        ),

        const SizedBox(
          height: 15,
        ),

        StreamBuilder(

          stream: getdata(classname: classname!,rolldoc: rollid,roolid: rollid,session: sessionvalue),
          //stream: firestore.collection("history").doc(docnames).collection(presentclass).doc(rollid).collection(rollid).snapshots(),
          //getdata(classname: presentclass, docname: docnames, rolldoc: rollid, roolid: rollid),
          
          builder: ((context, snapshot) {
          if(snapshot.hasError){
            return const Center(child: Text("Loading"),);

            
          }else if(snapshot.hasData){
            
            // for (int i=0 ;i<snapshot.data!.docs.length;i++){
            //   final historylist=snapshot.data!.docs[i].data();
              return ListView.builder(
                itemCount: snapshot.data!.length,
                shrinkWrap: true,

                itemBuilder: (context, index) {
                  final list=snapshot.data![index];
                  return ListView(
                    shrinkWrap: true,

                  
                  
                
                 children: [
                  Container(
                    alignment: Alignment.center,
                    height: 120,
                    //color: Colors.red,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      gradient: LinearGradient(colors: [
                        Colors.pinkAccent.shade100,Colors.accents.first,Colors.accents.last,
                        
                      ],begin: Alignment.topLeft,end: Alignment.bottomLeft),
                      boxShadow: const [
                        BoxShadow(
                          
                          color: Colors.amber,
                          spreadRadius: 0.5,blurRadius: 1.0,offset: Offset(2.5,1)
                        )
                      ]
                    ),
                    child: Card(
                      elevation: 8,
                      clipBehavior: Clip.antiAlias,
                      shadowColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      child:  Container(
                        height: 100,
                        //width: 60,
                        color: Colors.white,
                        child: ListTile(
                          leading: Column(
                            children: [
                              Text(list.classname!,style: const TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),),
                              Text( "Subject:${list.subject}",style: const TextStyle(color: Color.fromARGB(255, 197, 152, 122),fontSize: 10,fontWeight: FontWeight.bold),),
                              RichText(text: TextSpan(
                                children: [
                                  TextSpan(text:"Month:${list.month}",style: const TextStyle(color: Color.fromARGB(255, 151, 122, 197),fontSize: 10,fontWeight: FontWeight.bold) )
                                ]
                              ),)
                            ],

                            
                          ),
                          title: Padding (
                            padding: const EdgeInsets.only(top: 15),
                            child: Column(
                              children: [
                                RichText(text: TextSpan(children: [
                                  TextSpan(text:"ClassTime:${list.classtime}",style: const TextStyle(color: Color.fromARGB(255, 151, 122, 197),fontSize: 9,fontWeight: FontWeight.bold) ),
                                  const TextSpan(text:"--",style: TextStyle(color: Color.fromARGB(255, 151, 122, 197),fontSize: 5,fontWeight: FontWeight.bold) ),
                                  TextSpan(text:"AttendanceTime:${list.attendensetime}",style: const TextStyle(color: Color.fromARGB(255, 151, 122, 197),fontSize: 9,fontWeight: FontWeight.bold) ),
                                  //TextSpan(text:"AttendanceTime:${list.value}",style: const TextStyle(color: Color.fromARGB(255, 151, 122, 197),fontSize: 9,fontWeight: FontWeight.bold) ),

                                ])),
                                 Text(" Date ${list.date}",style: const TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.bold),),
                                 Text(" Present/Absent: ${list.persentabsence}",style: const TextStyle(color: Color.fromARGB(255, 196, 176, 175),fontSize: 15,fontWeight: FontWeight.bold),),
                          
                            
                              ],
                            ),
                          ),
                        ),
                      ),



                    ),
                  )
              

              ],);
              

              });
            
            
          }
          return  const Center(child: CircularProgressIndicator(),);

          
        }))


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
              gotonextscreen(context,   const RollwisehistoryofAllViewer(classname: "Class_1",));
            },


          ),
          SpeedDialChild(
            label: "Class-2",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context,   const RollwisehistoryofAllViewer(classname: "Class_2"));
               //gotonextscreen(context,  Rollwisehistorry (classname: "Class_2",docname: "Class_2",roolid: rollid,));
            }


          ),
          SpeedDialChild(
            label: "Class-3",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context,   const RollwisehistoryofAllViewer(classname: "Class_3"));
             // gotonextscreen(context,  Rollwisehistorry (classname: "Class_3",docname: "Class_3",roolid: rollid,));
            },


          ),
          SpeedDialChild(
            label: "Class-4",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context,   const RollwisehistoryofAllViewer(classname: "Class_4"));
              //gotonextscreen(context, Rollwisehistorry (classname: "Class_4",docname: "Class_4",roolid: rollid,));
            },


          ),
          SpeedDialChild(
            label: "Class-5",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context,   const RollwisehistoryofAllViewer(classname: "Class_5"));
               //gotonextscreen(context, Rollwisehistorry (classname: "Class_5",docname: "Class_5",roolid: rollid,));
            },


          ),
          SpeedDialChild(
            label: "Class-6",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context,   const RollwisehistoryofAllViewer(classname: "Class_6"));
              //gotonextscreen(context, Rollwisehistorry (classname: "Class_6",docname: "Class_6",roolid: rollid,));
            },


          ),
          SpeedDialChild(
            label: "Class-7",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context,   const RollwisehistoryofAllViewer(classname: "Class_7"));
              //gotonextscreen(context,  Rollwisehistorry (classname: "Class_7",docname: "Class_7",roolid: rollid,));
            },


          ),
          SpeedDialChild(
            label: "Class-8",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context,   const RollwisehistoryofAllViewer(classname: "Class_8"));
              //gotonextscreen(context, Rollwisehistorry (classname: "Class_8",docname: "Class_8",roolid: rollid,));
            },


          ),
          SpeedDialChild(
            label: "Class-9",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context,   const RollwisehistoryofAllViewer(classname: "Class_9"));
              //gotonextscreen(context, Rollwisehistorry (classname: "Class_9",docname: "Class_9",roolid: rollid,));
            },


          ),
          SpeedDialChild(
            label: "Class-10",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
              gotonextscreen(context,   const RollwisehistoryofAllViewer(classname: "Class_10"));
              //gotonextscreen(context,  Rollwisehistorry (classname: "Class_10",docname: "Class_10",roolid: rollid,));
            },


          )

      


    ]));
    
    
  }
  
  


      
  Stream<List<AttendenceModel>>getdata({required String classname,required String rolldoc,required String roolid,required String session})=>firestore.collection("history").doc(session.isEmpty?"_1":session).collection(session.isEmpty?"_1":session).doc(classname).collection(classname).doc(rolldoc).collection(roolid).snapshots().map((event) => event.docs.map((e) =>AttendenceModel.fromMap(e)).toList()) ;   

    
  }
