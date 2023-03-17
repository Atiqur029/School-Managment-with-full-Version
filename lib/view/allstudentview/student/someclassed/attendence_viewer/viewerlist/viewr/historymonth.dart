



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'package:schollapp/const/importent.dart';
import 'package:schollapp/page/home.dart';
import 'package:schollapp/view/allstudentview/student/viewer.dart';

import '../../../../../../../attendence/view/historymonth.dart';
import '../../../../../../../nextscrenn/nextscreen.dart';
import '../../../../../../../reusable/textform.dart';



class HistoryMonthforallviwer extends StatefulWidget {

  final String classes;

  final  String monthdoc;
  
  const HistoryMonthforallviwer({super.key, required this.classes,required this.monthdoc});

  @override
  State<HistoryMonthforallviwer> createState() => _HistoryMonthforallviwerState();
}

class _HistoryMonthforallviwerState extends State<HistoryMonthforallviwer> {
  ValueNotifier<bool> isvalueopen=ValueNotifier(false);

  String month="";
  String classname="";
  final sesionControlar=TextEditingController();

  
   String sessionvalue="2014";

  List<String> ofmonth=[
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
  String firstvalue="January";

  String monthdocs="";
  

@override
  void initState() {
    classname=widget.classes;
    monthdocs=widget.monthdoc;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    

     
  



    //Future<AggregateQuerySnapshot> count=firestore.collection("monthhisory").doc("Class_1").collection("Class_1").doc("January").collection("January").count().get();
    return Scaffold(
      backgroundColor: Colors.grey,
       

      appBar:AppBar(title:  Text("Month History of Attend Student for $classname",
      style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white),),),
     
        
      
      body:  Padding(padding: const EdgeInsets.all(12),
      child: ListView(
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
         
            Container(
              height: 50,
              color: Colors.yellow,
              padding: EdgeInsets.only(left: 15.w),
              
              child: DropdownButtonFormField(
                dropdownColor: Colors.white,
                value: firstvalue,
                items: ofmonth.map((e) =>DropdownMenuItem(value: e.toString(),child: Text(e),) ).toList(),
                onChanged: (value) {
                  setState(() {
                    firstvalue=value.toString();
                    monthdocs=firstvalue;
                  });
                 
                  
                },

              ),
            ),

            const SizedBox(
              height: 15,
            ),

            Container(
              height: 60.h,
              
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10.w),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepOrange,
                    blurRadius: 8.r,
                    spreadRadius: 10.r,
                    offset: Offset(2, 3)

                  )
                ]
              ),
              child: Center(
                child: StreamBuilder(
            
                  stream: firestore.collection("monthhisory").doc(sessionvalue.isEmpty?"_1":sessionvalue).collection(sessionvalue.isEmpty?"_1":sessionvalue).doc(classname).collection(classname).doc(monthdocs).collection(monthdocs).snapshots(),
            
                  
                  builder: ((context, snapshot) {
                    var counts="";
            
                    
            
                  if(!snapshot.hasData){
                    return const Center(child: Text("Loading"),);
            
            
                  }else if(snapshot.hasData){
                    for(int i=0;i<snapshot.data!.docs.length;i++){
                      final count=snapshot.data!.docs.length;
                      counts=count.toString();
            
                      
                    }
                    return Text("This $monthdocs Attend  of $classname Students are: $counts",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),textAlign: TextAlign.center,);
            
                  }
                  return const Center(child: CircularProgressIndicator(),);
                  
                })),
              ),
            )

            
              


              
             
              

               
      
                  
                  
         
          
      
      
      ])),
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
              gotonextscreen(context,  const HistoryMonthforallviwer(classes: "Class_1",monthdoc: "abc",));
            },


          ),
          SpeedDialChild(
            label: "Class-2",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
               gotonextscreen(context,  const HistoryMonthforallviwer(classes: "Class_2",monthdoc: "abc",));
               //gotonextscreen(context,  HistoryMonth(classes: "Class_2",monthdoc: monthdocs,));
            }


          ),
          SpeedDialChild(
            label: "Class-3",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
               gotonextscreen(context,  const HistoryMonthforallviwer(classes: "Class_3",monthdoc: "abc",));
              //gotonextscreen(context,  HistoryMonth(classes: "Class_3",monthdoc: monthdocs,));
            },


           ),
          SpeedDialChild(
            label: "Class-4",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
               gotonextscreen(context,  const HistoryMonthforallviwer(classes: "Class_4",monthdoc: "abc",));
             // gotonextscreen(context,  HistoryMonth(classes: "Class_4",monthdoc: monthdocs,));
            },


          ),
          SpeedDialChild(
            label: "Class-5",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
               gotonextscreen(context,  const HistoryMonthforallviwer(classes: "Class_5",monthdoc: "abc",));
               //gotonextscreen(context,  HistoryMonth(classes: "Class_5",monthdoc: monthdocs,));
            
            },),


          // ),
          SpeedDialChild(
            label: "Class-6",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
               gotonextscreen(context,  const HistoryMonthforallviwer(classes: "Class_6",monthdoc: "abc",));
              //gotonextscreen(context,   HistoryMonth(classes: "Class_6",monthdoc: monthdocs,));
            },


          ),
          SpeedDialChild(
            label: "Class-7",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
               gotonextscreen(context,  const HistoryMonthforallviwer(classes: "Class_7",monthdoc: "abc",));
              //gotonextscreen(context,   HistoryMonth(classes: "Class_7",monthdoc: monthdocs,));
            },


          ),
          SpeedDialChild(
            label: "Class-8",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
               gotonextscreen(context,  const HistoryMonthforallviwer(classes: "Class_8",monthdoc: "abc",));
              //gotonextscreen(context, HistoryMonth(classes: "Class_8",monthdoc: monthdocs,));
            },


           ),
          SpeedDialChild(
            label: "Class-9",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
               gotonextscreen(context,  const HistoryMonthforallviwer(classes: "Class_9",monthdoc: "abc",));
              //gotonextscreen(context,  HistoryMonth(classes: "Class_9",monthdoc: monthdocs,));
            },


           ),
          SpeedDialChild(
            label: "Class-10",
            backgroundColor: Colors.red,
            labelStyle: const TextStyle(color: Colors.deepOrange,fontSize: 15,fontWeight: FontWeight.bold),
            child: const Icon(Icons.class_outlined,color: Colors.white,),
            onTap: () {
               gotonextscreen(context,  const HistoryMonthforallviwer(classes: "Class_10",monthdoc: "abc",));
              //gotonextscreen(context,  HistoryMonth(classes: "Class_10",monthdoc: monthdocs,));
            },


          )

      


    ]));
    
  }
  

  
}