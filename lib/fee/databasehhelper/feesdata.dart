 import 'package:get/get.dart';
import 'package:schollapp/const/importent.dart';
import 'package:schollapp/fee/model/duemodel.dart';

import '../model/fees.dart';

class FeesData{
   adddfees({ required Fees fees,required String  roll,required String  classes,required String name,required String img, required String session}){
    
     var feesdata=firestore.collection("fees").doc(session).collection(session).doc("feesdata").collection(classes).doc(classes).collection(roll).doc();


     var addedmodel=Fees(
      id:feesdata.id,
      classes: classes,
      name: name,
      roll: roll,
      monthyear: fees.monthyear,
      feedate: fees.feedate,
      img:img,
      amount: fees.amount,
      paid: fees.paid,
      feesname: fees.feesname

     );

     var json=addedmodel.toMap();
     try{
      feesdata.set(json);
      Get.snackbar(" AddSubmit", "Sucessfully",snackPosition: SnackPosition.BOTTOM);


     }catch(e){
       Get.snackbar("Submit", "Error is :$e",snackPosition: SnackPosition.BOTTOM);

     }
     

   }


   duefees({ required Duemodel model,required String  roll,required String  classes,required String name,required double due,required String session}){
    
     var duedata=firestore.collection("fees").doc(session).collection(session).doc("duefees").collection(classes).doc(classes).collection( roll).doc();


     var addedmodel=Duemodel(
      id:duedata.id,
      classes: classes,
      name: name,
      roll: roll,
      due: due,
      monthofdate: model.monthofdate,
      feesname: model.feesname,
      amount: model.amount,
      payment: model.payment
      

     );

     var json=addedmodel.toMap();
     try{
       duedata.set(json);
        Get.snackbar(" Adddue", "Sucessfully",snackPosition: SnackPosition.BOTTOM);

     }catch(e){

       Get.snackbar(" Adddue", "Error is:$e",snackPosition: SnackPosition.BOTTOM);
     }
    

   }
 }