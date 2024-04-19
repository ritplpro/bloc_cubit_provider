import 'package:bloc_cubit_provider/bloc_cubit/cubit.dart';
import 'package:bloc_cubit_provider/bloc_cubit/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

import 'home_page.dart';

void main() {
  runApp(BlocProvider(create: (context)=>NoteCubitProvider(BlocDaBase:
  BlocDataBase.BlocDaBase),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home:  MyHomePage(),
    );
  }
}
