import 'package:bloc_pattern/cubit/cat_cubit.dart';
import 'package:bloc_pattern/repository/cat_repository.dart';
import 'package:bloc_pattern/view/cat_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: BlocProvider(
        create: (context) {
          return CatCubit(CatRepository());
        },
        child: const CatView(),
      ),
    );
  }
}
