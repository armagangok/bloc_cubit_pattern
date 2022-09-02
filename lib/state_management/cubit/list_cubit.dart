import 'package:flutter_bloc/flutter_bloc.dart';

import 'list_state.dart';

class ListCubit extends Cubit<ListState> {
  ListCubit() : super(ListState(-1));

  void select(int index) {
    emit(ListState(index));
  }
}
