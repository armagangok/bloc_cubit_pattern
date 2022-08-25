// ignore_for_file: avoid_renaming_method_parameters

import 'package:bloc_pattern/model/cat_model.dart';
import 'package:flutter/foundation.dart';

abstract class CatState {
  const CatState();
}

class CatInitial extends CatState {
  const CatInitial();
}

class CatLoading extends CatState {
  const CatLoading();
}

class CatCompleted extends CatState {
  final List<CatModel> response;
  const CatCompleted(this.response);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is CatCompleted && listEquals(o.response, response);
  }

  @override
  int get hashCode => response.hashCode;
}

class CatError extends CatState {
  final String message;

  const CatError(this.message);
}
