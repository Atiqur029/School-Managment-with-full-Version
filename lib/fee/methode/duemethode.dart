



 String due(double  fee,  double paid){
  
  double dues=0;
  dues=  fee - paid;
  
  String duesnumber="";

  duesnumber =dues.toString();

  
  if(dues==0){
    duesnumber="0";
    
  }
  
  return duesnumber;
  

  

  

   
}