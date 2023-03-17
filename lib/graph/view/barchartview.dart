





import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:schollapp/const/importent.dart';
import 'package:schollapp/graph/barchart/barchartmodel.dart';


class Barchartview extends StatefulWidget {
  const Barchartview({super.key});

  @override
  State<Barchartview> createState() => _BarchartviewState();
}

class _BarchartviewState extends State<Barchartview> {

  
   
 
  
  
  int class1number=0;
  int class2number=0;
  int class3number=0;
  int class4number=0;
  int class5number=0;
  int class6number=0;
  int class7number=0;
  int class8number=0;
  int class9number=0;
  int class10number=0;


  class1get() async{

    await firestore.collection("student").doc("2023").collection("2023").doc("students").collection("Class_1").get().then((value) {
      

      if(mounted){
        setState(() {
          class1number=value.docs.length;
        });

      }
        
        
      


    });//forEach((element) {

     
  }
   class2get() async{

    await firestore.collection("student").doc("2023").collection("2023").doc("students").collection("Class_2").get().then((value) {

     if(mounted){
        setState(() {
         class2number=value.docs.length;
       });

     }  
 
    
       
    


    });//forEach((element) {

     
  }
   class3get() async{

    await firestore.collection("student").doc("2023").collection("2023").doc("students").collection("Class_3").get().then((value) {
      

      if(mounted){
         setState(() {
          class3number=value.docs.length;
          
        });

      }
        
       
      


    });//forEach((element) {

     
  }
   class4get() async{

    await firestore.collection("student").doc("2023").collection("2023").doc("students").collection("Class_4").get().then((value) {
      
     if(mounted){
       setState(() {
         class4number=value.docs.length;
        
      });
       

     }
     
  


    });//forEach((element) {

     
  }
   class5get() async{

    await firestore.collection("student").doc("2023").collection("2023").doc("students").collection("Class_5").get().then((value) {
      

      if(mounted){
        setState(() {
          class5number=value.docs.length;
          
        });

      }
        
        
     

    });//forEach((element) {

     
  }
   class6get() async{

    await firestore.collection("student").doc("2023").collection("2023").doc("students").collection("Class_6").get().then((value) {
      

     
        
      if(mounted){
        setState(() {
        class6number=value.docs.length;
      });

      }
      


    });//forEach((element) {

     
  }
   class7get() async{

    await firestore.collection("student").doc("2023").collection("2023").doc("students").collection("Class_7").get().then((value) {
      
     if(mounted){
      setState(() {
        class7number=value.docs.length;
      });
        

     }
      
      

    });//forEach((element) {

     
  }
   class8get() async{

    await firestore.collection("student").doc("2023").collection("2023").doc("students").collection("Class_8").get().then((value) {
      

      if(mounted){
        setState(() {
          class8number=value.docs.length;
      });

      }
      
     


    });//forEach((element) {

     
  }
   class9get() async{

    await firestore.collection("student").doc("2023").collection("2023").doc("students").collection("Class_9").get().then((value) {
      

      
       
       if(mounted){
        setState(() {
         class9number=value.docs.length;
      });
        
       }
      


    });//forEach((element) {

     
  }
   class10get() async{

    await firestore.collection("student").doc("2023").collection("2023").doc("students").collection("Class_10").get().then((value) {
      
     
      if(mounted){
         setState(() {
        class10number=value.docs.length;
        
      });

      } 


     
        
      

    });//forEach((element) {

     
  }



  @override
  void initState() {
    class1get();
    class2get();
    class3get();
    class4get();
    class5get();
    class6get();
    class7get();
    class8get();
    class9get();
    class10get();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print(class1number);

    List<BarcartModel> data=[
      BarcartModel(
        id: 1,
        classneme: "Class-1",
        color: Colors.amber,
        
        attendndence: class1number),
         BarcartModel(
        id: 2,
        classneme: "Class-2",
        color: Colors.red,
        
        attendndence: class2number),
         BarcartModel(
        id: 3,
        classneme: "Class-3",
        color: Colors.black,
        
        attendndence: class3number),
         BarcartModel(
        id: 4,
        classneme: "Class-4",
        color: Colors.blue,
        
        attendndence: class4number),
         BarcartModel(
        id: 5,
        classneme: "Class-5",
        color: Colors.blueGrey,
        
        attendndence: class5number),
        BarcartModel(
        id: 6,
        classneme: "Class-6",
        color: Colors.brown,
        
        attendndence: class6number),
        BarcartModel(
        id: 7,
        classneme: "Class-7",
        color: Colors.deepOrange,
        
        attendndence: class7number),
        BarcartModel(
        id: 8,
        classneme: "Class-8",
        color: Colors.greenAccent,
        
        attendndence: class8number),
        BarcartModel(
        id: 9,
        classneme: "Class-9",
        color: Colors.deepPurpleAccent,
        
        attendndence: class9number),
        BarcartModel(
        id: 10,
        classneme: "Class-10",
        color: Colors.indigo,
        
        attendndence: class10number),


        
        

        
      

    ];
    SideTitles getTopBottomTitle()=>SideTitles(
    showTitles: true,
    getTitlesWidget: ((value, meta) {
      final style = TextStyle(
      color: Colors.white60,
      
      fontWeight: FontWeight.bold,
      fontSize: 6.sp,
    );
    return Text(data.firstWhere((element) => element.id==value.toInt()).classneme!,style: style,);

    }));

    SideTitles getTSideTitle()=>SideTitles(
      
    interval:20 ,
    
    
    showTitles: true,
    getTitlesWidget: ((value, meta) {
      
      const style = TextStyle(
      color: Colors.red,
      fontWeight: FontWeight.bold,
      fontSize: 10,
      
    );
    return Text(
      value==0?"0":
      
      value.toInt().toString(),style: style,);
    //return Text(data.firstWhere((element) => element.id==value.toInt()).attendndence.toString(),style: style,);

    }));
    




    //print(class2number);
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Container(
        padding: EdgeInsets.all(10.w),
        height: 250.h,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 51, 33, 102),
          borderRadius: BorderRadius.circular(20.r)
        ),
        child: Column(
          children: [
            AspectRatio(aspectRatio: 1.5,
            child: BarChart( 
              
              
              BarChartData(
                gridData: FlGridData(
              
                  checkToShowHorizontalLine: ((value) => value%10==0),
                  getDrawingHorizontalLine: (value) {
                    if (value==0){
                      return FlLine(
                    color: Colors.deepPurpleAccent,
                    strokeWidth: 1.5,);

                    }
                    else{
                      return FlLine(
                    color: Colors.deepOrange,
                    strokeWidth: 1.5,);

                  
                    }

                  } 
                  
                ),
                titlesData: FlTitlesData(
                  
                  topTitles: AxisTitles(sideTitles: getTopBottomTitle()),
                  leftTitles: AxisTitles(sideTitles: getTSideTitle()),
                  rightTitles: AxisTitles(sideTitles: getTSideTitle()),
                  
                  bottomTitles: AxisTitles(sideTitles: getTopBottomTitle()),),
                maxY: 100,
                //minY: -100,
                
                alignment: BarChartAlignment.center,
                groupsSpace: 20,
                barTouchData: BarTouchData(enabled: true),
                barGroups: data.map((data) => BarChartGroupData(
                  barsSpace: 4,
                  
                  x: data.id!,
                barRods: [
                  
                  BarChartRodData(
                    
                    toY: double.parse(data.attendndence.toString(),),
                    width: 13,
                    color: data.color,
                    

                    borderRadius: BorderRadius.only(topLeft: Radius.circular(6.r,),topRight: Radius.circular(6.r))
                    
                    )
                ])).toList()
              )

            ))
            
            
          ],
        ),
      ),
    );
  }
}