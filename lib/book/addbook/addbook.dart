// import 'dart:io';


// import 'package:file_picker/file_picker.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:schollapp/book/bookdatbase.dart';
// import 'package:schollapp/book/model.dart';

// import 'package:schollapp/reusable/textform.dart';



// class AddBook extends StatefulWidget {
//   const AddBook({super.key});

//   @override
//   State<AddBook> createState() => _AddBookState();
// }

// class _AddBookState extends State<AddBook> {

//   BookModel model=BookModel();

//   String? url;
//   int num=0;

//   File? pdffile;

//   FilePickerResult? result;
//   File?showtodisplay;
//   bool?isLoad=true;
//   String?filename;
//   PlatformFile ?pickfiled;

//   final _formkey=GlobalKey<FormState>();
//   final _nameContolar=TextEditingController();
//   final _numberControlar=TextEditingController();

//   uploadfile() async{
    
//     try{
//       setState(() {
//         isLoad=true;
//       });
//       result=await FilePicker.platform.pickFiles(type: FileType.any,allowMultiple: false);
//       if(result!=null){
//         filename=result!.files.first.name;
//         pickfiled=result!.files.single;
//         showtodisplay=File(pickfiled!.path.toString());

//       }



//       setState(() {
//         isLoad=false;
//       });
      
  
    
    

    


//     }catch(e){
//       Get.snackbar("Pdf File", "Error $e");


//     }
//     //num=Random().nextInt(2500);
    
    
//     //var file=pick.readAsBytesSync();
//     //String name=DateTime.now().microsecondsSinceEpoch.toString();
//     //uploadpdf
//     // var pdffile=storage.ref().child(name).child("/.pdf");
//     // UploadTask uploadTask=pdffile.putData(file);
//     // TaskSnapshot snapshot=await uploadTask;

//     // url=await snapshot.ref.getDownloadURL();

//     // await firestore.collection("file").doc().set({
//     //   "fileurl":url,
//     //   "filenumer":"Book$num",



      
    


    
    

//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Add Book"),centerTitle: true,),
//       body:  Form(
//         key: _formkey,
//         child: Padding(padding: const EdgeInsets.all(10),child: ListView(shrinkWrap: true,
//         children: [
//           const SizedBox(height: 50,),
//           DropdownButtonFormField(
//             focusColor: Colors.red[40],
            
            
//             validator: (value) {
//               if(value!.isEmpty){
//                 return "Name  is not empty";
//               }
//               return null;
//             },
//             borderRadius: BorderRadius.circular(20),
//             decoration: InputDecoration(hintText: "Class Name",border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
            

            
//             items: const [
//                   DropdownMenuItem(value: "Class_1",child: Text("Class_1")),
//                   DropdownMenuItem(value: "Class_2",child: Text("Class_2")),
//                   DropdownMenuItem(value: "Class_3",child: Text("class_3")),
//                   DropdownMenuItem(value: "Class_4",child: Text("Class_4")),
//                   DropdownMenuItem(value: "Class_5",child: Text("Class_5")),
//                   DropdownMenuItem(value: "Class_6",child: Text("Class_6")),
//                   DropdownMenuItem(value: "Class_7",child: Text("class_7")),
//                   DropdownMenuItem(value: "Class_8",child: Text("Class_8")),
//                   DropdownMenuItem(value: "Class_9",child: Text("Class_9")),
//                   DropdownMenuItem(value: "Class_10",child:Text("Class_10")),
//             ], onChanged: ((value) {
//               model.setclassname(value!);

              
              
//             })),
//             const SizedBox(height: 15,),

//           TextForm(
//             hintText: "Book Name",
//             controller: _nameContolar,
//             validator: (v){
//               if(v!.isEmpty || v.length<5){
//                 return "Please value name here";
//               }
//               return null;
//             },
//             onSaved: ((v) {
//               model.bookname=v;
              
//             }),

//           ),
//           const SizedBox(height: 15,),
//            TextForm(
//             hintText:"Number",
//             controller: _numberControlar,
//             keyboardType: TextInputType.number,
//             validator: (v){
//               if(v!.isEmpty || v.length<2){
//                 return "Please number  here";
//               }
//               return null;
//             },
//             onSaved: (v) {
//               model.num=v;
              
//             },

//           ),
//          const  SizedBox(height: 15,),
        
//          SizedBox(
//           height: 200,
          
//           //color: Colors.amber,
//           child: pickfiled!=null? SfPdfViewer.file(showtodisplay!):Container(height: 50,decoration: const BoxDecoration(
//             image: DecorationImage(image:AssetImage("asset/img/pdf.png"),fit: BoxFit.cover )

//           ),),
          
//          ),
         
//         IconButton(onPressed: (() {
//            uploadfile();
           
//          }),icon: const Icon(Icons.book,color: Colors.red,)), 
//          const SizedBox(height: 15,),
         
//          ElevatedButton(onPressed: (() {
//           if(_formkey.currentState!.validate()){
//             _formkey.currentState!.save();
//             BookDatabase data=BookDatabase();

//             // Reference reference=storage.ref().child("pdfpath/${DateTime.now().microsecondsSinceEpoch}").child("/.pdf");

//             // UploadTask uploadTask=reference.putFile(File(pdffile!.path));
//             // uploadTask.then((res) => res.ref.getDownloadURL().then((value){

//             //   model.img=value;
//             //   data.addBook(model);

//             //   Get.snackbar("Save", "Sucessfully");
//             // }));


            
//             data.uploadbook(file: showtodisplay,filePath: "pdfpath",onSuccess: (url) {
//               model.file=url!;
//               data.addBook(model);
//               Get.snackbar("Save","Sucessfully");
//               _formkey.currentState!.reset();
//               Get.back();

              
//             },);

//           }
           
//          }), child: const Text("Save"))

         

         


          
//         ],),),

        
//       ),
//     );
//   }

//   Map<int,double> downloadprogress={};

//  download() async{
  

//  }

 
// }