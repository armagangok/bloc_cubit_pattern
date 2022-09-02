import 'package:bloc_pattern/state_management/cubit/list_cubit.dart';
import 'package:bloc_pattern/state_management/view/test_view.dart';
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
      theme: ThemeData.dark().copyWith(),
      home: BlocProvider(
        create: (context) {
          return ListCubit();
        },
        child: TestView(),
      ),
    );
  }
}
