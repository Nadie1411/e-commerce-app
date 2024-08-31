import 'package:e_commerce/API%20Model/API%20Data/Response/LoginResponse.dart';

abstract class LoginStates{}
class LoginInitialState extends LoginStates {}
class LoginSuccessState extends LoginStates {
  LoginResponse response;
  LoginSuccessState({required this.response});

}
class LoginErrorState extends LoginStates {
  String errorMessage ;
  LoginErrorState({required this.errorMessage});
}

class LoginloadingState extends LoginStates {}