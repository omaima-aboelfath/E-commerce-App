import 'package:ecommerce_app/data/api_manager.dart';
import 'package:ecommerce_app/ui/auth/register/cubit/register_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());
  //todo: hold data - handle logic
  // String errorMessage; //////
  var formKey = GlobalKey<FormState>(); // to access data in form
  TextEditingController nameController = TextEditingController(text: 'omaima');

  TextEditingController passwordController =
      TextEditingController(text: '123456');

  TextEditingController confirmPasswordController =
      TextEditingController(text: '123456');

  TextEditingController emailController =
      TextEditingController(text: 'omaima@gmail.com');

  TextEditingController phoneController =
      TextEditingController(text: '01098805331');
  bool isObscure = true;
  void register() async {
    if (formKey.currentState!.validate() == true){
      try {
      emit(RegisterLoadingState());
      var response = await ApiManager.register(
          emailController.text,
          nameController.text,
          phoneController.text,
          passwordController.text,
          confirmPasswordController.text);
      if (response.statusMsg == 'fail') {
        emit(RegisterErrorState(errorMessage: response.message!));
      } else {
        emit(RegisterSuccessState(response: response));
      }
    } catch (e) {
      emit(RegisterErrorState(errorMessage: e.toString()));
    }
    }
  }
}
