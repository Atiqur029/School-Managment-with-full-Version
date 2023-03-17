import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:schollapp/model/product/addres.dart';
import 'package:schollapp/model/product/product.dart';
import 'package:schollapp/reusable/textform.dart';


class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  
  Product product=Product();
  Address address=Address();

  final _fromkey=GlobalKey<FormState>();
  final presentaddressControlar=TextEditingController();
  final permanentAddressControlar=TextEditingController();
  final nameCntrolar=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Add Product"),centerTitle: true,),body: Form(
      key: _fromkey,
      child: Padding(padding: const EdgeInsets.all(16),child: ListView(
        shrinkWrap: true,
        children: [
    
          const SizedBox(height: 20,),
          TextForm(
            hintText: "Name",controller: nameCntrolar,validator: (value) {
                if(value!.isEmpty ||value.length<2){
                  return "name isrequired fll at least 2 charecter";
                  //Get.snackbar("Name", "Fill up name at least 2 charecter",snackPosition: SnackPosition.BOTTOM);
                 }
                 return null;
                 
                 
                 
               },onSaved: (value) {
                nameCntrolar.text=value!;
              
                 
                }),
               
               const SizedBox(height: 20,),
               TextForm(hintText: "peresent Address",controller: presentaddressControlar,validator: (value) {
                if(value!.isEmpty ||value.length<2){
                  return "name isrequired fll at least 2 charecter";
                  //Get.snackbar("Name", "Fill up name at least 2 charecter",snackPosition: SnackPosition.BOTTOM);
                 }
                 return null;
                 
                 
               },onSaved: (value) {
                
                   presentaddressControlar.text=value!;

                 }),
               
               const SizedBox(height: 20,),

               TextForm(hintText: "Permanent Address",controller: permanentAddressControlar,validator: (value) {
                if(value!.isEmpty ||value.length<2){
                  return "name isrequired fll at least 2 charecter";
                  //Get.snackbar("Name", "Fill up name at least 2 charecter",snackPosition: SnackPosition.BOTTOM);
                 }
                 return null;
                 
                 
                },onSaved: (value) {
                  
                 permanentAddressControlar.text=value!;
                 
           
                 
               }),
               
               const SizedBox(height: 20,),
               ElevatedButton(onPressed: (() {

                
                  if(_fromkey.currentState!.validate()){
                   _fromkey.currentState!.save();
                  
                 
                  
                  
                  _fromkey.currentState!.reset();

                  
                
                  
                
                   
                
                  

                }
                Get.snackbar("Product","fail");
                
                _fromkey.currentState!.reset();

               
                 
               }), child: const Text("Save"))
    
        ],
      ),),
    ),);
  }
}