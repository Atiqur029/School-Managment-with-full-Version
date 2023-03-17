import 'package:schollapp/attendence/model/attendence.dart';
import 'package:schollapp/const/importent.dart';

class AttendenceDatabase{
  
  addAttendenceDatabase({required AttendenceModel model,required String classname,required String sesson})async{

    final  attendence=firestore.collection("Attendence").doc(sesson).collection(sesson).doc(classname).collection(classname).doc();
    
    final  attendenseet=AttendenceModel(
      classname: classname,
      roll:model.value, 
      id: attendence.id,
      month: model.month,
      subject: model.subject,
      date: model.date,
      classtime: model.classtime,
      attendensetime: model.attendensetime,
      persentabsence: model.persentabsence


    );
    final map=attendenseet.toMap();
    await attendence.set(map);
  }
  updateAttendence(AttendenceModel model,{required String session,required String classname})async{

   final  attendence=firestore.collection("Attendence").doc(session).collection(session).doc(classname).collection(classname).doc();
    
    final  attendenseet=AttendenceModel(
      id: attendence.id,
      month: model.month,
      subject: model.subject,
      date: model.date,
      classtime: model.classtime,
      attendensetime: model.attendensetime,
      persentabsence: model.persentabsence


    );
    final map=attendenseet.toMap();
    await attendence.update(map);
  }
  deleteAttendence({required AttendenceModel model,required String classname,required String sesson})async{
    await firestore.collection("Attendence").doc(sesson).collection(sesson).doc(classname).collection(classname).doc(model.id).delete();
     //await firestore.collection(model.value!).doc(model.id).delete();

  }


}