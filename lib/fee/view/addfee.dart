
import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:get/get.dart';
import 'package:schollapp/fee/databasehhelper/feesdata.dart';
import 'package:schollapp/fee/methode/duemethode.dart';
import 'package:schollapp/fee/model/duemodel.dart';
import 'package:schollapp/fee/model/fees.dart';

import '../../const/importent.dart';
import '../../reusable/textform.dart';
import "package:intl/intl.dart";



class AddFess extends StatefulWidget {
  const AddFess({super.key});

  @override
  State<AddFess> createState() => _AddFessState();
}

class _AddFessState extends State<AddFess> {

  

  
 



  String classnames="Class_1";

  Fees fees=Fees();
  Duemodel duemodel=Duemodel();

  String? imageges;
  String rollfirstvalues="";

  String selecteditem="";
  String studentsname="";
   var date="";
   double? paid;
   double ?fee;
   FeesData feesData=FeesData();

  final accountcontrolar=TextEditingController();
  TextEditingController? dateControlar;
  TextEditingController paidcontrolar=TextEditingController();
  final sesionControlar=TextEditingController();
  String sessionvalue="2014";
  var fishnameControlar=TextEditingController();
  String monthyearname="";

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

  final _key=GlobalKey<FormState>();
  @override
  void initState() {
    
    dateControlar=TextEditingController(text: date);
    rollfirstvalues;
    selecteditem;
    studentsname;
    monthyearname;
    
    
    super.initState();
  }

   

  @override
  Widget build(BuildContext context) {

   
    List monthlist=[];
    String monthsyears="";

    //String roolvalue=rollfirstvalues;

   
   
    for(int i=0;i<12;i++){
      DateTime now=DateTime.now();
      DateTime month=DateTime(now.year,now.month-i,1);
      String monthyear="${month.month}/${month.year}".trim();

      String monthyearss="${now.month}/${now.year}".trim();
      monthsyears=monthyearss;
      monthyearname=monthsyears;

      //monthsyears=month.toString();
      monthlist.add(monthyear);

      

    }

    //print(" class is ${rollfirstvalues}");

    
    return Scaffold(
      
      
      backgroundColor: Colors.grey,
      appBar: AppBar(title: const Text("Add Fee"),),
      body: Form(
        key: _key,
        child: Padding(
          padding:  EdgeInsets.all(16.w),
          child: ListView(

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
                  validator: (v) {
                    if(v!.isEmpty){
                      return "required session";
                    }
                    
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
                  
                  
                   
                    
                    //firstclass=value.toString();
                    classnames=value.toString();
                   
                    
                  });
                  
                })),
              ),
              
             const SizedBox(height: 10,),
             SizedBox(
                height: 10.h,
               ),
                const Text("Roll",style: TextStyle(color:Color.fromARGB(255, 255, 255, 255),fontSize: 18,fontWeight: FontWeight.bold),),
                 SizedBox(height: 10.h,),
      
             

             StreamBuilder(
              stream: firestore.collection("student").doc(sessionvalue.isEmpty?"-1":sessionvalue).collection(sessionvalue.isEmpty?"-1":sessionvalue).doc("students").collection(classnames).snapshots(),

             
              
              builder: ((context, snapshot){

                if(snapshot.hasError){
                 
                   return const Center(child:  Text("No Data"),);
                   

                } else if(snapshot.hasData){
                  
                   

                   
                      List  roll=[];
                      String fisrtrollvalue="";

                   //String values="";
                   int k=0;

                   for(int i=0;i<snapshot.data!.docs.length;i++){


                    var rollid=snapshot.data!.docs[i]["rollnumber"];
                     roll.add(rollid);
                     //values=rollid;
                     k=i;
                     
                     

                   }

                   //fisrtrollvalue=roll[k];
                   //rollfirstvalues=fisrtrollvalue;
                      
                      
                      
                    return  Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(10)

                ),
                
                child: DropdownButtonFormField(
                  
                
                
                  
                
                  focusColor: Colors.green,
                  
                  style: const TextStyle(fontSize: 20,color: Colors.white),
                  dropdownColor: Colors.red,
                  //value: fisrtrollvalue,
                  
                  items: roll.map((e) => DropdownMenuItem(
                    
                    
                    
                    value: e.toString(),
                    
                    
                    child: Text(e.toString()),)).toList(),
                  onChanged: (value) {
                  setState(() {
                    //fees.setroll(value.toString());
                    rollfirstvalues=value.toString();
                    
                    selecteditem=rollfirstvalues;
                    
                    
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
                stream: firestore.collection("student").doc(sessionvalue.isEmpty?"-1":sessionvalue).collection(sessionvalue.isEmpty?"-1":sessionvalue).doc("students").collection(classnames).snapshots(),

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
                              

                              onSaved: (v) {
                                
                                
                              },
                              
                              onChanged: (v) {
                                

                                setState(() {
                                  //fees.setname(v.toString());
                                  selecteditem=v.toString();
                                  
                                });
                                
                              
                              
                              
                    },),),
      
                            
                            //child: Text(name??"Not Selected")),
      
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 10.h,
                          ),
                           const Text("Image",style: TextStyle(color:Color.fromARGB(255, 255, 255, 255),fontSize: 18,fontWeight: FontWeight.bold),),
                           SizedBox(height: 10.h,),
      
      
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

                
                SizedBox(
                height: 10.h,
               ),
                const Text("Month Year",style: TextStyle(color:Color.fromARGB(255, 255, 255, 255),fontSize: 18,fontWeight: FontWeight.bold),),
                 SizedBox(height: 10.h,),
      

                
                 Container(
                padding: const EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(10)),

                
                  child: DropdownButtonFormField(
                    
                    dropdownColor: Colors.indigoAccent,
                    value: monthsyears,
                    items: monthlist.map((e) =>DropdownMenuItem(value: e,child: Text(e.toString()),) ).toList(),
                    
                    onChanged:((value){
                      setState(() {
                        monthyearname=value.toString().trim();
                        fees.setmonthYear(monthyearname);
                        duemodel.setmonthYear(value.toString());
                      });
                
                  }) ,),
                ),
                 SizedBox(
                height: 10.h,
               ),
                const Text("FeesName",style: TextStyle(color:Color.fromARGB(255, 255, 255, 255),fontSize: 18,fontWeight: FontWeight.bold),),
                 SizedBox(height: 10.h,),
                 TextForm(
                  keyboardType: TextInputType.name,
                  
                  onSaved: (v) {
                    fees.feesname=v.toString();
                    duemodel.feesname=v.toString();

                   
                    
                  },
                  validator: (v) {

                    
                    if(v!.isEmpty){
                      return "Fish name is not Empty Field";
                    }
                    return null;
                    
                  },
                  hintText: "FeesName",
                  controller:fishnameControlar ,
                ),

                SizedBox(
                height: 10.h,
               ),
                const Text("Fees",style: TextStyle(color:Color.fromARGB(255, 255, 255, 255),fontSize: 18,fontWeight: FontWeight.bold),),
                 SizedBox(height: 10.h,),
      
                TextForm(
                  keyboardType: TextInputType.number,
                  onChanged: (v) {
                    setState(() {
                       fee= double.tryParse(v.toString());
                    });
                    
                  },
                  onSaved: (v) {
                    fees.amount=v.toString();
                    duemodel.amount=v;

                   
                    
                  },
                  validator: (v) {

                    
                    if(v!.isEmpty){
                      return "Number is not Empty";
                    }
                    return null;
                    
                  },
                  hintText: "Fees",
                  controller:accountcontrolar ,
                ),
                 SizedBox(
                height: 10.h,
               ),
                const Text("Fees Date",style: TextStyle(color:Color.fromARGB(255, 255, 255, 255),fontSize: 18,fontWeight: FontWeight.bold),),
                 SizedBox(height: 10.h,),
      

                 TextForm(
                  onSaved: (v) {
                    fees.feedate=v.toString();
                    
                    
                  },
                  
                  controller: dateControlar,
                  onChanged: (v) {
                    
                      //fees.setfeedate(v);
                      
                    
                    
                  },
                  validator: (v) {
                    if(v!.isEmpty){
                      return "Date is not empty";
                    }
                    
                  },
                  onTap: ()  async{
                    DateTime?pickdate= await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2100));

                    if(pickdate!=null){
                      dateControlar!.text=DateFormat('yyyy-MM-dd').format(pickdate);
                      date=dateControlar!.text;

                    }
                    
                  },
                 ),
                 SizedBox(
                height: 10.h,
               ),
                const Text("Paid",style: TextStyle(color:Color.fromARGB(255, 255, 255, 255),fontSize: 18,fontWeight: FontWeight.bold),),
                 SizedBox(height: 10.h,),
      
                 TextForm(
                  keyboardType: TextInputType.number,
                  onChanged: (v) {
                    setState(() {
                       paid=double.tryParse(v.toString());
                    });
                    
                  },
                  onSaved: (v) {
                    fees.paid=v.toString();
                    duemodel.payment=v;
                   
                    
                  },
                  validator: (v) {

                    
                    if(v!.isEmpty){
                      return "Number is not Empty";
                    }
                    return null;
                    
                  },
                  hintText: "Paid",
                  controller:paidcontrolar,

                 ),
                 const Text("Due",style: TextStyle(color:Color.fromARGB(255, 255, 255, 255),fontSize: 18,fontWeight: FontWeight.bold),),
                 SizedBox(height: 10.h,),
      
                 TextForm(
                  keyboardType: TextInputType.number,
                  onSaved: (v) {
                    //fees.paid=v.toString();
                    //paid=double.tryParse(v.toString());

                  
                    
                  },
                  validator: (v) {

                    
        
                    
                  },
                  hintText: "Due",
                  controller: TextEditingController(text:  (due(fee??0, paid??0)).toString(),

                 ),),
                 SizedBox(height: 10.h,),
                 ElevatedButton(onPressed:(){

                  onsave();
                  Navigator.of(context).pop();

                 }, child: const Text("Submitted"))

                
                
                ]))));
                
                

            
  }
  
  void onsave()  async{

    if(_key.currentState!.validate()){
      _key.currentState!.save();

      try{
        await feesData.adddfees(fees: fees, roll: rollfirstvalues, classes: classnames, name: studentsname, img: imageges!,session: sessionvalue);
        await feesData.duefees(session: sessionvalue,model: duemodel, roll: rollfirstvalues, classes: classnames, name: studentsname, due:  double.parse(due(fee??0, paid??0)));

       
      
        
        
        
       

      }catch(e){
        Get.snackbar("Submit", "Error is:$e",snackPosition: SnackPosition.BOTTOM);
        

      }
      // ignore: use_build_context_synchronously
      
      rollfirstvalues="";
      classnames="";
      selecteditem="";
      imageges="";
      accountcontrolar.text="";
      paidcontrolar.text="";
      



    }
   
    

    


  }
}