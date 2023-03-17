import 'package:schollapp/attendence/model/attendence.dart';
import 'package:schollapp/const/importent.dart';

class MonthHistory{

   addMonthHistory({required AttendenceModel model,required String classname,required String session})async{

    final historydatabse=firestore.collection("monthhisory").doc(session).collection(session).doc(classname).collection(classname).doc(model.month).collection(model.month!).doc();
     final  attendenseet=AttendenceModel(
      classname: classname,
      roll:model.value, 
      id: historydatabse.id,
      month: model.month,
      subject: model.subject,
      date: model.date,
      classtime: model.classtime,
      attendensetime: model.attendensetime,
      persentabsence: model.persentabsence


    );
    final map=attendenseet.toMap();
    await historydatabse.set(map);



   }
}