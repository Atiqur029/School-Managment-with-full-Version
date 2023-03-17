// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:schollapp/class/classandsectionmodel.dart';
import 'package:schollapp/class/classdatabase.dart';
import 'package:schollapp/reusable/textform.dart';

class EditingClassandSection extends StatefulWidget {
  final SectionandClassModel model;
  const EditingClassandSection({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  State<EditingClassandSection> createState() => _EditingClassandSectionState();
}

class _EditingClassandSectionState extends State<EditingClassandSection> {

  TextEditingController ?classnameControlar;
  TextEditingController ? sectonControlar;
  ClassDatabase database=ClassDatabase();




  @override
  void initState() {
     
     classnameControlar=TextEditingController(text: widget.model.classes!);
     sectonControlar=TextEditingController(text:widget.model.section! );

    
    super.initState();
  }

  @override
  void dispose() {
    classnameControlar!.dispose();
    sectonControlar!.dispose();
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

            height: 400,
            
            child: ListView(
              children: [
                 TextForm(labelText: "Class Name",controller: classnameControlar,),
                 const SizedBox(height: 10,),
                 TextForm(labelText: "Section Name",controller: sectonControlar,),
                 const SizedBox(height: 10,),
                 ElevatedButton(onPressed:(() {
                  final name=classnameControlar!.text;
                  final section=sectonControlar!.text;

                  final sectionandid=SectionandClassModel(
                    id: widget.model.id,
                    classes:name,
                    section: section,
                  );
                  try{
                    database.updateclassandsection(sectionandid);
                    Get.snackbar("Update","Update Sucessfully",snackPosition: SnackPosition.BOTTOM);
                    Navigator.of(context).pop();

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