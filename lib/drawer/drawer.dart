






import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:schollapp/auth/signin.dart';
import 'package:schollapp/const/importent.dart';
import 'package:schollapp/drawer/anyissue.dart';
import 'package:schollapp/nextscrenn/nextscreen.dart';
import 'package:schollapp/page/home.dart';


import '../model/user.dart';
import 'notice/addnotice.dart';



class Drawersomething extends StatefulWidget {
  const Drawersomething({super.key});

  @override
  State<Drawersomething> createState() => _DrawersomethingState();
}

class _DrawersomethingState extends State<Drawersomething> {

  final signin=const Signin();



   String? name="";
   String? email="";
   String? imgs;
  User user=User();
   Future getdataFordatabase() async{

    await firestore.collection("users").doc(auth.currentUser!.uid).get()
    .then((snapshot)async{
      if(snapshot.exists){
        if(mounted)
        {
          setState(() {
             name= snapshot.data()!["name"];
          email=snapshot.data()!["email"];
          imgs=snapshot.data()!["img"];
            
          });
        }

        
          
          
        
        
         
          
        
        
          

     
      }

    });
   }


  @override
  void initState() {
  
    super.initState();
    getdataFordatabase();
  }



  

    
  
  @override
  Widget build(BuildContext context) {

    return Drawer(

      elevation: 0.0,
      child: Padding(padding: const EdgeInsets.only(top: 20,),
      
      child: ListView(
         shrinkWrap:true,
         children: [
           Container(
            height: 250,
            color: Colors.amber,
             child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             const  SizedBox(height: 20,),
        
              
              Container(
              height: 200,
              width: 130,
      
              decoration:  BoxDecoration(
                border: Border.all(color: Colors.purple),
                shape: BoxShape.circle,
                image: DecorationImage(image: imgs!=null?NetworkImage(imgs.toString()):const NetworkImage("https://gcp-img.slatic.net/lazada/35495d6c-3ee1-4e35-a590-ff63e1610f1b_BD-1920-350.jpg"),fit: BoxFit.cover,scale: 2.0)
              ),
              
              ),
              
              Text(name!,style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),)
      
              
             
      
               
             
             
          ],
        ),
           ),

           const Text("About",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.amber),),
           const SizedBox(height: 30,),

           Row(
            children: [
              const Icon(Icons.home),
              const SizedBox(width: 20,),
              InkWell(
                onTap: (() {
                  gotonextscreen(context,  const Homepage());
                  
                }),
                child: const Text("Home",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.brown),),
              )
            ],
           ),
          const  SizedBox(height: 20,),
          Row(
            children: [
              const Icon(Icons.error),
              const SizedBox(width: 20,),
              InkWell(
                onTap: (() {
                    gotonextscreen(context, const AnyIssueforadmin());
                  
                }),
                child: const Text("My Issues",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.brown),),
              )
            ],
           ),
           const  SizedBox(height: 20,),
          Row(
            children: [
              const Icon(Icons.notifications_active),
              const SizedBox(width: 20,),
              InkWell(
                onTap: (() {
                  gotonextscreen(context,  AddNotice());
                  
                }),
                child: const Text("Notice",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.brown),),
              )
            ],
           ),
           const SizedBox(height: 20,),
           InkWell(
            onTap: () async{
               await loggout();
              
            },
             child: Container(
              height: 40,
               color: Colors.red,
               child:  const Center(child: Text("Logg Out",style: TextStyle(color: Colors.white,fontSize: 15),)),
             ),
           )


         ],
         
        
        
      ),
      ),

      
      
        
      
      );
  }

  
   Future<void> loggout() async{
    await auth.signOut();
    Get.to(const Signin());

   }
}