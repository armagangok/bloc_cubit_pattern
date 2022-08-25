import 'package:bloc_pattern/cubit/cat_cubit.dart';
import 'package:bloc_pattern/cubit/cat_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatView extends StatelessWidget {
  const CatView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      floatingActionButton: getCatsButton(),
    );
  }

  Widget getCatsButton() {
    return Builder(builder: (context) {
      return TextButton(
        onPressed: () async {
          await context.read<CatCubit>().getCats();
        },
        child: const Text("Get my cats!"),
      );
    });
  }

  Widget buildBody() {
    return BlocConsumer<CatCubit, CatState>(
      listener: (context, state) {
        if (state is CatError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is CatInitial) {
          return buildCatInitial();
        } else if (state is CatLoading) {
          return buildCatLoading();
        } else if (state is CatCompleted) {
          return buildCatListView(state);
        } else {
          return buildError(state);
        }
      },
    );
  }

  Text buildError(CatState state) {
    final error = state as CatError;
    return Text(error.message);
  }

  ListView buildCatListView(CatCompleted state) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      addAutomaticKeepAlives: false,
      addRepaintBoundaries: false,
      itemCount: state.response.length,
      itemBuilder: (context, index) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.network(state.response[index].imageUrl!),
                Text(state.response[index].description!)
              ],
            ),
          ),
        ],
      ),
    );
  }

  Center buildCatLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Center buildCatInitial() {
    return const Center(
      child: Text("Hello Cat!"),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      title: const Text("Cubit Cats!"),
    );
  }
}
