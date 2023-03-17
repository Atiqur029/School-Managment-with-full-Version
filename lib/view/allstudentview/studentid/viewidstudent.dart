import 'package:flutter/material.dart';


import 'package:schollapp/nextscrenn/nextscreen.dart';
import 'package:schollapp/view/allstudentview/studentid/classwisestudentview/studentclassnameid/class2.dart';
import 'package:schollapp/view/allstudentview/studentid/classwisestudentview/studentclassnameid/class3.dart';
import 'package:schollapp/view/allstudentview/studentid/classwisestudentview/studentclassnameid/class4.dart';
import 'package:schollapp/view/allstudentview/studentid/classwisestudentview/studentclassnameid/class5.dart';
import 'package:schollapp/view/allstudentview/studentid/classwisestudentview/studentclassnameid/class6.dart';
import 'package:schollapp/view/allstudentview/studentid/classwisestudentview/studentclassnameid/class7.dart';

import 'classwisestudentview/studentclassnameid/class1.dart';
import 'classwisestudentview/studentclassnameid/class10.dart';
import 'classwisestudentview/studentclassnameid/class8.dart';
import 'classwisestudentview/studentclassnameid/class9.dart';

class Viewidstudent extends StatefulWidget {
  const Viewidstudent({super.key});

  @override
  State<Viewidstudent> createState() => _ViewidState();
}

class _ViewidState extends State<Viewidstudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View Id"),
      ),
      body: Padding(padding: const EdgeInsets.all(15),child: ListView(
        shrinkWrap: true,
        children: [
          ElevatedButton(onPressed: (() {
            gotonextscreen(context, const Class1studentview());
            
          }), child: const Text("Class 1")),
          const SizedBox(height: 15,),
          ElevatedButton(onPressed: (() {
            gotonextscreen(context, const Class2studentidview());
            
          }), child: const Text("Class 2")),
          const SizedBox(height: 15,),
          ElevatedButton(onPressed: (() {
            
             gotonextscreen(context, const Class3tudentview());
            
          }), child: const Text("Class 3")),
          const SizedBox(height: 15,),
          ElevatedButton(onPressed: (() {
            gotonextscreen(context, const Class4studentview());
            
          }), child: const Text("Class 4")),
          const SizedBox(height: 15,),
          ElevatedButton(onPressed: (() {
            gotonextscreen(context, const Class5Studentstudentview());
            
          }), child: const Text("Class 5")),
          const SizedBox(height: 15,),
          ElevatedButton(onPressed: (() {
            gotonextscreen(context, const Class6Studentview());
            
          }), child: const Text("Class 6")),
          const SizedBox(height: 15,),
          ElevatedButton(onPressed: (() {
            gotonextscreen(context, const Class7Studentview());
            
          }), child: const Text("Class 7")),
          const SizedBox(height: 15,),
          ElevatedButton(onPressed: (() {
            gotonextscreen(context, const Class8Studentview());
            
          }), child: const Text("Class 8")),
          const SizedBox(height: 15,),
          ElevatedButton(onPressed: (() {
              gotonextscreen(context, const Class9Studentview());
            
          }), child: const Text("Class 9")),
         const SizedBox(height: 15,),
          ElevatedButton(onPressed: (() {
            
            gotonextscreen(context, const Class10Studentview());
          }), child: const Text("Class 10")),
          const SizedBox(height: 15,),

        ],

      ),),
    );
  }
}