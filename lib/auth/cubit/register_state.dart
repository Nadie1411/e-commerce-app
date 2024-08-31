import 'package:e_commerce/API%20Model/API%20Data/Response/RegisterResponse.dart';

abstract class RegisterStates{} //Poly Morphism

class RegisterInitialStates extends RegisterStates{}
class RegisterLoadingStates extends RegisterStates{}

class RegisterErrorStates extends RegisterStates{
  String errorMessage ;
  RegisterErrorStates({required this.errorMessage});
}

class RegisterSuccessStates extends RegisterStates{
  RegisterResponse response ;
  RegisterSuccessStates({ required this.response});
}

