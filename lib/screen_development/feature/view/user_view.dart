import 'package:bloc_pattern/screen_development/product/exception/widget_not_found_exception.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../product/constant/app_constant.dart';
import '../cubit/user_cubit.dart';
import '../service/user_service.dart';

class UserView extends StatelessWidget {
  const UserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => UserCubit(
          UserService(AppConstant.instance.networkManager),
        ),
        child: BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(),
              body: buildBody(state),
            );
          },
        ),
      ),
    );
  }

  Widget buildBody(UserState state) {
    if (state is UserInitialState) {
      return Center(
        child: state.buildWidget(),
      );
    } else if (state is UserLoadingState) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is UserErrorState) {
      return const Center(child: Text("Something went wrong."));
    } else if (state is UserListItemState) {
      return Center(child: Text("${state.items.length}"));
    }

    throw WidgetNotFOundException<UserView>();
  }
}
