// ignore_for_file: public_member_api_docs, sort_constructors_first


import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:schollapp/id/viewid.dart';

import 'package:schollapp/nextscrenn/nextscreen.dart';
import 'package:schollapp/screen/student/addnewstudent.dart';

import 'package:schollapp/upload_downloadfile/download.dart';

import '../../class/classname.dart';
import '../../page/addproduct.dart';



class Students extends StatefulWidget {
  const Students({super.key});

  @override
  State<Students> createState() => _StudentsState();
}

class _StudentsState extends State<Students> {


 ValueNotifier<bool> isvalueopen=ValueNotifier(false);
  

  @override
  Widget build(BuildContext context) {

      
    return WillPopScope(
      onWillPop: (() async{
        if(isvalueopen.value){
          isvalueopen.value=false;
          return false;
        }
        else{
          return true;
        }
        
        
      }),

      child: Scaffold(
        appBar: AppBar(title: const Text("Students"),centerTitle: true,),

        
      floatingActionButton:  SpeedDial(
      
      
      activeBackgroundColor: Colors.deepOrange,
      animatedIcon: AnimatedIcons.menu_close,
      //overlayColor: Colors.white,
     // overlayOpacity: 0.5,
      spacing: 15,
      //closeManually: true,
      openCloseDial: isvalueopen,
      
      backgroundColor: const Color.fromARGB(255, 64, 233, 255),
      children: [

       
        SpeedDialChild(
          
          label: "Student Add",
          labelBackgroundColor: Colors.green,
          labelStyle: const TextStyle(color: Colors.white),
          backgroundColor: Colors.red,
          onTap: () {
            gotonextscreen(context, const  AddNewStudent());
          
            
            
          },
          
           child: const Icon(Icons.add,color: Colors.white,)
            
          
        ),
        SpeedDialChild(
          label: "Import/Export",
          labelBackgroundColor: Colors.green,
          labelStyle: const TextStyle(color: Colors.white),
          
          backgroundColor: Colors.red,
           onTap: () {
            gotonextscreen(context, const Download());
            
            
          },
          
           child: const Icon(Icons.import_export,color: Colors.white,)
          // child: IconButton(onPressed: (() {
            
          // }), icon: const Icon(Icons.import_export,color: Colors.white,))
        ),
        SpeedDialChild(
          label: "ID",
          labelBackgroundColor: Colors.green,
          labelStyle: const TextStyle(color: Colors.white),
          backgroundColor: Colors.red,
           onTap: () {
            gotonextscreen(context, const Viewid());
            
            
          },
          
           child: const Icon(Icons.person,color: Colors.white,)
          // child: IconButton(onPressed: (() {
            
          // }), icon: const Icon(Icons.person,color: Colors.white,))
        ),
         
    
      ],
      ),
      
      ),
    );
  
  }
  
  // getallStudent(AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {

  //   snapshot.data!.docs.map((doc) => ListTile(title: Text(doc["fathername"]),));
  // }

  

    

  
 
 
 
 }
 

  
 

  
    
  
 
  

              
  

          

        

      
    
