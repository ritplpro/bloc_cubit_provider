
import 'package:bloc_cubit_provider/bloc_cubit/modal_bloc.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class BlocDataBase{

  BlocDataBase._();


  static final BlocDataBase  BlocDaBase=BlocDataBase._();

  static const String Table_Name="notebloc";
  static const String Table_ID="note_id";
  static const String Table_Title="note_title";
  static const String Table_desc="note_desc";


Database? myData;

 createDataBase() async {
  if(myData!= null){
    return myData;
  }else{
    var myData=await initdataBase();
    return await myData;
  }
}

  initdataBase() async {
   var path=await getApplicationDocumentsDirectory();
   var actualpath=join(path.path,"notebloc.db");
   return await openDatabase(actualpath,version: 1,onCreate: (BlocDaBase,version){
     BlocDaBase.execute("create table  $Table_Name ( $Table_ID integer "
         "primary key autoincrement,$Table_Title text,$Table_desc text)");

   });
  }
//insert data

    AddDatabase({required BlocModal insertData}) async {
   var adata=await createDataBase();
  var check= adata.insert(Table_Name,insertData.toMap());
  return check;

}
//fetch Data

FetchDatabase() async {
   var data=await createDataBase();
   var fetchall=await data.query(Table_Name);
   List<BlocModal> bData=[];

   for(Map<String,dynamic> eachModal in fetchall){
     var getdata=BlocModal.fromMap(eachModal);
     bData.add(getdata);
   }
   return bData;
}

//update data

 updateDatabase({required BlocModal updatedb}) async {
   var getdb=await createDataBase();
  var check =getdb.update(Table_Name,updatedb.toMap(),where:"$Table_ID = "
      "${updatedb.id}");
  return check ;
}

//delete data

 deleteData({required int id}) async {
   var deldata=await createDataBase();
   var check = deldata.delete(Table_Name,where:"$Table_ID = ?" ,
       whereArgs:['$id']);
   return check;


}



}