

class Address{

  String? presentaddress;
  String? permanentaddress;

  Address({ this.presentaddress,this.permanentaddress});

  Map<String,dynamic> toMap()=>{
    "presentaddress":presentaddress,
    "permanentaddress":permanentaddress



  };

  factory Address.fromMap(Map<dynamic,dynamic>data){
    return Address(presentaddress: data["presentaddress"],permanentaddress: data["permanentaddress"]);
  }

   setpermanentAddres(String address)=>permanentaddress=address;
   setpresentAddress(String  address)=>presentaddress=address;
   

  


}