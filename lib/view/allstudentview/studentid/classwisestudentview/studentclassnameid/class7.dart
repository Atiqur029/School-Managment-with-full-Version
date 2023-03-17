import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schollapp/const/importent.dart';

import 'package:schollapp/model/studentmodel.dart';

import '../../../../../reusable/textform.dart';




class Class7Studentview  extends StatefulWidget {
  const Class7Studentview ({super.key});

  @override
  State<Class7Studentview > createState() => _Class5StudentState();
}

class _Class5StudentState extends State<Class7Studentview > {

  TextEditingController sessioncontrolar =TextEditingController();


  
 String seesonseselect="12";

 @override
  void initState() {
    readuser(seesonseselect);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text("Class 7 Students Details"),),
    body: ListView(
      shrinkWrap: true,
      children: [
         SizedBox(
          height: 10.h,
        ),
        TextForm(
          controller: sessioncontrolar,
          hintText: "Session",
          onChanged: (v) {
            setState(() {
              seesonseselect=v;
            });
            
          },
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 500.h,
          child:StreamBuilder(
        stream: readuser(seesonseselect),
        
        builder: ((context, snapshot) {
          if(snapshot.hasError){
            
            return const Center(child: Text("Something Wrong"));
            
          }
          else if(snapshot.hasData){
            final students=snapshot.data;
            return ListView(
              shrinkWrap: true,
              
              
             
                  children:students!.map(builduser).toList(),);
                
    
    
                
            }
              
             
          
        else{
            return const Center(child :CircularProgressIndicator());
          }
         
          
        })),
        )


      ],
       
    ));
      
      
      
     
    
  }
  Widget builduser(StudentsModel studentsModel)=>Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 150.h,
      
      decoration: BoxDecoration(
        color: Colors.brown,
        boxShadow:const  [
          BoxShadow(
            color: Colors.blue,
            blurRadius: 5,
            offset: Offset(3,5),
            spreadRadius: 2,

          ),
          BoxShadow(
            color: Colors.deepPurple,
            blurRadius: 5,
            offset: Offset(1,3),
            spreadRadius: 5,

          )
        ],
        borderRadius: BorderRadius.circular(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Image.network(studentsModel.img!,height: 80,width: 120,),
                ),
                Text(" Roll: ${studentsModel.rollnumber!}",style: const TextStyle(color:Colors.white,fontSize: 15),),
                Text("  ${studentsModel.classname!}",style: const TextStyle(color:Color.fromARGB(255, 86, 244, 54),fontSize: 15),),
                Text(" Session: ${studentsModel.sesson}",style: const TextStyle(color:Color.fromARGB(255, 197, 176, 176),fontSize: 14),),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
            
              children: [
                const SizedBox(height: 10,),
                SizedBox(
                  height: 20.h,
                  width: 200.w,
                  
                  child: Text(" Name:${studentsModel.name!}",style: const TextStyle(color:Colors.indigoAccent,fontSize: 20,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),)),
                 SizedBox(
                  height: 20.h,
                  width: 220.w,
                  
                  child: Text(" Father Name :${studentsModel.fathername!}",style: const TextStyle(color:Colors.amber,fontSize: 18,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),)),
                Text("Address:${studentsModel.address}",style:const TextStyle(color: Color.fromARGB(255, 146, 202, 216),fontSize: 17,overflow: TextOverflow.ellipsis) ,),
                Text("Mobile Number:${studentsModel.mobilenumber}",style: const TextStyle(color: Colors.white,fontSize: 15,overflow: TextOverflow.ellipsis),),


              ],
            ),
            
            
          ],
        ),
      
          
       
         
          
          
      
        ),
         
       
  );
    
  
  Stream<List<StudentsModel>> readuser( String? sesson){
    
      return  firestore.collection("student").doc(sesson!.isEmpty?"_1":sesson).collection(sesson.isEmpty?"_1":sesson).doc("students").collection("Class_7").snapshots()
  .map((snapshot) => snapshot.docs.map((doc) => StudentsModel.fromMap(doc.data())).toList());
    
      


    }
  }
