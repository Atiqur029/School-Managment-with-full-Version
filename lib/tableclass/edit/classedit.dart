import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:schollapp/tableclass/database/classdatabase.dart';
import 'package:schollapp/tableclass/database/classmodel.dart';

import '../../reusable/textform.dart';

class ClassEdit extends StatefulWidget {
  final TableClass tableCell;
  const ClassEdit({super.key, required this.tableCell});

  @override
  State<ClassEdit> createState() => _ClassEditState();
}

class _ClassEditState extends State<ClassEdit> {


  TextEditingController?nameControlar;
  ClassDatabase database=ClassDatabase();


  @override
  void initState() {
    nameControlar=TextEditingController(text: widget.tableCell.classname);
  
    super.initState();
  }


  @override
  void dispose() {
    nameControlar!.dispose();
    
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text("Editing Section and class"),),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(

            height: 320,
            
            child: ListView(
              children: [
                 TextForm(labelText: "Class Name",controller: nameControlar,),
                 const SizedBox(height: 10,),
                 
                 const SizedBox(height: 10,),
                 ElevatedButton(onPressed:(() {
                  final name=nameControlar!.text;
                  //final section=sectonControlar!.text;

                  final sectionandid=TableClass(
                    id: widget.tableCell.id,
                    classname: name,
                    //section: section,
                  );
                  try{
                    database.updateclassandsection(sectionandid);
                    Navigator.of(context).pop();
                    Get.snackbar("Update","Update Sucessfully",snackPosition: SnackPosition.BOTTOM);
                    

                  }catch(e){
                    print("Error is :$e");
                    Get.snackbar("Faild","faild Occured",snackPosition: SnackPosition.BOTTOM);
                    Navigator.of(context).pop();


                  }
                  
                  

                   
                 }) , child: const Text("Editing"))
                 

              ],
            ),
          ),
        ),
      ),
    );
  }
}