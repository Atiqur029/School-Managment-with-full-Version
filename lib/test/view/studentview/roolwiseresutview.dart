


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:schollapp/const/importent.dart';
import 'package:schollapp/reusable/textform.dart';

import 'package:schollapp/test/model/addtestmodel.dart';
import 'package:schollapp/test/model/marktest.dart';


class FinalResult extends StatefulWidget {

  
  const FinalResult({super.key});

  @override
  State<FinalResult> createState() => _FinalResultState();
}

class _FinalResultState extends State<FinalResult> {
   
  
  String sessionvalue="-3";
  final sessioncontrolar=TextEditingController();
  

 TextEditingController rollcontrolar=TextEditingController();
 MarktestModel model=MarktestModel();
 List classnames=[
  "Class_1",
  "Class_2",
  "Class_3",
  "Class_4",
  "Class_5",
  "Class_6",
  "Class_7",
  "Class_8",
  "Class_9",
  "Class_10",

 ];

  String  firstclass="Class_1";
  String?  storeclassname;
  String?rollnumber;
  String ?examoftest;
  
  


  @override
  Widget build(BuildContext context) {

    //String classname ="Class_1";
    //RxString roll="1".obs;
   
   

 
    //controlar.roll=roll;

   
     return Scaffold(
    
    backgroundColor: Colors.grey,
       body: ListView(
        
        shrinkWrap: true,
        
        children: [
          SizedBox(height: 10.h,),
          TextForm(
          controller: sessioncontrolar,
          hintText: "Session",
          onChanged: (v) {
            setState(() {
              sessionvalue=v;
            });
            
          },
        ),
        SizedBox(
          height: 10.h,
        ),
          SizedBox(
          height:500.h,
          //color: Colors.yellow,
           child: SingleChildScrollView(
             child: Column(
              
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h,),
                  Text("Exam Name",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
                  SizedBox(height: 5.h,),
                  Container(
                    padding: EdgeInsets.only(left: 10.w),
                    //height: 
                    //50.h,
                    color: Colors.deepOrange,
                    child: StreamBuilder(
                      stream: examname(),
                      
                      builder: ((context, snapshot) {
                      if(snapshot.hasError){
                        return const Center(
                          child: Text("No Data"),
                
                        );
                      }else if(snapshot.hasData){
                
                        List  exam=[];
                        String exams="";
                        for(int i=0;i<snapshot.data!.length;i++){
                          final examlist=snapshot.data![i];
                           exam.add(examlist.testname);
                          
                
                        }
                        return DropdownButtonFormField(
                          //value: exam,
                          
                          items: exam.map((e) => DropdownMenuItem(value: e,child: Text(e),)).toList(), onChanged: ((value) {
                            setState(() {
                              exams=value.toString();
                              examoftest=exams;
                            });
                            
                          }));
                        
                        // return ListView.builder(
                        //   itemCount: snapshot.data!.length,
                        //   itemBuilder: ((context, index) {
                        //     final model=snapshot.data![index];
                            
                          
                        //}));
                        
                      }
                      return const Center(child: CircularProgressIndicator(),);
                    }))),
                    SizedBox(height: 5.h,),
                     
                   Text("Class  Name",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
                   SizedBox(height: 5.h,),
                    
                
                  
                   
                     Container(
                      padding: EdgeInsets.only(left: 5.w),
                    height: 40.h,
                    color: Colors.green,
                    child: DropdownButtonFormField(
                      onChanged: (value) {
                        setState(() {
                          firstclass=value.toString();
                          storeclassname=firstclass;
                        });
                      },
                      value: firstclass,
                      items: classnames.map((element) => DropdownMenuItem(value: element,child: Text(element),)).toList(),
                    
                        //controlar.firstclass=value.toString()
                      //controlar.onhangeclass(controlar.classname.toString());
                      
                    ),
                     //child: Text(controlar.addclass(classname.obs)),
                
                   ),
                    //SizedBox(height: 20.h,),
                    SizedBox(height: 5.h,),
                     
                   Text("Roll input",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
                   SizedBox(height: 10.h,),
                   Container(
                    height: 50,
                    color: Colors.blue,
                     child: TextForm(
                      onChanged: (v) {
                       
                        setState(() {
                           if(v.isNotEmpty){
                            rollnumber=v;
                
                           }
                           else{
                            v="-3";
                            rollnumber=v;
                           }
                        
                          
                
                         
                
                          
                        });
                       
                        
                      },
                
                       
                     ),
                   ),
                   SizedBox(height: 20.h,),
                  
                  Container(
                    height:285.h,
                    color: Colors.red,
                    child: StreamBuilder(
                      stream: getModel(className: storeclassname??"Class", roll: rollnumber??"0", examname: examoftest??"mid",sesson: sessionvalue),
                      
                      builder: (context, snapshot) {
                      if(snapshot.hasError){
                        return  Center(
                          child: Text("No Data is ${snapshot.error}"),
                  
                        );
                      }else if(snapshot.hasData){
                        
                          
                     
                            return Column(
                              children: [
                              
                                Padding(
                                
                                  padding:  EdgeInsets.only(left:5.w,top: 10.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text("Student Name",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                                      //SizedBox(width:10.w,),
                                      Text("Roll",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                                      //SizedBox(width:5.w,),
                                      Text("Subject Name",style: TextStyle(fontSize: 8.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                                      //SizedBox(width:5.w,),
                                      Text("Mark",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                                      //SizedBox(width:5.w,),
                                      Text("Obtain Mark",style: TextStyle(fontSize: 8.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                                      //SizedBox(width:5.w,),
                                      Text("Status",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                                      //SizedBox(width:5.w,),
                                      Text("Grade",style: TextStyle(fontSize: 8.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                                      //SizedBox(width:5.w,),
                     
                                    ],
                     
                                  ),
                                ),
                                SizedBox(height: 5.h,),
                     
                                SizedBox(
                                  height: 220.h,
                                  
                                  child: ListView.builder(
                                    itemCount: snapshot.data!.length,
                                    itemBuilder: ((context, index) {
                     
                                      final model=snapshot.data![index];
                                      return Row(
                                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            color: Colors.deepPurple,
                                            height: 40.h,
                                            width: 80.h,
                                            child: Center(child: Text(model.studentname!,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: Colors.white),)),
                     
                                          ),
                                          
                                          SizedBox(width:5.w,),
                                          Text(model.rollno!,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                                          SizedBox(width:10.w,),
                                          Container(
                                            color: Colors.deepPurple,
                                            height: 40.h,
                                            width: 65.h,
                                            child: Center(child: Text(model.subjectname!,style: TextStyle(fontSize: 8.sp,fontWeight: FontWeight.bold,color: Colors.white),)),
                     
                                          ),
                                          //Text(model.subjectname!,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                                          SizedBox(width:9.w,),
                                          Text(model.totalmark!,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                                          SizedBox(width:30.w,),
                                          Text(model.obtainedmark!,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                                          SizedBox(width:30.w,),
                                          Text(model.status!,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                                          SizedBox(width:14.w,),
                                          Text(model.grade!,style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                                          //SizedBox(width:5.w,),
                     
                                        ],
                     
                                      );
                     
                                    
                                  })),
                                )
                                 
                     
                              ],
                            );
                           // return Text(model.grade!,style: TextStyle(fontSize: 20,color: Colors.white),);
                          
                        
                        
                      }
                      return const Center(child: CircularProgressIndicator(),);
                    },),
                  )
                   
                    
                
                  
                
                  
                
                ]),
           ),
                 ),

         

         Container(height: 50.h, color: Colors.green,child: StreamBuilder(
          stream: getModel(className: storeclassname??"class", roll: rollnumber??"0", examname: examoftest??"exam",sesson: sessionvalue),//firestore.collection("test").doc("rollwise").collection(examoftest??"exam").doc(examoftest??"exam").collection(storeclassname??"class").doc(storeclassname??"class").collection(rollnumber??"roll").snapshots(),
          
          builder: ((context, snapshot) {
            if(snapshot.hasError){
              return const Center(child: Text("No Data"),);
            }else if(snapshot.hasData){

              var list=[];
            
                
                for(int i=0; i<snapshot.data!.length;i++){
                   final listpoint=snapshot.data![i].point;
                   list.add(listpoint);

                }
                
                double sum=0;
                double result=0;
                String grade= "F";
                int i=0;
                 
                
                 for(int k=0;k<list.length;k++){
                  double sums=double.parse(list[k]);
                  sum=sum+sums ;
                  i=k;
                  

                  
                  }
                  if(list.length<=3){
                    result=0.0;
                    grade="F";
                    
                   
                  }else{
                    if(list.contains("0.00")){
                      result=0.0;
                      grade="F";
                    }
                    else{
                      result=sum/(i+1);
                    if( result>=5){

                      grade="A+";
                       }else if(result>=4 && result<5){
                        grade="A";
                       }else if(result>=3.5 && result<4){
                        grade="A-";
                       }
                       else if(result>=3.00 && result<3.5){
                        grade="B";
                       }else if(result>=2.00 && result<3.00){
                        grade="C";
                       }else if(result>=1 && result<2.00){
                        grade="F";
                       }
                    }
                    

                    }
        

                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      
                      children: [
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            
                            Text("GPA :${result.toString()}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Color.fromARGB(255, 54, 244, 244) ),),
                            Text("Grade :${grade.toString()}",style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:Color.fromARGB(255, 54, 244, 219) ),),
                          ],
                        ),
                      ],
                    ),
                  );

                  
                
                
              

             
               
              
                //double sumes=0;

        

                
              

               
               
              
              


            }
            return const  Center(child: CircularProgressIndicator(),);
            
          }),)),
       ]),
     );
      
    
  }

 

  Stream<List<MarktestModel>>getModel({ required String? className, required String?
   roll, required String?examname,required String sesson})=>firestore.collection("test").doc(sesson.isEmpty?"_1":sesson).collection(sesson.isEmpty?"_1":sesson).doc("rollwise").collection(examname??"mid").doc(examname??"mid").collection(className??"a").doc(className??"a").collection(roll??"-1").snapshots().map((event) => event.docs.map((e) => MarktestModel.fromMap(e)).toList());

   Stream <List<AddTestModel>>examname() =>firestore.collection("test").doc("tests").collection("examlist").snapshots().map((event) => event.docs.map((e) => AddTestModel.fromMap(e)).toList());

   
   

}