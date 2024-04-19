

import 'package:bloc_cubit_provider/bloc_cubit/cubit_state.dart';
import 'package:bloc_cubit_provider/bloc_cubit/modal_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'database.dart';

class NoteCubitProvider extends Cubit<CubitState>{
  BlocDataBase  BlocDaBase;

  NoteCubitProvider({required this.BlocDaBase}):super(IntialState());

  //add data cubit

  addDatabloc({required BlocModal newmodal}) async {
    emit(LoadingState());
    var isAdded = await BlocDaBase.AddDatabase(insertData: newmodal);

    if(isAdded!=null){
      List<BlocModal> mData= await BlocDaBase.FetchDatabase();
      emit(LoadedState(allNotes: mData));
    }else{
      emit(ErrorState(errormsg: "No Notes avlaible"));
    }
  }
  //fetch cubit

  void initgetdata() async {
    emit(LoadingState());
   var mData= await BlocDaBase.FetchDatabase();
    emit(LoadedState(allNotes: mData));
  }

//delete cubit

  deleteBloc(int id) async {
    emit(LoadingState());
     var isdeleted= await BlocDaBase.deleteData(id: id);
     if(isdeleted!=null){
       var mData=await BlocDaBase.FetchDatabase();
       emit(LoadedState(allNotes: mData));
     }else{
       emit(ErrorState(errormsg: "error !not deleted!!"));
     }
  }

//updated cubit

  updatedBloc({required BlocModal updatenote}) async {
    emit(LoadingState());
    var isupdated=await BlocDaBase.updateDatabase(updatedb: updatenote);
    if(isupdated!=null){
      var mData=await BlocDaBase.FetchDatabase();
      emit(LoadedState(allNotes: mData));
    }else{
      emit(ErrorState(errormsg: "Note was Not Updated !!"));
    }
  }





  



}