




import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:schollapp/test/view/studentview/roolwiseresutview.dart';

class FinalResultAllClass extends StatefulWidget {
  

  final String?name;
  const FinalResultAllClass({super.key,this.name});

  @override
  State<FinalResultAllClass> createState() => _FinalResultAllClassState();
}

class _FinalResultAllClassState extends State<FinalResultAllClass> {


  
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text("Final Result"),),
      backgroundColor: Colors.grey,
      
      body: SingleChildScrollView(
        
        child: ListView(
          
          shrinkWrap: true,
          
          children: [
            
            SizedBox(height: 750.h,child:  const FinalResult() ,),
            
        
          ],
        ),
      ),
    );
  }
}