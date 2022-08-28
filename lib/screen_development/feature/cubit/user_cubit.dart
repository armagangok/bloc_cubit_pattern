import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/reqres_model.dart';
import '../service/i_user_service.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.userService) : super(UserInitialState()) {
    pageNumber = 1;
  }

  final IUserService userService;
  late int pageNumber;

  Future<void> fetchUserItem() async {
    emit(UserLoadingState(isLoading: true));
    final items = await userService.fetchUserData(page: pageNumber);

    if (items.isEmpty) {
    } else {
      emit(UserItemsErrorState());
    }

    UserListItemState(items);
  }
}

abstract class UserState {
  Widget buildWidget() => const SizedBox();
}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {
  final bool isLoading;

  UserLoadingState({required this.isLoading});
}

class UserListItemState extends UserState {
  final List<Data> items;

  UserListItemState(this.items);
}

class UserErrorState extends UserState {
  UserErrorState();
}

class UserItemsErrorState extends UserState {
  UserItemsErrorState();
}

class UserCompletedState extends UserState {
  UserCompletedState();
}
