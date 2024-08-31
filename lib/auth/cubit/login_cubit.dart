import 'package:e_commerce/API%20Model/api_manager.dart';
import 'package:e_commerce/auth/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit(): super(LoginInitialState());

  var emailController =
  TextEditingController(text:  "nadeen1411@gmail.com");

  var passwordController =
  TextEditingController(text: 'nadeen@12322');

  var formKey = GlobalKey<FormState>();

  bool isObscure = false;


  //todo: hold data handle Logic
   void login() async
   {
     if(formKey.currentState?.validate() == true)
       {
         try{

           emit(LoginloadingState());
           var response = await ApiManager.Login(emailController.text, passwordController.text);
           if(response.statusMsg == 'fail')
             {
               emit(LoginErrorState(errorMessage: response.message!));
             }
           else
             {
               emit(LoginSuccessState(response: response));
             }

         }
         catch(e)
         {
           emit(LoginErrorState(errorMessage: e.toString()));

         }
       }
   }



}