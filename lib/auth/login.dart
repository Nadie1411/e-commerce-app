import 'package:e_commerce/Home/HomeScreen.dart';
import 'package:e_commerce/auth/cubit/login_cubit.dart';
import 'package:e_commerce/auth/cubit/login_states.dart';
import 'package:e_commerce/auth/register.dart';
import 'package:e_commerce/data/utils/dialouge_utils.dart';
import 'package:e_commerce/data/utils/shared_preference_utils.dart';
import 'package:e_commerce/themes/app_colors.dart';
import 'package:e_commerce/themes/app_fonts.dart';
import 'package:e_commerce/themes/style.dart';
import 'package:e_commerce/themes/textfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {

  static const String routeName = "login_Screen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginCubit cubit = LoginCubit(); 


  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit , LoginStates>(
      bloc: cubit,
      listener: (context , state){
        if(state is LoginloadingState)
          {
             DialogeUtils.showLoading(context: context, loadingLabel: 'Waiting...');
          }
        else if(state is LoginErrorState)
          {
            DialogeUtils.hideLoading(context);
            DialogeUtils.showMessage(context: context, content: state.errorMessage, posActionName: 'ok' , title: 'Error');

          }

        else if(state is LoginSuccessState)
          {
            DialogeUtils.hideLoading(context);
            DialogeUtils.showMessage(context: context, content: 'Login Successfully', posActionName: 'ok', title: 'Success');
          //todo: save token
          SharedPreferenceUtils.saveData(
              key: 'token', value: state.response.token);
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        }



      },
      child: Scaffold(
        backgroundColor:AppColors.primaryColor,
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height*0.20,
          title: Style.appLogo,
          centerTitle: true,
          backgroundColor: AppColors.primaryColor
          ,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
      
          child: Form(
            key: cubit.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
      
                children: [
                  Text("Welcome Back To Route",style: AppFonts.appFont.bodyMedium),
                  Text("Please sign in with your mail",style: AppFonts.appFont.bodySmall,textAlign: TextAlign.left,),
              SizedBox(height: MediaQuery.of(context).size.height*0.030),
      
      
                  Text("Email", style: AppFonts.appFont.bodyMedium!.copyWith( fontWeight: FontWeight.w500, fontSize: 18),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.025),
      
                  SizedBox(
                      height: 80,
                    child: CustomTextFormfield(
                      label:"enter your email" ,
                        controller:cubit.emailController,
                        validator: (text){
                      if (text == null || text.trim().isEmpty){
                        return 'Please Enter User Name';
                       }
                      return null; }
                    ),
                  ),
      
              SizedBox(height: MediaQuery.of(context).size.height*0.015),
      
                  Text("Password", style: AppFonts.appFont.bodyMedium!.copyWith( fontWeight: FontWeight.w500, fontSize: 18),),
                  SizedBox(height: MediaQuery.of(context).size.height*0.025),
                  SizedBox(
                      height: 80,
                    child: CustomTextFormfield(
                        label:"enter your password" ,
                        controller: cubit.passwordController,
                        obscureText: cubit.isObscure,
                        validator: (text){
                          if (text == null || text.trim().isEmpty){
                            return 'Please Enter Password';
                          }
                          return null; },
                            suffixIcon: InkWell(
      
                        child:cubit. isObscure ? Icon(Icons.visibility_off_outlined) :Icon(Icons.visibility_outlined)   ,
                               onTap: () {
                            if (cubit.isObscure) {
                              cubit. isObscure = false;
                               }
                              else {
                              cubit. isObscure = true;
                              }
                                     setState(() {});}),
                    ),),
      
              SizedBox(height: MediaQuery.of(context).size.height*0.040),
                  SizedBox(height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),)),
                        onPressed: ()
                        {
                          cubit.login() ;

                            Navigator.of(context).pushNamed(HomeScreen.routeName);}
                        ,
                        child: Text("Login",style: AppFonts.appFont.bodyMedium!.copyWith(fontSize: 18,color: AppColors.primaryColor))),
                  ),
      
              SizedBox(height: MediaQuery.of(context).size.height*0.020)
      
                  ,TextButton(
                      onPressed: (){
      
                        Navigator.of(context).pushReplacementNamed(RegisterScreen.routeName);},
      
                      child: Text("Don't have an account? Create Account",style: AppFonts.appFont.bodyMedium!.copyWith(fontSize: 15)))
      
      
      
      
      
        ],
              ),
            ),
          ),
        )
      
      ),
    );
  }
}
