


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:schollapp/const/importent.dart';
import 'package:schollapp/test/model/marktest.dart';

import '../../../reusable/textform.dart';



class ClassWiseSubjectallviwer extends StatefulWidget {
  const ClassWiseSubjectallviwer({super.key});

  @override
  State<ClassWiseSubjectallviwer> createState() => _ClassWiseSubjectState();
}

class _ClassWiseSubjectState extends State<ClassWiseSubjectallviwer> {
 String?firstsubject="Bangla 1st Paper";
  String sessionvalue="3";
  final sessioncontrolar=TextEditingController();

  List<String> subjectname=[
    
  "Bangla 1st Paper",
  "Bangla 2nd Paper",
  "English 1st Paper",
  "English 2nd Paper",
  "Math"
  "Religion",
  "ICT",
  "Physics",
  "Chemistry",
  "Biology",
  "Higher Math",
  "Accounting",
  "Finance",
  "Business Entrepreneurship",
  "Agricultural Studies",
  "General Science",
  "Bangladesh and Global Studies"


  
  ];

  String? selectedclass;
  String?selectedsubject;

  String firstclass="Class_1";

  List classname=[

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
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.height;
    return Scaffold(
      
      appBar: AppBar(title: const Text("Subject Wise Result"),),
      body: ListView(shrinkWrap: true,
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
          Container(
            padding: const EdgeInsets.only(left: 15),
           decoration: BoxDecoration(
            
            color: Colors.purple,
            borderRadius: BorderRadius.circular(10)
           ),
            child: DropdownButtonFormField(
              dropdownColor: Colors.purple,
              focusColor: Colors.red,
              iconEnabledColor: Colors.white,
              iconDisabledColor: Colors.black,
              
              style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
              value: firstclass,
              
              items: classname.map((e) => DropdownMenuItem(child: Text(e),value: e,)).toList(),
              onChanged: (value) {
                setState(() {
                  firstclass=value.toString();
                  selectedclass=firstclass;

                });
              },

            ),
          ),
          const SizedBox(height: 10,),
          
          Container(
           
             padding: const EdgeInsets.only(left: 15),
           decoration: BoxDecoration(
             color: Colors.brown,
            borderRadius: BorderRadius.circular(10),),
            child: DropdownButtonFormField(
              style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
              dropdownColor: Colors.purple,
              focusColor: Colors.red,
              iconEnabledColor: Colors.white,
              iconDisabledColor: Colors.black,
              value: firstsubject,
              
              items: subjectname.map((e) => DropdownMenuItem(value: e,child: Text(e),)).toList(),
              onChanged: (value) {
                setState(() {
                  firstsubject=value.toString();
                  selectedsubject=firstsubject;

                });
              },

            ),
          ),
          const SizedBox(height: 10,),

          Container(
            height: 600,
            
            
            color: Colors.greenAccent,
            child: StreamBuilder(
              stream: getdata(selectedclass??"Class_1",selectedsubject??"Bangla 1st Paper",sessionvalue),
              
              builder: ((context, snapshot) {
                if(snapshot.hasError){
                  return const Center(child: Text("No Data"),);
                }else if(snapshot.hasData){
          
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    
                    itemBuilder: ((context, index) {
                    final marklist=snapshot.data![index];
                    return ListView(
                      shrinkWrap: true,
                      children: [

                        Container(
                          padding:  const EdgeInsets.only(top: 8),
                          height: height*0.13,
                          margin: EdgeInsets.only(bottom: height*0.01),
                          decoration: BoxDecoration(
                            
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                            
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children:  [

                                  Text("Name",style: TextStyle(color: Colors.white,fontSize: width*0.014),),
                                   SizedBox(width:width*0.02 ,),
                                   Text("Roll",style: TextStyle(color: Colors.white,fontSize: width*0.014),),
                                   SizedBox(width:width*0.015 ,),

                                  //Text("Subject Name"),
                                  
                                  Text("Total-mark",style: TextStyle(color: Colors.white,fontSize: width*0.014),),
                                  SizedBox(width:width*0.015 ,),
                                  Text("Pass-Mark",style: TextStyle(color: Colors.white,fontSize: width*0.014),),
                                  SizedBox(width:width*0.015 ,),
                                  Text("Obtains_Mark",style: TextStyle(color: Colors.white,fontSize: width*0.014),),
                                  SizedBox(width:width*0.015 ,),
                                  Text("Grade",style: TextStyle(color: Colors.white,fontSize: width*0.014),),

                                  


                                ],
                              

                              ),
                               //SizedBox(height: 5,),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Container(
                                    padding: const EdgeInsets.only(top: 5),
                                    height: height*0.08,
                                    width: width*0.07,

                                    child: Center(child: Text(marklist.studentname.toString(),style: const TextStyle(color: Colors.white),)),
                                  ),
                                   SizedBox(width:width*0.015,),
                                   Text(marklist.rollno!,style: const TextStyle(color: Colors.white),),
                                    SizedBox(width:width*0.03,),
                                  //Text("Subject Name"),
                                  
                                  Text(marklist.totalmark!,style: const TextStyle(color: Colors.white),),
                                   SizedBox(width:width*0.06 ,),
                                  Text(marklist.passmark!,style: const TextStyle(color: Colors.white),),
                                   SizedBox(width:width*0.07 ,),
                                  Text(marklist.obtainedmark!,style: const TextStyle(color: Colors.white),),
                                   SizedBox(width:width*0.07 ,),
                                  Text(marklist.grade!,style: const TextStyle(color: Colors.white),),
                                  


                                ],
                              

                              ),
                              //SizedBox(height: 10,)
                              

                              
                            ],
                          ),
                        )
                       
          
                      ],
          
                    );
                    
                  }));
          
                }else{
                  return const Center(child: CircularProgressIndicator(),);
                }
              
            })),
          )

          
        ],
      ),
    );
  }

  Stream<List<MarktestModel>>getdata(String classname,String subjectname,String session)=>firestore.collection("test").doc(sessionvalue.isEmpty?"_1":sessionvalue).collection(sessionvalue.isEmpty?"_1":sessionvalue).doc("subject").collection(classname).doc(classname).collection(subjectname).snapshots().map((event) => event.docs.map((e) => MarktestModel.fromMap(e)).toList());
}
