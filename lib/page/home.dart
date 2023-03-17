





import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:schollapp/appcolor/appcolor.dart';
import 'package:schollapp/attendence/markattendence/addatendence.dart';
import 'package:schollapp/attendence/view/attendenceview.dart';


import 'package:schollapp/book/booklist_classwise.dart';
import 'package:schollapp/class/classname.dart';
import 'package:schollapp/clock/model/timemodel.dart';


import 'package:schollapp/drawer/drawer.dart';
import 'package:schollapp/drawer/notice/addnotice.dart';
import 'package:schollapp/fee/view/addfee.dart';
import 'package:schollapp/fee/view/showfee.dart';
import 'package:schollapp/graph/view/barchartview.dart';
import 'package:schollapp/nextscrenn/nextscreen.dart';
import 'package:schollapp/notice/controlar/databasehelper.dart';
import 'package:schollapp/notice/controlar/noticelist.dart';
import 'package:schollapp/page/timer/firsttime.dart';

import 'package:schollapp/reusable/textform.dart';
import 'package:schollapp/screen/student/student.dart';
import 'package:schollapp/tableclass/routine.dart';
import 'package:schollapp/tableclass/view/classview.dart';
import 'package:schollapp/test/view/page/examname.dart';
import 'package:schollapp/test/view/studentview/finalresult.dart';
import 'package:timer_builder/timer_builder.dart';

import '../attendence/view/historymonth.dart';
import '../attendence/view/roolwisehistory.dart';
import '../clock/view/addjustime.dart';
import '../notice/model/view/adddata.dart';
import '../offlinedatabase/controlar/databasecontrolar.dart';
import '../splashscreen/splashscreen.dart';
import '../test/view/addmarktest.dart';
import '../test/view/studentview/classwisesubjectlist.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view/reusablecontent/reusabletimezone.dart';


class Homepage extends StatefulWidget {
    const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final noticeControlar=Get.put(NoticeControlar());

  final noticelistControlar=Get.put(NoticeList());

  final helper =DatabaseHelper();

  // @override
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Homepage"),centerTitle: true,
      
      ),
      body:ListView(
        shrinkWrap: true,
        children:  [
         

          const  SizedBox(height: 10,),
          Text("Notice For local Database",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color: Colors.blue),),
          Obx(() {
            return SizedBox(height: 60.h,
           child: noticeControlar.isLoad.value==true?const Center(child: CircularProgressIndicator(),):
           
                    
                   ListView.builder(
                    shrinkWrap: true,
                    itemCount:noticeControlar.allNotice.length ,
                    
                    itemBuilder: ((context, index) {
                     
                        final listnotice=noticeControlar.allNotice[index];
                        
                     
                      
                  return  Row(
                 children: [
              Container(height: 50.h,
              width: 80.w,
              color: Colors.amber,
              child: Center(child: Text("Notice",style: TextStyle(color: Colors.red,fontSize: 15.sp,fontWeight: FontWeight.bold),)),
              ),
              Expanded(child: Container(height: 50.h,
              
              color: Colors.green,
              child: Center(child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 190.w,
                        height: 40.h,
                        child: Marquee(text: "***${listnotice.text}***",style: TextStyle(fontSize: 14.sp,color: Colors.white),)),
                        Expanded(
                          
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: () {
                                noticeControlar.delete(id: listnotice.id!);
                              
                              
                              },icon: (const Icon(Icons.delete,))),
                              IconButton(onPressed: () {
                                
                                
                                  
                                showDialog(context: context, builder: ((context) {

                                  String  edit="";
                                  
                                  return SimpleDialog(
                                    
                                    backgroundColor: Colors.grey,
                                    insetPadding: EdgeInsets.only(left: 10.w),
                                    children: [
                                      TextForm(maxline: 2,
                                      onChanged: ((v) {
                                        listnotice.text=v;
                                        
                                      }),
                                      controller: TextEditingController(text: listnotice.text),
                                      hintText: "Editing",),
                                      SizedBox(height: 10.h,),
                                      ElevatedButton(onPressed: (() {
                                        noticeControlar.updatedata(notice: listnotice);

                                        Get.snackbar("Edit", "Sucessfully Edit",snackPosition: SnackPosition.BOTTOM);
                                        Navigator.of(context).pop();
                                        
                                      }), child: const Text("Update"))
                                    ],

                                  );
                                  
                                }));
                              
                              
                              },icon:(const Icon(Icons.edit,))) 
                            ],
                          ),
                        )
                    ],
                  ),
                ],
              )),)),
              
              

            ],

          
           
                  );})));
          },),
          const  SizedBox(height: 10,),
          Text("Notice For Firebase Database",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color: Colors.blue),),
          const  SizedBox(height: 10,),
          Obx(() {
            return SizedBox(height: 60.h,
           child: noticelistControlar.isload.value==true?const Center(child: CircularProgressIndicator(),):
           
                    
                   ListView.builder(
                    shrinkWrap: true,
                    itemCount:noticelistControlar.noticelist.length ,
                    
                    itemBuilder: ((context, index) {
                     
                        final listnoticeofdata=noticelistControlar.noticelist[index];
                        
                     
                      
                  return  Row(
                 children: [
              Container(height: 50.h,
              width: 80.w,
              color: Colors.amber,
              child: Center(child: Text("Notice",style: TextStyle(color: Colors.red,fontSize: 15.sp,fontWeight: FontWeight.bold),)),
              ),
              Expanded(child: Container(height: 50.h,
              
              color: Colors.green,
              child: Center(child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 190.w,
                        height: 40.h,
                        child: Marquee(text: "***${listnoticeofdata.text}***",style: TextStyle(fontSize: 14.sp,color: Colors.white),)),
                        Expanded(
                          
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(onPressed: () {
                                noticelistControlar.delete(listnoticeofdata.id!);
                              
                              
                              },icon: (const Icon(Icons.delete,))),
                              IconButton(onPressed: () {
                                
                                
                                  
                                showDialog(context: context, builder: ((context) {

                                  
                                  
                                  return SimpleDialog(
                                    
                                    backgroundColor: Colors.grey,
                                    insetPadding: EdgeInsets.only(left: 10.w),
                                    children: [
                                      TextForm(maxline: 2,
                                      onChanged: ((v) {
                                        listnoticeofdata.text=v;
                                        
                                      }),
                                      controller: TextEditingController(text: listnoticeofdata.text),
                                      hintText: "Editing",),
                                      SizedBox(height: 10.h,),
                                      ElevatedButton(onPressed: (()async {
                                        noticelistControlar.updated(table: listnoticeofdata);

                                        Get.snackbar("Edit", "Sucessfully Edit",snackPosition: SnackPosition.BOTTOM);
                                        Navigator.of(context).pop();
                                        
                                      }), child: const Text("Update"))
                                    ],

                                  );
                                  
                                }));
                              
                              
                              },icon:(const Icon(Icons.edit,))) 
                            ],
                          ),
                        )
                    ],
                  ),
                ],
              )),)),
              
              

            ],

          
           
                  );})));
          },),

          SizedBox(
            height: 400.h,
            child: Column(
              children: [
                

                const TimeofDay(),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(" Time Zone",style: TextStyle(fontSize: 18.sp,fontWeight: FontWeight.w400),),
                      Divider(color: Colors.red,height: 5.h,),
                      

                  ],
                ),
              const  Expanded(child: ReusableTimeZone())
               
                //Center(child: AddjustTime(TimeModel(hour: 5,min: 15,sec: 30))),
              ],
            ) ,
          ),
          SizedBox(height: 10.h,),
          Center(child: Text("Class Wise 2023 Students  Chart",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,color: Colors.red),)),

          SizedBox(height: 10.h,),

          SizedBox(
            height: 250.h,
            child: const Barchartview(),
          ),
           

          

          



          
         const  Padding(
            padding:  EdgeInsets.all(10),
            child: Text("Students",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.cyan),),
          ),
          const SizedBox(height: 10,),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=>const Students()));
              
            },
            child: Container(
              height: 50,
              
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 75, 139, 56),
                borderRadius: BorderRadius.circular(10)),
                child: const Center(child:  Text("Students",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)),
          
            ),
          ),
           const SizedBox(height: 10,),
           const  Padding(
            padding:  EdgeInsets.all(10),
            child: Text("Classes",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.cyan),),
          ),
          const SizedBox(height: 10,),
          InkWell(
            onTap: () {
              gotonextscreen(context, const ClassName());
              
            },
            child: Container(
              height: 50,
              
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 75, 139, 56),
                borderRadius: BorderRadius.circular(10)),
                child:  const Center(child: Text("Classes",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)),
          
            ),
          ),

           const SizedBox(height: 10,),
          InkWell(
            onTap: () {
              gotonextscreen(context, const ClassView ());
              
            },
            child: Container(
              height: 50,
              
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 75, 139, 56),
                borderRadius: BorderRadius.circular(10)),
                child:  const Center(child: Text("Time Table",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)),
          
            ),
          ),
           const SizedBox(height: 10,),
          InkWell(
            onTap: () {
              gotonextscreen(context,  const Routineview(classname: "hellow",));
              
            },
            child: Container(
              height: 50,
              
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 75, 139, 56),
                borderRadius: BorderRadius.circular(10)),
                child:  const Center(child: Text("Routine",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)),
          
            ),
          ),
           const SizedBox(height: 10,),
           const  Padding(
            padding:  EdgeInsets.all(10),
            child: Text("Attendense",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.cyan),),
          ),
          const SizedBox(height: 10,),
          InkWell(
            onTap: () {
              gotonextscreen(context,  const AddAttendese(classname: "abc",));
              
            },
            child: Container(
              height: 50,
              
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 75, 139, 56),
                borderRadius: BorderRadius.circular(10)),
                child: const  Center(child: Text("Mark Attendence",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)),
          
            ),),
            const SizedBox(height: 10,),
          InkWell(
            onTap: () {
              gotonextscreen(context, const Attendenseview(classname: "abc",docname: "docs",));
              
            },
            child: Container(
              height: 50,
              
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 75, 139, 56),
                borderRadius: BorderRadius.circular(10)),
                child: const  Center(child: Text("View",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)),

          
            ),
          ),
          const SizedBox(height: 10,),
          InkWell(
            onTap: () {
              gotonextscreen(context,  const Rollwisehistorry(classname: 'class name',roolid: " History From class", docname: 'a',));
              
            },
            child: Container(
              height: 50,
              
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 75, 139, 56),
                borderRadius: BorderRadius.circular(10)),
                child: const Center(child: Text("Attendence History",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)),
                
          
            ),
          ),
          const SizedBox(height: 10,),
          
          InkWell(
            onTap: () {
              gotonextscreen(context, const HistoryMonth(classes: "Class_1",monthdoc:"January",) );
              
            },
            child: Container(
              height: 50,
              
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 75, 139, 56),
                borderRadius: BorderRadius.circular(10)),
                child:  const Center(child: Text("Number Of Present",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)),
                
          
            ),
          ),
          // const  Padding(
          //   padding:  EdgeInsets.all(10),
          //   child: Text("Book",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.cyan),),
          // ),

          // const SizedBox(height: 10,),
          // InkWell(
          //   onTap: () {

          //     gotonextscreen(context,  const BookList());
              
          //   },
          //   child: Container(
          //     height: 50,
              
          //     decoration: BoxDecoration(
          //       color: const Color.fromARGB(255, 75, 139, 56),
          //       borderRadius: BorderRadius.circular(10)),
          //       child:  const Center(child: Text("Class Book",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)),
                
          
          //   ),

            
          // ),
          //  const SizedBox(height: 10,),
          // InkWell(
          //   onTap: () {
              
          //   },
          //   child: Container(
          //     height: 50,
              
          //     decoration: BoxDecoration(
          //       color: const Color.fromARGB(255, 75, 139, 56),
          //       borderRadius: BorderRadius.circular(10)),
          //       child:  const Center(child: Text("Other Books",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)),
                
          
          //   ),

            
          // ),
          const  Padding(
            padding:  EdgeInsets.all(10),
            child: Text("Tests",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.cyan),),
          ),
          const SizedBox(height: 10,),
          InkWell(
            onTap: () {

              gotonextscreen(context,   const Test());
              
            },
            child: Container(
              height: 50,
              
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 75, 139, 56),
                borderRadius: BorderRadius.circular(10)),
                child:  const Center(child: Text("Add Test",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)),
                
          
            ),),
             const SizedBox(height: 10,),
          InkWell(
            onTap: () {
              gotonextscreen(context, const MarkTest ());

          
              
            },
            child: Container(
              height: 50,
              
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 75, 139, 56),
                borderRadius: BorderRadius.circular(10)),
                child:  const Center(child: Text("Mark Test",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)),
                
          
            ),),
             const SizedBox(height: 10,),
          InkWell(
            onTap: () {
              gotonextscreen(context, const ClassWiseSubject());

             
              
            },
            child: Container(
              height: 50,
              
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 75, 139, 56),
                borderRadius: BorderRadius.circular(10)),
                child:  const Center(child: Text("Mark Test in subjectwise",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)),
                
          
            ),),
             const SizedBox(height: 10,),
          InkWell(
            onTap: () {
              gotonextscreen(context,  const FinalResultAllClass());

           
              
            },
            child: Container(
              height: 50,
              
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 75, 139, 56),
                borderRadius: BorderRadius.circular(10)),
                child:  const Center(child: Text("Result",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)),
                
          
            ),),

            const SizedBox(height: 10,),
           
            const  Padding(
            padding:  EdgeInsets.all(10),
            child: Text("Fees",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.cyan),),
          ),
           const SizedBox(height: 10,),
          InkWell(
            onTap: () {
              gotonextscreen(context,  const AddFess());

           
              
            },
            child: Container(
              height: 50,
              
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 75, 139, 56),
                borderRadius: BorderRadius.circular(10)),
                child:  const Center(child: Text("Add Fees",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)),
                
          
            ),),

            const SizedBox(height: 10,),
            InkWell(
            onTap: () {
              gotonextscreen(context,  const Showallfees());

           
              
            },
            child: Container(
              height: 50,
              
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 75, 139, 56),
                borderRadius: BorderRadius.circular(10)),
                child:  const Center(child: Text("Show AllFee ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)),
                
          
            ),),
            const SizedBox(height: 10,),
           
            const  Padding(
            padding:  EdgeInsets.all(10),
            child: Text("Notice",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.cyan),),
          ),
          InkWell(
            onTap: () {
              gotonextscreen(context,  const AddNoticelist());

           
              
            },
            child: Container(
              height: 50,
              
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 75, 139, 56),
                borderRadius: BorderRadius.circular(10)),
                child:  const Center(child: Text("Add Notice ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.white),)),
                
          
            ),),

            



        ],

  
        ),
        
      

      drawer:const Drawersomething(),
      
    );
    
  }

      
}