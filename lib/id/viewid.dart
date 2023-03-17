import 'package:flutter/material.dart';

import 'package:schollapp/id/studentclassnameid/class1.dart';
import 'package:schollapp/id/studentclassnameid/class10.dart';
import 'package:schollapp/id/studentclassnameid/class2.dart';
import 'package:schollapp/id/studentclassnameid/class3.dart';
import 'package:schollapp/id/studentclassnameid/class4.dart';
import 'package:schollapp/id/studentclassnameid/class5.dart';
import 'package:schollapp/id/studentclassnameid/class6.dart';
import 'package:schollapp/id/studentclassnameid/class7.dart';
import 'package:schollapp/id/studentclassnameid/class8.dart';
import 'package:schollapp/id/studentclassnameid/class9.dart';
import 'package:schollapp/nextscrenn/nextscreen.dart';

class Viewid extends StatefulWidget {
  const Viewid({super.key});

  @override
  State<Viewid> createState() => _ViewidState();
}

class _ViewidState extends State<Viewid> {
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
            gotonextscreen(context, const Idcartdata());
            
          }), child: const Text("Class 1")),
          const SizedBox(height: 15,),
          ElevatedButton(onPressed: (() {
            gotonextscreen(context, const Class2studentid());
            
          }), child: const Text("Class 2")),
          const SizedBox(height: 15,),
          ElevatedButton(onPressed: (() {
            
             gotonextscreen(context, const Class3tudent());
            
          }), child: const Text("Class 3")),
          const SizedBox(height: 15,),
          ElevatedButton(onPressed: (() {
            gotonextscreen(context, const Class4());
            
          }), child: const Text("Class 4")),
          const SizedBox(height: 15,),
          ElevatedButton(onPressed: (() {
            gotonextscreen(context, const Class5Student());
            
          }), child: const Text("Class 5")),
          const SizedBox(height: 15,),
          ElevatedButton(onPressed: (() {
            gotonextscreen(context, const Class6Student());
            
          }), child: const Text("Class 6")),
          const SizedBox(height: 15,),
          ElevatedButton(onPressed: (() {
            gotonextscreen(context, const Class7Student());
            
          }), child: const Text("Class 7")),
          const SizedBox(height: 15,),
          ElevatedButton(onPressed: (() {
            gotonextscreen(context, const Class8Student());
            
          }), child: const Text("Class 8")),
          const SizedBox(height: 15,),
          ElevatedButton(onPressed: (() {
              gotonextscreen(context, const Class9Student());
            
          }), child: const Text("Class 9")),
         const SizedBox(height: 15,),
          ElevatedButton(onPressed: (() {
            
            gotonextscreen(context, const Class10Student());
          }), child: const Text("Class 10")),
          const SizedBox(height: 15,),

        ],

      ),),
    );
  }
}