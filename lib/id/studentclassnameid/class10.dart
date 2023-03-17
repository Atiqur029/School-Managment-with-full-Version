import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schollapp/const/importent.dart';
import 'package:schollapp/id/edit/edit.dart';
import 'package:schollapp/model/studentmodel.dart';
import 'package:schollapp/nextscrenn/nextscreen.dart';

import '../../reusable/textform.dart';
import '../../service/studentdatabase.dart';

class Class10Student extends StatefulWidget {
  const Class10Student({super.key});

  @override
  State<Class10Student> createState() => _Class10StudentState();
}

class _Class10StudentState extends State<Class10Student> {

  TextEditingController sesonControlar =TextEditingController();

  //CollectionReference reference=firestore.collection("student").doc("students").collection("class_1");

  List docs=[];

  String seesonseselect="12";
  
 

 @override
  void initState() {

   
     
    
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey,
      
      appBar: AppBar(title: const Text("Class 1 Session and id"),),
    body: ListView(
      
      shrinkWrap: true,
      children: [
        SizedBox(
          height: 10.h,
        ),
        TextForm(
          controller: sesonControlar,
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
          
          child: StreamBuilder(
            stream: readuser(seesonseselect ),
            
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
        ),
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
            color: Colors.yellow,
            blurRadius: 0.5,
            offset: Offset(3,5)

          ),
          BoxShadow(
            color: Colors.green,
            blurRadius: 1.5,
            offset: Offset(2,3)

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
                 Text(" Session: ${studentsModel.sesson}",style: const TextStyle(color:Colors.white,fontSize: 15),),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
            
              children: [
                const SizedBox(height: 10,),
                SizedBox(
                  height: 20.h,
                  width: 150.w,
                  
                  child: Text(" Name:${studentsModel.name!}",style: const TextStyle(color:Colors.amber,fontSize: 13,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),)),
                 SizedBox(
                  height: 20.h,
                  width: 190.w,
                  
                  child: Text(" Father Name :${studentsModel.fathername!}",style: const TextStyle(color:Colors.deepOrange,fontSize: 13,fontWeight: FontWeight.bold,overflow: TextOverflow.ellipsis),)),
                Text("Address:${studentsModel.address}",style:const TextStyle(color: Colors.greenAccent,fontSize: 13,overflow: TextOverflow.ellipsis) ,),
                Text("Mobile Number:${studentsModel.mobilenumber}",style: const TextStyle(color: Colors.deepPurple,fontSize: 13,overflow: TextOverflow.ellipsis),),


              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: (() {
                  gotonextscreen(context,  Update(classname: "Class_10",model:StudentsModel(classname: studentsModel.classname,name: studentsModel.name,rollnumber: studentsModel.rollnumber,brthdate: studentsModel.brthdate,fathername: studentsModel.fathername,gidnumber: studentsModel.gidnumber,admissondate: studentsModel.admissondate,address: studentsModel.address,mobilenumber: studentsModel.mobilenumber,id: studentsModel.id,img: studentsModel.img,sesson: studentsModel.sesson),));
                  
                
                        
                       
                      
                      
                     
                           
                            
                             
                    
                  
                }), icon: const Icon(Icons.edit,color: Colors.red,)),

                const SizedBox(height: 20,),
                 IconButton(onPressed: (() async{
                  StudentDatabase database=StudentDatabase();
                  //StudentsModel model=StudentsModel();
                 
                  showDialog(context: context, builder: ((context) {

                    return AlertDialog(title: const Text("Are You Sure Delete Document"),
                    actions: [
                      ElevatedButton(onPressed: (() {
                          Navigator.pop(context);
                        }), child: const Text("No")),

                         ElevatedButton(onPressed: (() {
                          database.delete(classname: "Class_1", model: studentsModel);
                          Navigator.pop(context);
                        }), child: const Text("Yes")),

                    ],
                    );
                    
                  }));
                  
                  
                }), icon: const Icon(Icons.delete,color: Colors.red,)),

              ],
            )
            
          ],
        ),
      
          
       
         
          
          

        ),
        
  );
    
  

  Stream<List<StudentsModel>> readuser( String? sesson){
    
      return  firestore.collection("student").doc(sesson!.isEmpty?"_1":sesson).collection(sesson.isEmpty?"_1":sesson).doc("students").collection("Class_10").snapshots()
  .map((snapshot) => snapshot.docs.map((doc) => StudentsModel.fromMap(doc.data())).toList());

    
      


    }
  }
