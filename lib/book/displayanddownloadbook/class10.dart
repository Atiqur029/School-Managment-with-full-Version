


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schollapp/book/bookdatbase.dart';




class TenClassBook extends StatefulWidget {
   const TenClassBook({super.key});
   
  @override
  State<TenClassBook> createState() => _TenClassBookState();
}

class _TenClassBookState extends State<TenClassBook> {
  BookDatabase data=BookDatabase();
  Map<int,double>downloadprograss={};

  // bool downloding=false;
  // String progressString="";
  // String downloadimagepath="";

  // Future<bool>getStoragePermisson()async{
  //   return await Permission.storage.request().isGranted;
    
  // }

  // Future<String>getdownloadFolderPath() async{
  // return await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);

  // }

  // Future downloadfile(String downloadDirectory)async{
  //   Dio  dio=Dio();
  //   var path="$downloadimagepath/.pdf";
  //   try{
  //     await dio.download(urlPath, savePath)


  //   }catch(e){
  //     print("e");

  //   }
  // }

  @override
  void initState() {
  
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text("Class 10 Booklist"),centerTitle: true,),
    body: StreamBuilder(stream: data.getdisplay(name: "Class_10"),
    builder: (context, snapshot) {
      if(snapshot.hasError){
        return Center(child: Text(snapshot.error.toString()),);
      }else if(!snapshot.hasData){
        return const Center(child: CircularProgressIndicator(),);
      }else{
        return ListView.builder(
          itemCount: snapshot.data!.length,
          shrinkWrap: true,
          itemBuilder: ((context, index) {
            //getdownload(String url);
           
          final booklist=snapshot.data![index];
          return Container(
            height: 230,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              
              borderRadius: BorderRadius.circular(10),
              boxShadow:const [
                BoxShadow(
                  color: Colors.white10,
                  blurRadius: 0.2,
                  spreadRadius: 0.5
                ),
                
              ]

              
              

            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10,top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const SizedBox(height: 10,),
                      SizedBox(
                        height: 180,
                        width: 150,
                        //color: Colors.amberAccent,
                        child: Text("Book url:${booklist.file!}",style: const TextStyle(fontSize: 15,color: Colors.red),)),
                        const SizedBox(height: 10,),
                        Text(" Book Name:${booklist.bookname!}",style: const TextStyle(fontSize: 15,color: Colors.brown,fontWeight: FontWeight.bold),)
                    ],
                  ),
                  

                  Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 40,),
                        Text("Class Name is:${booklist.classname}",style: const TextStyle(color: Colors.blue,fontSize: 15,fontWeight: FontWeight.bold),),
                        const SizedBox(height: 10,),
                        Text("Class Name is:${booklist.num}",style: const TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(

                      children: [
                        Card(
                          color: Colors.amber,
                          child: SizedBox(
                            height: 50,
                            child: Center(
                              child: IconButton(onPressed: ()async {
                                final url=snapshot.data![index].file;
                                 
                                 var filename=".pdf";
                                

                                
                               
                                // const  filename=;
                                 try{
                                    Dio().download(url!, getDownloadpath(filename),onReceiveProgress: (count, total) {
                                   double progresss=count/total;
                                   setState(() {
                                      downloadprograss[index]=progresss;
                                    });
                                    Get.snackbar("Downloaded","Start $progresss");
                                  
                                 },);
                                

                                 }catch(e){
                                  Get.snackbar("Download", "Error $e");

                                 }
                               
                                

                                
                              },icon: const Icon(Icons.download,)),
                            ),
                          ),
                        ),

                      ],
                    ),
                  )

                ],
              ),
            ),
            
          

            
          
          
    );}));
      }
    

      
    },

    
    ),);
    
  }

//  getdownloaded(String url){


//  }


 getDownloadpath( String filename) async{
   //ref=firestore.collection("book").doc("books").collection("Class_10");



  
// }

// Future<File?>getDownlod(String url,String name)async{
//   try{
//     final appStore=await getApplicationDocumentsDirectory();
//   final file=File("${appStore.path}/$name");

//   final response=Dio().download(url,file,onReceiveProgress: (count, total) {

//     double progres=count/total;
    
//   },);
//   // final respons=await Dio().get(url.toString(),options: Options(responseType: ResponseType.bytes,followRedirects: false,receiveTimeout: 0));
//   // final ref=file.openSync(mode: FileMode.write);
//   // ref.writeByteSync(respons.data);
//   // await ref.close();
//   // return file;

//   }catch(e){
//     print ("error $e");
//   }
//   return null;

  
// }

// getdoenloadpath(int index,CollectionReference ref)async{
//   final url= ref.firestore.collection("book").doc("books").collection("Class_10");
//     final tempdir=await getTemporaryDirectory();
//     final path="${tempdir.path}/${ref.name}";
//     await Dio().download(url, path,onReceiveProgress: ((count, total) {
//       double progress=count/total;
//       setState(() {
//         downloadprograss[index]=progress;
//       });
//     }));

}

}

  

  

