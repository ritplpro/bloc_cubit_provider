
import 'package:bloc_cubit_provider/bloc_cubit/modal_bloc.dart';

abstract class CubitState{}

class IntialState extends CubitState{}

class LoadingState extends CubitState{}

class LoadedState extends CubitState{
  List<BlocModal> allNotes;
  LoadedState({required this.allNotes});
}

class ErrorState extends CubitState{
  String errormsg;
  ErrorState({required this.errormsg});
}



