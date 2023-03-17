

  String greatesheet(int?  number){

    String grede="";
   

    if(number!=null){
      if(number <0 ||number>100){
      grede="Out Of Marks";

    }
    else if(number>=30  && number<40 ){
      grede="D";
    }else if(number>=40 && number<50){
      grede ="C";
    }else if(number>=50  && number<59 ){
      grede="B";
    }else if(number>=60 && number<70){
      grede ="A-";
    }else if(number>=70  && number<80 ){
      grede="A";
    }else if(number>=80 && number<=100){
      grede ="A+";
    }
    else if(number<30){
      grede="F";
    }
    
    else{
      number=10;
    }

    }
    
    
    
    return grede;
  }

  

