import 'package:ecommerce_app/data/api_manager.dart';
import 'package:ecommerce_app/ui/auth/login/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState()); // constructor of child
  //todo: hold data - handle logic
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscure = true;
  var formKey = GlobalKey<FormState>();
  void login() async {
    if (formKey.currentState?.validate() == true) {
      try {
        emit(LoginLoadingState());
        var response = await ApiManager.login(
            emailController.text, passwordController.text);
        if (response.statusMsg == 'fail') {
          emit(LoginErrorState(errorMessage: response.message!));
          print('Message: ${response.message}');
        } else {
          emit(LoginSuccessState(response: response));
          print('Message: ${response.token}');
        }
      } catch (e) {
        emit(LoginErrorState(errorMessage: e.toString()));
      }
    }
  }
}
