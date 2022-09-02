import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/list_cubit.dart';
import '../cubit/list_state.dart';

class TestView extends StatelessWidget {
  const TestView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: BlocConsumer<ListCubit, ListState>(
              listener: (context, state) {},
              builder: (context, state) {
                final listCubit = context.read<ListCubit>();
                return ListTile(
                  onTap: () => listCubit.select(index),
                  title: Text(
                    "Text$index",
                    style: TextStyle(
                        color: index == state.index ? Colors.deepOrange : null),
                  ),
                  tileColor: index == state.index ? Colors.red : null,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
