

import 'dart:io';


import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:schollapp/const/importent.dart';


class UploadFile extends StatefulWidget {
  const UploadFile({super.key});

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
  PlatformFile?pickFiled;
  UploadTask?uploadTask;
  Future  selectfile() async{
    final result=await FilePicker.platform.pickFiles();
    if(result==null){
      return;
    }
    setState(() {
      pickFiled=result.files.first;
    });

   



  }
  Future uploadfile() async{
    final path="files/${pickFiled!.name}";
    final file=File(pickFiled!.path!);

    final ref=storage.ref().child(path);

    setState(() {
        uploadTask = ref.putFile(file);
      
    });
  
    final snapshot=await uploadTask!.whenComplete((){});

     await snapshot.ref.getDownloadURL();
     setState(() {
       uploadTask=null;
     });
   

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload File"),centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if(pickFiled!=null)
            Expanded(
              child: Container(
                //height: 300,
                color: Colors.blue[100],
                child: Image.file(File(pickFiled!.path!),width: double.infinity,fit: BoxFit.cover,),
              ),
            ),
            const SizedBox(height: 10,),
          
            ElevatedButton(onPressed: (()async {
              selectfile();
              
            }), child: const Text("Select File")),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: (() async{
              await uploadfile();
              
            }), child: const Text("Upload File")),

            const SizedBox(height: 10,),
            buildprogress()
          ],
        ),
      ),
    );
  }
  
  Widget buildprogress() {
    return StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      
      builder: ((context, snapshot) {
        
        if(snapshot.hasData){
          final data=snapshot.data;
          double progress=data!.bytesTransferred/data.totalBytes;
          return SizedBox(
          
          height: 50,
          child: Stack(
            fit: StackFit.expand,
            children: [
              LinearProgressIndicator(
                value: progress,
                backgroundColor: Colors.grey,
                color: Colors.green,

              ),
              Center(child: Text("${(100*progress).roundToDouble()}%",style: const TextStyle(color: Colors.white),))

          ]),
          );
        }else{
        return const SizedBox(height: 50,);}
        //   return SdBox(height: 50,child: Stack(
        //     fit: StackFit.expand,
        //     children: [
        //       LinearProgressIndicator(value: progress,backgroundColor: Colors.grey,color: Colors.green,
        //       ),
        //       Center(child:Text("${(100*progress).roundToDouble()}%"))
        //     ],

        //   ),);

        // }else{
        //   const SizedBox(height: 50,);
        // }return SizedBox();
        

      }));
  }
}