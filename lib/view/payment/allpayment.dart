










import 'package:flutter/material.dart';


import 'package:schollapp/fee/model/duemodel.dart';
import 'package:schollapp/fee/model/fees.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:schollapp/reusable/textform.dart';


import '../../const/importent.dart';



class Showallfeesview extends StatefulWidget {
  const Showallfeesview({super.key});

  @override
  State<Showallfeesview> createState() => _ShowallfeesState();
}

class _ShowallfeesState extends State<Showallfeesview> {
  TextEditingController rollcontrolar=TextEditingController();
  final sesionControlar=TextEditingController();
  String sessionvalue="2014";
 Fees addFess= Fees();
 Duemodel duemodel=Duemodel();

 String  ? studentsnamestudent;
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
  //String?  storeclassname;
  String?  rollnumber;

  //String? rollnumbers;

  @override
  Widget build(BuildContext context) {
    //print(storeclassname);
    return Scaffold(
      
      backgroundColor: Colors.red,
      appBar: AppBar(
        
        title:  const Text("Show Data of  Students",),centerTitle: true,

        




      ),
      body:ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 10.h,),

                TextForm(
                  controller: sesionControlar,
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
                const Text("Class Name",style: TextStyle(color:Color.fromARGB(255, 255, 255, 255),fontSize: 18,fontWeight: FontWeight.bold),),
                 SizedBox(height: 10.h,),
      
              Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10)

                ),
                
                
                child: DropdownButtonFormField(
                  
                 
                  
                  
                  value: firstclass,
                  
                  items: classnames.map((e){
                  return DropdownMenuItem(
                    value: e.toString(),
                    
                    child: Text(e.toString()));
                }).toList(), onChanged: ((value) {
                  

                  


                  setState(() {
                  
                  
                   
                    
                    //firstclass=value.toString();
                    firstclass=value.toString();
                   
                    
                  });
                  
                })),
              ),
              SizedBox(height: 10.h,),
               TextForm(
                    onChanged: (v) {
                     
                      setState(() {
                        // rollnumbers=v.toString();
                         if(v.isNotEmpty){
                          rollnumber=v;
                          //studentsnamestudent=v.toString();
              
                         }
                         else{
                          v="-3";
                          rollnumber=v;
                         }
                      
                        
              
                       
              
                        
                      });
                     
                      
                    },
              
                     
                   ),
                   SizedBox(height: 10.h,),
                 


          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Image",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("Name",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("FeesName",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("Fees",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("MonthYear",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("PaidDate",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: Colors.white),),
                  Text("Pay",style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: Colors.white),),



                ],
              ),
              SizedBox(height: 5.h,),
              SingleChildScrollView(
                
                child: SizedBox(
                  height: 300.h,
                  
                  child: StreamBuilder(
                    stream: getdata(className: firstclass, roll: rollnumber??"-1",session: sessionvalue),
                    
                    builder: ((context, snapshot) {
                      if(snapshot.hasError){
                        return const Center(child: Text("No Data"),);

                      }else if(snapshot.hasData){
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: ((context, index) {
                            final modellist=snapshot.data![index];
                            return SingleChildScrollView(
                              child: Row(
                                children: [
                                  Container(
                                    margin:EdgeInsets.only(bottom: 5.h) ,
                                  height: 20.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    //borderRadius: BorderRadius.c
                                    image: DecorationImage(image: NetworkImage(modellist.img??"https://gw.alicdn.com/tfs/TB1qraZvXP7gK0jSZFjXXc5aXXa-345-188.png",),fit: BoxFit.contain)
                                  ),
                                  //child: Image.network(img??"https://gw.alicdn.com/tfs/TB1qraZvXP7gK0jSZFjXXc5aXXa-345-188.png",fit: BoxFit.cover,),
                                ),
                                SizedBox(width: 20.w,),
                                SizedBox(
                                  height: 20.h,
                                  width: 60.w,
                                  child: Text(modellist.name??"name",style: TextStyle(color: Colors.white,fontSize: 8.sp),)),
                                
                                SizedBox(
                                  height: 20.h,
                                  width: 30.w,
                                  child: Text(modellist.feesname??"name",style: TextStyle(color: Colors.white,fontSize: 8.sp),textAlign: TextAlign.center)),
                                   SizedBox(width: 23.w,),
                                  SizedBox(
                                  height: 20.h,
                                  width: 30.w,
                                  child: Text(modellist.amount??"50",style: TextStyle(color: Colors.white,fontSize: 8.sp),textAlign: TextAlign.center)),
                                  SizedBox(width: 23.w,),
                                  SizedBox(
                                  height: 20.h,
                                  width: 30.w,
                                  child: Text(modellist.monthyear??"50",style: TextStyle(color: Colors.white,fontSize: 8.sp),textAlign: TextAlign.center)),
                                  SizedBox(width: 38.w,),
                                  SizedBox(
                                  height: 20.h,
                                  width: 30.w,
                                  child: Text(modellist.feedate??"50",style: TextStyle(color: Colors.white,fontSize: 8.sp),textAlign: TextAlign.center)),
                            
                                  SizedBox(width: 15.w,),
                                  SizedBox(
                                  height: 20.h,
                                  width: 30.w,
                                  child: Text(modellist.paid??"50",style: TextStyle(color: Colors.white,fontSize: 8.sp),textAlign: TextAlign.center))
                                  
                            
                                 
                                  
                                  
                            
                                ],
                              ),
                            );
                          
                        }));
                      }
                      
                      else{
                        return const Center(child: CircularProgressIndicator(),);
                      }
                    
                  }))),
              )
            ],
          ),
          Container(
            height:150.h,
            color: Colors.amberAccent,
        
            child: Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
              
              children: [

                 
                   Container(
                    height: 150.h,
                    width: 120.w,
                    color: Colors.lightGreen,
                     child: StreamBuilder(
                      stream: firestore.collection("fees").doc(sessionvalue.isEmpty?"_1":sessionvalue).collection(sessionvalue.isEmpty?"_1":sessionvalue).doc("duefees").collection(firstclass).doc(firstclass).collection(rollnumber??"-1").snapshots(),


                      
                      builder: (context, snapshot) {
                      if(snapshot.hasError){
                        return const Center(child: Text("No Data"),);

                      }else if(snapshot.hasData){
                        double sum=0;
                        //String studentsname="";
                        for(int i=0;i<snapshot.data!.docs.length;i++){
                          sum=sum+snapshot.data!.docs[i].data()["due"];
                          studentsnamestudent=snapshot.data!.docs[i].data()["name"];
                        

                        }
                          
                            //studentsnamestudent=studentsname;
                          
                          
                          
                        

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Total Due",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),),
                            Text("$sum",style: TextStyle(fontSize: 15.sp,fontWeight: FontWeight.bold),)
                          ],
                        );
                          
                          
                          

                        


                      }
                      return const Center(child: CircularProgressIndicator(),);
                      
                  },),
                   ),

                  const Text("Due  details",),
                  Expanded(



                    child: Container(
                      height: 150.h,
                      color: Colors.pink,
                      child: Column(
                        

                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,

                            children: const  [
                              Text("Month",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              Text("Due",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              Text("Due Name",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),


                            ],
                          ),
                          SizedBox(height: 10.h,),
                          SingleChildScrollView(

                            child: SizedBox(
                              height: 120.h,
                              child: StreamBuilder(stream: getdue(className: firstclass, roll: rollnumber??"-1",session: sessionvalue),
                               builder: (context, snapshot) {
                                if(snapshot.hasError){
                                  return Center(child: Text("Error is :${snapshot.hasError}"),);
                                }else if(snapshot.hasData){
                                   
                                   
                                   return ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.length,
                                    
                                    itemBuilder: ((context, index) {
                                      final data=snapshot.data![index];
                                      return Row(
                                        
                                       
                                        children: [

                                          
                                          SizedBox(
                                            height: 40.h,
                                            width: 47.w,
                                            child: Text(data.monthofdate??"No Data",style: const TextStyle(color: Color.fromARGB(255, 223, 218, 177)),)),
                                          SizedBox(width: 15.w,),
                                          SizedBox(
                                            height: 40.h,
                                            width: 50.w,
                                            child: Text(data.due.toString(),style: const TextStyle(color: Color.fromARGB(255, 88, 231, 231)),)),
                                          SizedBox(width: 10.w,),
                                          SizedBox(
                                            height: 40.h,
                                            width: 40.w,
                                            
                                            child: Text(data.feesname??"No Data",style: const TextStyle(color: Color.fromARGB(255, 88, 231, 231)),)),
                          
                          
                                        ],
                                      );
                                      
                                      
                                    
                                      
                                      
                                
                                  
                                        
                                  
                                  
                                    
                                              }));}
                                
                                
                                 
                               return const Center(
                                child: Center(child: CircularProgressIndicator(),),
                               );
                                      
                                        }
                                      
                                        
                                        ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )

                  
                      
            
            ],
      ),
    ),
    
    
    ]));
  
}
  Stream<List<Fees>> getdata({ required String? className, required String?
   roll,required String session})=>firestore.collection("fees").doc(session.isEmpty?"1":session).collection(session.isEmpty?"1":session).doc("feesdata").collection(className??"class").doc(className??"class").collection(roll??"a").snapshots().map((event) => event.docs.map((e) => Fees.fromMap(e)).toList());
   Stream<List<Duemodel>> getdue({ required String? className, required String?
   roll,required String session})=>firestore.collection("fees").doc(session.isEmpty?"1":session).collection(session.isEmpty?"1":session).doc("duefees").collection(className??"class").doc(className??"class").collection(roll??"a").snapshots().map((event) => event.docs.map((e) => Duemodel.fromMap(e)).toList());
}

