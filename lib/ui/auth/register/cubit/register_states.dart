import 'package:ecommerce_app/data/model/response/RegisterResponse.dart';

abstract class RegisterStates {} // parent class of state, abstract => no one can create object from it

// ploymorphism
class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterErrorState extends RegisterStates {
  String errorMessage;
  RegisterErrorState({required this.errorMessage});
}

class RegisterSuccessState extends RegisterStates {
  RegisterResponse response;
  RegisterSuccessState({required this.response});
}
