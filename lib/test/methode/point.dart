
 String greatpoint(double?  number){

    String point="";
   

    if(number!=null){
      if(number <0 ||number>100){
      point="Out Of number";

    }
    else if(number>=30  && number<40 ){
      point="1.00";
    }else if(number>=40 && number<50){
      point ="2.00";
    }else if(number>=50  && number<59 ){
      point="3.00";
    }else if(number>=60 && number<70){
      point ="3.5";
    }else if(number>=70  && number<80 ){
      point="4.00";
    }else if(number>=80 && number<=100){
      point ="5.0";
    }
    else if(number<30){
      point="0.00";
    }
    
    else{
      number=10;
    }

    }
    
    
    
    return point;
  }
