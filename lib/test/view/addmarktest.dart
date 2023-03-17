// ignore_for_file: public_member_api_docs, sort_constructors_first








import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:image_picker/image_picker.dart';


import 'package:schollapp/const/importent.dart';
import 'package:schollapp/model/studentmodel.dart';
import 'package:schollapp/reusable/textform.dart';
import 'package:intl/intl.dart';
import 'package:schollapp/test/database/testdatabase.dart';
import 'package:schollapp/test/methode/greadesheet.dart';
import 'package:schollapp/test/model/addtestmodel.dart';

import '../methode/point.dart';
import '../model/marktest.dart';
class MarkTest extends StatefulWidget {
    const MarkTest({
    Key? key,
    // required this.classnames,
    // required this.studentname,
  }) : super(key: key);
  //  final String  classnames;

  //  final String?studentname;

   
   

   

  @override
  State<MarkTest> createState() => _MarkTestState();
}

class _MarkTestState extends State<MarkTest> {

  Test test=Test();
 

  String ? selecteditem;


  List<String > item=[];
 
  String intstatus="Regular";
  String initialsubject="Bangla 1st Paper";

  String classnames="Class_1";

  String? imageges;


  
  String? gradesystem;
  String? pointsystem;
  String  studentsname="";
  String  initialmark="30";

  String firstexamnames="";

  String rollfirstvalues="";

  MarktestModel model=MarktestModel();
   String sessionvalue="2014";

  var testname=[];
  
  TextEditingController ?namecontroller=TextEditingController();
  TextEditingController ?totalcontroller=TextEditingController();
  TextEditingController ?passmarkcontrolar=TextEditingController();
  TextEditingController ?obtaincontrolar=TextEditingController();
  TextEditingController ?statuscontrolar=TextEditingController();
  TextEditingController ?othersdescription=TextEditingController();
  TextEditingController ?subectcontrolar=TextEditingController();
  TextEditingController ?sessoncontrolar=TextEditingController();
  
  final datecontrolar=TextEditingController();
  final _key=GlobalKey<FormState>(); 
  


  List<String> subject=[
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


  List status=[
    "Regular",
    "Irregular"
  ];

  
 String namestest="";


  




   

  


   Future gettest() async{

    var  querysnapshot=await firestore.collection("test").get();
    
     for(var test in querysnapshot.docs){

      var nametest=test.data()["testname"];

      
         testname.add(nametest);
         

         namestest=namestest;
        
      
     

      

     }


   }
   Future getdata( String? classnamess) async{

    
    

    var querysnapshot= await firestore.collection("student").doc(sessionvalue.isEmpty?"_1":sessionvalue).collection(sessionvalue.isEmpty?"_1":sessionvalue).doc("students").collection(classnamess!).get();

    
    
    
      for (var element in querysnapshot.docs) { 
      // ignore: unrelated_type_equality_checks
      
         var roll=element.data()["rollnumber"];

        setState(() {
          item.add(roll);
          
        });
       
    
    }

    }


    
        
  
        
    
     

    
  
 var passmark=[
  "30",
  "45",
  "25",
  "20",
 ];

  

  

   

  List <String> classname=[
    "Class_1",
    "Class_2",
    "Class_3",
    "Class_4",
    "Class_5",
    "Class_6",
    "Class_7",
    "Class_8",
    "Class_9",
    "Class_10"
  ];
   //String firstclass="Class_1";
   
   //int system=0;

   @override
  void initState() {
     

    super.initState();
  }

   
  @override
  Widget build(BuildContext context) {
    

    //print(system);
    //String? namelist;
    

     print("Class is is :$classnames");
     
    
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text("Mark Test"),centerTitle: true,),
      body: Form(
        key: _key,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
          height: 10.h,
        ),
        TextForm(
          controller: sessoncontrolar,
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
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10)

                ),
                
                
                child: DropdownButtonFormField(
                  validator: (value) {
                    if(value!.isEmpty){
                    return "value is not Empty";
                  }
                  },
                 
                  
                  
                  value: classnames,
                  
                  items: classname.map((e){
                  return DropdownMenuItem(
                    value: e.toString(),
                    
                    child: Text(e.toString()));
                }).toList(), onChanged: ((value) {
                  

                  


                  setState(() {
                  
                  
                   model.setclassname(value.toString());
                    
                    //firstclass=value.toString();
                    classnames=value.toString();
                   
                    
                  });
                  
                })),
              ),
              
             const SizedBox(height: 10,),
             const Text("Roll",style: TextStyle(color:Color.fromARGB(255, 255, 255, 255),fontSize: 18,fontWeight: FontWeight.bold),),
             const SizedBox(height: 10,),

             StreamBuilder(
              stream: firestore.collection("student").doc(sessionvalue.isEmpty?"_1":sessionvalue).collection(sessionvalue.isEmpty?"_1":sessionvalue).doc("students").collection(classnames).snapshots(),

              
              builder: ((context, snapshot){

                if(snapshot.hasError){
                 
                   return const Center(child:  Text("No Data"),);
                   

                } else if(snapshot.hasData){
                  
                   

                   
                      List  roll=[];
                      //String fisrtrollvalue="";

                   String values="";

                   for(int i=0;i<snapshot.data!.docs.length;i++){

                    var rollid=snapshot.data!.docs[i]["rollnumber"];
                     roll.add(rollid);
                     values=rollid;
                     

                   }

                   //fisrtrollvalue=roll[i];
                   //rollfirstvalues=fisrtrollvalue;
                      
                      
                      
                    return  Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(10)

                ),
                
                child: DropdownButtonFormField(
                  
                
                validator: (value) {
                  if(value!.isEmpty){
                    return "value is not Empty";
                  }
                  
                },
                  focusColor: Colors.green,
                  
                  style: const TextStyle(fontSize: 20,color: Colors.white),
                  dropdownColor: Colors.red,
                  //value: values,
                  
                  items: roll.map((e) => DropdownMenuItem(
                    
                    
                    
                    value: e.toString(),
                    
                    
                    child: Text(e.toString()),)).toList(),
                  onChanged: (value) {
                  setState(() {
                    model.setrool(value.toString());
                    values=value.toString();
                    
                    selecteditem=values;
                    
                    
                  });
                  },
                ),
              );
                     
                   

                
                    
                  }
                  
                
                return const Center(child: CircularProgressIndicator(),);
              })),
             
              const SizedBox(
                height: 10,
              ),
               StreamBuilder(
                 stream: firestore.collection("student").doc(sessionvalue.isEmpty?"_1":sessionvalue).collection(sessionvalue.isEmpty?"_1":sessionvalue).doc("students").collection(classnames).snapshots(),
                  //stream:firestore.collection("student").doc("students").collection(classnames).snapshots() ,
                  
                  builder: ((context, snapshot) {
                    if(snapshot.hasError){
                      return Center(child: Text("error is happining :${snapshot.error}"),);
                    }else if(snapshot.hasData){
                      
                      String? name;
      
                      String?img;
      
                      for(int i=0;i<snapshot.data!.docs.length;i++){
                        var namewisedocs=snapshot.data!.docs[i].data()["id"];
      
                        if(selecteditem==namewisedocs){
                          name=snapshot.data!.docs[i].data()["name"];
                          img=snapshot.data!.docs[i].data()["img"];
      
                          imageges=img;
                          studentsname=name.toString();
      
                        }
                        
      
                      }
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        
                        children: [
                           const Text("Name",style: TextStyle(color:Color.fromARGB(255, 255, 255, 255),fontSize: 18,fontWeight: FontWeight.bold),),
                         const SizedBox(height: 10,),
                          SizedBox(
                            height: 50,

                            
                            child:TextForm(
                              
                              controller: TextEditingController(text: studentsname),
                              
                              
                              onChanged: (v) {
                                

                                setState(() {
                                  model.setstudentname(v.toString());
                                  selecteditem=v;
                                  
                                });
                                
                              
                              
                              
                    },),),
      
                            
                            //child: Text(name??"Not Selected")),
      
                            const SizedBox(
                              height: 20,
                            ),
      
                            Center(
                              child: Container(
                                height: 150,
                                width: 250,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  //borderRadius: BorderRadius.c
                                  image: DecorationImage(image: NetworkImage(img??"https://gw.alicdn.com/tfs/TB1qraZvXP7gK0jSZFjXXc5aXXa-345-188.png",),fit: BoxFit.contain)
                                ),
                                //child: Image.network(img??"https://gw.alicdn.com/tfs/TB1qraZvXP7gK0jSZFjXXc5aXXa-345-188.png",fit: BoxFit.cover,),
                              ),
                            )
                        ],
                      );
      
                         
                          
                        
                    }else{
                      return const Center(child: CircularProgressIndicator(),);
                    }
                    
      
                  
                }
                
                )),

                const SizedBox(height: 10,),

                const Text("What type of Test?",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),

                
               const SizedBox(
                height: 10,
               ),

               StreamBuilder(
                stream: firestore.collection("test").doc("tests").collection("examlist").snapshots(),
                
                builder: ((context, snapshot) {
                  if(snapshot.hasError){
                    return const Center(child: Text("No Data"),);
                  }else if(snapshot.hasData){

                    var examlist=[];
                     String firstexamname="";
                    var exams="";
                    for(int i=0;i<snapshot.data!.docs.length;i++){
                      var exam=snapshot.data!.docs[i]["testname"];
                      examlist.add(exam);
                      exams=exam;

                    }
                    firstexamname=examlist[0];
                    firstexamnames=firstexamname;
                  return Container(
                
                padding: const EdgeInsets.only(left: 10),
                 decoration: BoxDecoration(
                  color:  Colors.tealAccent,
                  borderRadius: BorderRadius.circular(10)
                 ),

                 
                 child: DropdownButtonFormField(
                  value: exams,
                 
                  
                  items: examlist.map((e) => DropdownMenuItem(value: e,child: Text(e.toString()),)).toList(), onChanged: ((value) {


                    

                    setState(() {
                    
                      exams=value.toString();
                      model.testnames(value.toString());
                      
                      //var i=value.toString();
                      //print(i);
                    });
                    
                  })),
               );
                     
                  }return const Center(child: CircularProgressIndicator(),);
                 
               })),

              
               const SizedBox(
                height: 10,
               ),
                const Text("Exam Date",style: TextStyle(color:Color.fromARGB(255, 255, 255, 255),fontSize: 18,fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
      
                TextForm(
                  
                  hintText:"Date Time insert" ,
                  controller: datecontrolar,
                  
                  onTap: () async{
                    DateTime?pictdate=await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2200),currentDate: DateTime.now());
      
                    if(pictdate!=null){
                      setState(() {
                         datecontrolar.text=DateFormat('dd-MM-yyyy').format(pictdate);
                        
                      });
                     
      
                    }
                    
                  },
                  onChanged: (v) {
                    //model.settestedate(v.toString());
                    
                    
                  },
                  onSaved: (v) {
                    model.testdate=v;
                    
                  },
                  
                ),
                const SizedBox(height: 10,),
                const Text("Subject",style: TextStyle(color:Color.fromARGB(255, 255, 255, 255),fontSize: 18,fontWeight: FontWeight.bold),),
                const SizedBox(height: 5,),
                Container(
                
                padding: const EdgeInsets.only(left: 10),
                
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 24, 24, 161),
                  borderRadius: BorderRadius.circular(10)

                ),
                  child: DropdownButtonFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Required subect name";
                      }
                    },
                    focusColor: Colors.amber,
                    
                    dropdownColor: const Color.fromARGB(255, 30, 27, 121),
                    style: const TextStyle(color: Color.fromARGB(255, 235, 48, 34),fontWeight: FontWeight.bold),
                    
                      
                      
                    value: initialsubject,
                    
                    items: subject.map((e) => DropdownMenuItem(value: e,child: Text(e.toString(),),)).toList(), onChanged: ((value){
                    
                      setState(() {
                       
                        initialsubject=value.toString();
                        model.setsubjectname(value.toString());
                      });
                    })),
                ),
                const SizedBox(
                  height: 10,
                ),
                 const Text("Total Mark",style: TextStyle(color:Color.fromARGB(255, 255, 255, 255),fontSize: 18,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10,),
      
                
                TextForm(controller: totalcontroller,
                validator: (v) {
                  if(v!.isEmpty){
                     return " Mark is not empty";

                  }
                 
                  
                },
                 keyboardType: TextInputType.number,
                
                hintText: "Total Mark",
                onSaved: (v) {
                  
                },
                onChanged: (v) {
                  setState(() {
                    model.settotalmark(v.toString());
                  });
                  
               
                  
                },
                
                
                ),
                const SizedBox(height: 10,),

                const Text("Passing Mark",style: TextStyle(color:Color.fromARGB(255, 255, 255, 255),fontSize: 18,fontWeight: FontWeight.bold),),
                const SizedBox( height: 10,),
                
      
                Container(
                  height: 50,
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.blueGrey,

                    borderRadius: BorderRadius.circular(10),
                    
                    

                  ),
                  child: DropdownButtonFormField(
                    validator: (value) {
                      if(value!.isEmpty){
                        return "Pass Mark is not Empty";
                      }
                      
                    },
                    hint: const Text("Pass Mark"),
                    focusColor: Colors.amber,
                    dropdownColor: const Color.fromARGB(255, 172, 149, 211),
                    style: const TextStyle(color: Color.fromARGB(255, 102, 0, 71),fontWeight: FontWeight.bold),
                    
                      
                      
                    value: initialmark,
                    
                    items: passmark.map((e) => DropdownMenuItem(value: e,child: Text(e.toString(),),)).toList(), onChanged: ((value) => {
                      initialmark=value.toString(),
                      model.setpmark(value.toString())


                    })),
                ),
                
                
                const Text("Input Mark",style: TextStyle(color:Color.fromARGB(255, 255, 255, 255),fontSize: 18,fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                TextForm(
                  
                  
                  controller: obtaincontrolar,
                 
                 keyboardType: TextInputType.number,
                
                hintText: "Input Mark",
                
                  
                

                onChanged: (v) {
                  setState(() {
                    gradesystem=v.toString();
                    pointsystem=gradesystem;
                    model.setinputmark(v.toString());

                    
                  });
                  
                  
                },
                onTap: () {
                   
                    
                    
                    
                  
                  
                },
                onSaved: (v) {
                  
                },
               
                
                ),
                const SizedBox(height: 10,),
                
                const Text("Point",style: TextStyle(color:Color.fromARGB(255, 255, 255, 255),fontSize: 18,fontWeight: FontWeight.bold),),
                const SizedBox(height: 10,),
                

                TextForm(
                  controller: TextEditingController(text: greatpoint(double.tryParse(pointsystem.toString()))
                ),
                ),
                
                
                const SizedBox(height: 10,),
                const Text("Status",style: TextStyle(color:Color.fromARGB(255, 255, 255, 255),fontSize: 18,fontWeight: FontWeight.bold),),
                const SizedBox(height: 15,),
                Container(
                  
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 138, 96, 139),

                    borderRadius: BorderRadius.circular(10),
                    
                    

                  ),
                  child: DropdownButtonFormField(
                    
                     focusColor: Colors.amber,
                    dropdownColor: const Color.fromARGB(255, 32, 167, 104),
                    style: const TextStyle(color: Colors.white),
                    value: intstatus,
                    
                    items: status.map((e) => DropdownMenuItem(value: e,child: Text(e.toString(),),)).toList(), onChanged: ((value){
                      intstatus=value.toString();
                      model.setstatus(value.toString());
                    })),
                ),
                  const SizedBox(height: 10,),

                  const Text("Grade ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                  const SizedBox(height: 10,),
                  

                  TextForm(
                    
                   onTap: () {
                    
                     
                   },
                  
                  controller: TextEditingController(text:greatesheet(int.tryParse(gradesystem.toString())))),
                  const SizedBox(height: 10,),

                  const Text("Description",style: TextStyle(color:Color.fromARGB(255, 255, 255, 255),fontSize: 18,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10,),
                  
                  TextForm(
                    validator: (v) {
                      if(v!.isEmpty){
                        return "Required Description isnot empty";


                      }
                      
                    },
                    controller: othersdescription,
                 keyboardType: TextInputType.name,
                
                hintText: "Others Description",
                maxline: 3,
                onSaved: (v) {
                  model.description=v;
                  
                },),

                const SizedBox(height: 10,),
                ElevatedButton(onPressed: (){
                  onsave();

                }, child: const Text("Added"))

                

              
      
      
      
      
      
              
      
              
      
      
            ],
          ),
        ),
      ),
    );
  }

  Stream<List<StudentsModel>> getroll(String classname)=>firestore.collection("student").doc(sessionvalue.isEmpty?"_1":sessionvalue).collection(sessionvalue.isEmpty?"_1":sessionvalue).doc("students").collection(classname).snapshots().map((event) => event.docs.map((e) => StudentsModel.fromMap(e.data())).toList());
  
  void onsave() async{
    if(_key.currentState!.validate()){
      _key.currentState!.save();
      try{
        test.addtest(test: model, img: imageges.toString(), grade: greatesheet(int.tryParse(gradesystem.toString())),studentname: studentsname ,point: greatpoint(double.tryParse(pointsystem.toString())));
        //test.addidwisemark(test: model, img: imageges.toString(), grade: greatesheet(int.parse(gradesystem.toString())), studentname: studentsname);
        test.addexam(session: sessionvalue,test: model, img: imageges.toString(), grade: greatesheet(int.parse(gradesystem.toString())), studentname: studentsname,point: greatpoint(double.tryParse(pointsystem.toString())));
        test.addsubjectwise(session: sessionvalue,test: model, img: imageges.toString(), grade: greatesheet(int.parse(gradesystem.toString())), studentname: studentsname,point: greatpoint(double.tryParse(pointsystem.toString())));
        test.addexamwisedresult(session: sessionvalue,test: model, img: imageges.toString(), grade: greatesheet(int.parse(gradesystem.toString())), studentname: studentsname,point: greatpoint(double.tryParse(pointsystem.toString())));
        
     
        Get.snackbar("Marktest","Save Sucessfully",snackPosition: SnackPosition.BOTTOM);
        _key.currentState!.reset();
        Navigator.of(context).pop();

      }catch(e){
        Get.snackbar("Mark Error", "Failer is $e",snackPosition: SnackPosition.BOTTOM);
        _key.currentState!.reset();
        Navigator.of(context).pop();

      }
      

    }

  }
}

