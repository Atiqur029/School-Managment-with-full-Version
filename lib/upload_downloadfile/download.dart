



import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

import 'package:schollapp/const/importent.dart';

class Download extends StatefulWidget {
  const Download({super.key});

  @override
  State<Download> createState() => _DownloadState();
}

class _DownloadState extends State<Download> {
  late  Future<ListResult> futurelist;

  Map<int,double> downloadprograss={};
  @override
  void initState() {
    futurelist=storage.ref("files/").listAll();
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Download file"),),body:
    
     FutureBuilder(
      future: futurelist,
      builder: (context, snapshot) {
       if(snapshot.hasData){
        final files=snapshot.data!.items;
       return ListView.builder(
        itemCount: files.length,
        itemBuilder:((context, index){
          final file=files[index];
          double ?progrss=downloadprograss[index];
          return ListTile(title: Text(file.name),
          trailing: IconButton(onPressed: () {
            downloadfile(index, file);
            
          },icon: const Icon(Icons.download),),subtitle: progrss!=null?LinearProgressIndicator(value: progrss,backgroundColor: Colors.black,):null,);

        }
         )
         
         );

       }else if(snapshot.hasError){
        return const Text("Error Occure");
       }else{
        return const Center(child: CircularProgressIndicator(),);

       }
     },));
     
  }
  
   downloadfile (int index,Reference ref) async {
    final url=await ref.getDownloadURL();
    final tempdir=await getTemporaryDirectory();
    final path="${tempdir.path}/${ref.name}";
    await Dio().download(url, path,onReceiveProgress: ((count, total) {
      double progress=count/total;
      setState(() {
        downloadprograss[index]=progress;
      });
    }));
    //final dir=await getApplicationDocumentsDirectory();
    //final file= File("${dir.path}/${ref.name}");
    //await ref.writeToFile(file);

    if(url.contains(".mp4")){
      await GallerySaver.saveVideo(path,toDcim: true) ;
    }else if(url.contains(".jpg")||url.contains(".png")){
      await GallerySaver.saveImage(path,toDcim: true);
    }

    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Download ${ref.name}")));


   }
}