import 'package:bloc_cubit_provider/bloc_cubit/database.dart';

class BlocModal{
  int id;
  String title;
  String desc;

  BlocModal({this.id=0,required this.title,required this.desc});

  factory BlocModal.fromMap(Map<String,dynamic> map){
    return BlocModal(id: map[BlocDataBase.Table_ID],
        title:map[BlocDataBase.Table_Title],
        desc:map[BlocDataBase.Table_desc]);
  }


  Map<String,dynamic> toMap(){
    return {
      BlocDataBase.Table_Title:title,
      BlocDataBase.Table_desc:desc
    };
  }



}