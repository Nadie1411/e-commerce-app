import 'package:bloc/bloc.dart';
import 'package:e_commerce/API%20Model/api_manager.dart';
import 'package:e_commerce/auth/cubit/register_state.dart';
import 'package:flutter/cupertino.dart';
class RegisterCubit extends Cubit<RegisterStates>  //
    {
  RegisterCubit() : super(RegisterInitialStates());

  //todo: hold data - handle logic
  var nameController =
  TextEditingController(text: 'nadeen');

  var passwordController =
  TextEditingController(text: 'nadeen@12322');

  var rePasswordController =
  TextEditingController(text: 'nadeen@12322');


  var phoneController =
  TextEditingController(text: "01010700701");

  var emailController =
  TextEditingController(text: "nadeen1411@gmail.com");

  var formKey = GlobalKey<FormState>();

  bool isObscure = false;

  void register() async
  {
    if (formKey.currentState?.validate() == true) {
      try {
        emit(RegisterLoadingStates());

        var response = await ApiManager.register(
            nameController.text, emailController.text, passwordController.text,
            rePasswordController.text, phoneController.text);
        if (response.statusMsg == 'fail') {
          emit(RegisterErrorStates(errorMessage: response.message!));
        }
        else {
          emit(RegisterSuccessStates(response: response));
        }
      }
      catch (e) {
        emit(RegisterErrorStates(errorMessage: e.toString()));
      }
    }
  }
}