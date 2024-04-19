import 'package:bloc_cubit_provider/bloc_cubit/cubit.dart';
import 'package:bloc_cubit_provider/bloc_cubit/cubit_state.dart';
import 'package:bloc_cubit_provider/bloc_cubit/modal_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  bool isUpdate ;
  BlocModal? blockModal;
  SecondPage({this.isUpdate=false,this.blockModal});

  var titlecontroller=TextEditingController();
  var subtitlecontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    if(blockModal != null){
      titlecontroller.text=blockModal!.title;
      subtitlecontroller.text=blockModal!.desc;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Cubit Note"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          children: [
            Text(isUpdate ? "Update Note": "Add Note",
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Enter Title"),
              ],
            ),
            SizedBox(height: 10),
            TextField(
                autofocus: true,
                controller:titlecontroller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23)
                    )
                )

            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Enter Subtitle"),
              ],
            ),
            SizedBox(height: 10),
            TextField(
                autofocus: true,
                controller:subtitlecontroller,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(23)
                    )
                )

            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  if(isUpdate!=false){
                   context.read<NoteCubitProvider>().addDatabloc(
                            newmodal: BlocModal(
                                title: titlecontroller.text.toString(),
                                desc: subtitlecontroller.text.toString()));
                        Navigator.pop(context);
                      }else{
                    context.read<NoteCubitProvider>().updatedBloc(updatenote: BlocModal(
                        title:titlecontroller.text.toString(),
                        id: blockModal!.id,
                        desc:subtitlecontroller.text.toString()));
                    Navigator.pop(context);
                  }




                    }, child: Text(isUpdate ? "Update Note": "Add Note")),
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("Cancel")),
              ],
            ),




          ],
        ),
      ),
    );
  }
}
