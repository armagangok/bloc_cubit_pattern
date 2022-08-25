import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  bool isLoginFailed = false;

  LoginCubit(
    this.emailController,
    this.passwordController,
    this.formKey,
  ) : super(LoginInitial());

  void login() {
    if (formKey.currentState?.validate() ?? false) {
      //TODO service request
    } else {
      isLoginFailed = true;
      LoginValidationState(isLoginFailed);
      emit(LoginValidationState(isLoginFailed));
    }
  }
}

abstract class LoginState {}

class LoginInitial extends LoginState {
  LoginInitial();
}

class LoginValidationState extends LoginState{
  bool isValid;

    LoginValidationState(this.isValid);
}
