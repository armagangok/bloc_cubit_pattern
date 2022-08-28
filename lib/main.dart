import 'package:bloc_pattern/screen_development/feature/view/user_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit_fundamentals/cubit/cat_cubit.dart';
import 'cubit_fundamentals/repository/cat_repository.dart';

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
          return CatCubit(CatRepository());
        },
        child: const UserView(),
      ),
    );
  }
}
