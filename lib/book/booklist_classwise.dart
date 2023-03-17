// import 'package:dio/dio.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_speed_dial/flutter_speed_dial.dart';

// import 'package:get/get.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:schollapp/book/addbook/addbook.dart';
// import 'package:schollapp/const/importent.dart';

// import 'package:schollapp/nextscrenn/nextscreen.dart';


// class BookList extends StatefulWidget {
//   const BookList({super.key});

//   @override
//   State<BookList> createState() => _BookListState();
// }

// class _BookListState extends State<BookList> {
//   ValueNotifier<bool> isvalueopen=ValueNotifier(false);
//   late Future<ListResult> listresult;

//   Map<int,double> progress={};
//   @override
//   void initState() {
//     listresult=storage.ref("books/pdfpath/").listAll();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar(title: const Text("ClassWise Book"),centerTitle: true,),
//     body:  Padding(
//       padding: const EdgeInsets.all(15),
//       child: FutureBuilder(
//         future: listresult,
//         builder: ((context, snapshot) {
          
//           if(snapshot.hasError){
//             return  Center(child: Text("eror is ${snapshot.error}"),);
//           }else if(snapshot.hasData){
//               final files=snapshot.data!.items;
//               return  ListView.builder(
//               itemCount: snapshot.data!.items.length,
              
//               itemBuilder: ((context, index) {
//                 final file=files[index];
//                 double? downloadprogress=progress[index];
//                 return ListTile(
//                   leading:const Icon(Icons.file_copy_outlined,color: Colors.red,),
                  
//                   title:  Text("${file.name}.pdf"),
//                   subtitle: downloadprogress!=null?LinearProgressIndicator(value: downloadprogress,color: Colors.green,):null,
//                   trailing: IconButton(icon: const Icon(Icons.download),color: Colors.red,onPressed: () async{
//                     getdownlload(index, file);
//                     Get.snackbar("Download", "Downloaded Completed",snackPosition: SnackPosition.BOTTOM,duration: const Duration(seconds: 5));
      
                    
//                   },),
//                   // trailing: Column(
//                   //   children: [
//                   //     IconButton(onPressed: (() {
//                   //       getdownlload(index, file);
                        
//                   //     }), icon: const Icon(Icons.download,color: Colors.red,)),
//                   //     if(downloadprogress!=null)
//                   //     LinearProgressIndicator(value: downloadprogress,backgroundColor: Colors.green,)

                      

//                     //],
                  
//                 );
                
//               }));
            
//           }else{
//             return  const Center(child: CircularProgressIndicator(),);
            
//           }
//         })),


      
//     ),
//     floatingActionButton: SpeedDial(
//       backgroundColor: Colors.yellow,
//       activeBackgroundColor: Colors.green,
//       activeForegroundColor: Colors.redAccent,
//       openCloseDial: isvalueopen,
//       animatedIcon: AnimatedIcons.add_event,
//       spacing: 15,
//       children: [
//         SpeedDialChild(
//           onTap: (() {
//             gotonextscreen(context, const AddBook());
            
//           }),

//           label: "Add Book",
//           labelBackgroundColor: Colors.red,
//           backgroundColor: Colors.orange,
//           child:  const Icon(Icons.book,),
//           labelStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.white)
//         )
//       ],
      
      


//     ),
    
//     );

    
//   }

//   getdownlload(int index,Reference ref)async{
//     final url= await ref.getDownloadURL();
//     final timdir=await getApplicationDocumentsDirectory();
//     final path="${timdir.path}/${ref.name}";
//     await Dio().download(url, path,onReceiveProgress: (count, total) {
//       double?progresystem=count/total;
//       setState(() {
//         progress[index]=progresystem;
//       });

      
      
//     },);


    

    

//   }

  
// }