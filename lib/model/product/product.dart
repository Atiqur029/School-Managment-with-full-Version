import 'package:schollapp/model/product/addres.dart';

class Product{

  String ?id;
  String ?name;
  Address?address;

  Product({this.id,this.name,this.address});
  Map<String,dynamic> toMap()=>{
    "id":id,
    "name":name,
    "address":address!.toMap()
    



  };
  factory Product.fromJson(Map<dynamic,dynamic>data){
    return Product(
      id: data["id"],
      name: data["name"],
      address: Address.fromMap(data["address"])
    
    
    );
  }


}