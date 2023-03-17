




import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schollapp/test/view/studentview/classwisesubjectlist.dart';
import 'package:schollapp/test/view/studentview/roolwiseresutview.dart';

import '../../../nextscrenn/nextscreen.dart';
import '../student/viewer.dart';

class FinalResultAllClassallviewer extends StatefulWidget {

  final String?name;
  const FinalResultAllClassallviewer({super.key,this.name});

  @override
  State<FinalResultAllClassallviewer> createState() => _FinalResultAllClassState();
}

class _FinalResultAllClassState extends State<FinalResultAllClassallviewer> {


  
  

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
     

        
        title: const Text("Final Result"),),
      backgroundColor: Colors.grey,
      
      body: SingleChildScrollView(
        
        child: ListView(
          shrinkWrap: true,
          
          children: [
            SizedBox(height: 720.h,child:  const FinalResult() ,),
            
        
          ],
        ),
      ),
    );
  }
}