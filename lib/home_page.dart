import 'package:bloc_cubit_provider/bloc_cubit/cubit.dart';
import 'package:bloc_cubit_provider/bloc_cubit/cubit_state.dart';
import 'package:bloc_cubit_provider/bloc_cubit/modal_bloc.dart';
import 'package:bloc_cubit_provider/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class MyHomePage extends StatefulWidget {



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NoteCubitProvider>().initgetdata();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit provider"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body:BlocBuilder<NoteCubitProvider,CubitState>(
          builder: (context,state){
            if (state is LoadingState) {
              return Center(child: CircularProgressIndicator());
            }  else if(state is ErrorState){
              return Center(child: Text("${state.errormsg}"));
            }else if(state is LoadedState) {
              var  mData=state.allNotes;
              return mData.isNotEmpty ?ListView.builder(itemCount: mData.length,
                  itemBuilder:(context,index){
                return ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)
                    =>SecondPage(isUpdate: true,blockModal:mData[index])));

                  },
                  leading: Text('${index+1}'),
                  title: Text(mData[index].title),
                  subtitle: Text(mData[index].desc),
                  trailing: IconButton(onPressed: (){
                    context.read<NoteCubitProvider>().deleteBloc(mData[index].id);
                  },icon: Icon(Icons.delete),),
                );}): Center(child: Text('No notes avlaible'));
            }
            return Container();
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)
          =>SecondPage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
