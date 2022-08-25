
import 'package:flutter_bloc/flutter_bloc.dart';


import '../model/network_error_model.dart';
import '../repository/cat_repository.dart';
import 'cat_state.dart';

class CatCubit extends Cubit<CatState> {
  CatCubit(this._catRepository) : super(const CatInitial());

  final CatRepository _catRepository;

  Future<void> getCats() async {
    try {
      emit(const CatLoading());
      await Future.delayed(const Duration(seconds: 3));
      final response = await _catRepository.getCats();
      emit(CatCompleted(response));
    } on NetworkError catch (error) {
      emit(CatError(error.message));
    }
  }
}
