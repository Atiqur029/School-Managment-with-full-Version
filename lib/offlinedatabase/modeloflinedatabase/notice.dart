
class Notice{
  int? id;
  String ?text;

  Notice({this.id, this.text});

  Map<String,dynamic>toMap()=>{

    "id":id,
    "text":text,
  };

  factory Notice.fromMap(Map<String,dynamic> data)=>Notice(id: data["id"],text: data["text"]);


}