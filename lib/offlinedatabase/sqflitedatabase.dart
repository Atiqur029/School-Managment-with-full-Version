

import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:schollapp/offlinedatabase/modeloflinedatabase/notice.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBhelper{

  DBhelper._private();
  static final DBhelper instence=DBhelper._private();

  static Database?_database;

  Future<Database?> get db async{
    if(_database!=null){
      return _database;
    }
    _database=await initDatabase();

    return _database;
  }
  
  Future<Database>initDatabase()  async{
    Directory directory=await getApplicationDocumentsDirectory();
    String path=join(directory.path,"notice.db");
    var opendata=await openDatabase(path,version: 1,onCreate: _onCreate);
    return opendata;
    


  }



  FutureOr<void> _onCreate(Database db, int version) async{
    await db.execute('''
     
     CREATE TABLE test(id INTEGER PRIMARY KEY AUTOINCREMENT,text TEXT)


 ''');
    
  }

  Future<int> insertData({required Notice notice}) async{
    Database?database=await db;
    return await database!.insert("test", notice.toMap());
  }

  Future <List<Notice>?> getData() async{
     Database?database=await db;

     var data=await database!.query("test",orderBy: "id",columns: ["id","text"]);
     

     List<Notice> noticetlist=data.map((e) => Notice.fromMap(e)).toList();
     return noticetlist;
     


  }
  Future<int> delete(int id) async{
    Database?database=await db;
    var data=database!.delete("test",where: "id=?",whereArgs: [id] );
    return data;


  }

  Future<int> update(Notice contact,int id) async{
     Database?database=await db;
     
     var data=database!.update("test", contact.toMap(),where: "id=?",whereArgs: [id]);
     return data;


  }
}

