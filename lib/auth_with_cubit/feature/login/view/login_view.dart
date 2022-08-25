import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/login_cubit.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final GlobalKey<FormState> formKey = GlobalKey();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        emailController,
        passwordController,
        formKey,
      ),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: _buildAppBar(),
            body: Form(
              key: formKey,
              autovalidateMode: autoValidate(state),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  emailField(state),
                  passwordField(),
                  loginButton(context),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  AutovalidateMode autoValidate(LoginState state) => state
          is LoginValidationState
      ? (state.isValid ? AutovalidateMode.always : AutovalidateMode.disabled)
      : AutovalidateMode.disabled;

  ElevatedButton loginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.read<LoginCubit>().login();
      },
      child: const Text("Login"),
    );
  }

  TextFormField passwordField() {
    return TextFormField(
      decoration: _decoration(),
      validator: (r) => (r ?? '').length > 5 ? null : 'Shorter then 5.',
      autovalidateMode: AutovalidateMode.disabled,
    );
  }

  TextFormField emailField(LoginState state) {
    return TextFormField(
      decoration: _decoration(),
      validator: (r) => (r ?? '').length > 5 ? null : 'Shorter then 5.',
    );
  }

  InputDecoration _decoration() =>
      const InputDecoration(border: OutlineInputBorder());

  AppBar _buildAppBar() => AppBar();
}
