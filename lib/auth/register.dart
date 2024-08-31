import 'package:e_commerce/Home/HomeScreen.dart';
import 'package:e_commerce/auth/cubit/register_cubit.dart';
import 'package:e_commerce/auth/cubit/register_state.dart';
import 'package:e_commerce/auth/register.dart';
import 'package:e_commerce/data/dialouge_utils.dart';
import 'package:e_commerce/themes/app_colors.dart';
import 'package:e_commerce/themes/app_fonts.dart';
import 'package:e_commerce/themes/style.dart';
import 'package:e_commerce/themes/textfield_custom.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatefulWidget {

  static const String routeName = "register_Screen";

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  RegisterCubit cubit = RegisterCubit();




  @override
  Widget build(BuildContext context) {

    return BlocListener<RegisterCubit , RegisterStates>(

      bloc: cubit,
      listener : (context , state) {
        if (state is RegisterLoadingStates) {
          DialogeUtils.showLoading(context: context, loadingLabel: 'Loading');
        }
        else if (state is RegisterErrorStates) {
          DialogeUtils.hideLoading(context);
          DialogeUtils.showMessage(context: context,
              content: state.errorMessage,
              posActionName: 'ok',
              title: 'Error');
        }
        else if (state is RegisterSuccessStates) {
          DialogeUtils.hideLoading(context);
          DialogeUtils.showMessage(context: context,
              content: 'Register Successfully',
              posActionName: 'ok',
              title: 'Success');
        }
      } ,
          child: Scaffold(
              backgroundColor:AppColors.primaryColor,
              appBar: AppBar(
                toolbarHeight: MediaQuery.of(context).size.height*0.15,
                title: Style.appLogo,
                centerTitle: true,
                backgroundColor: AppColors.primaryColor
                ,
              ),
              body: Padding(
                padding: const EdgeInsets.all(12.0),

                child: Form(
                  key: cubit.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,

                      children: [

                        Text("Full Name", style: AppFonts.appFont.bodyMedium!.copyWith( fontWeight: FontWeight.w500, fontSize: 18),),
                        SizedBox(height: MediaQuery.of(context).size.height*0.025),

                        SizedBox(
                          height: 80,
                          child: CustomTextFormfield(
                              label:"enter your full name" ,
                              controller: cubit.nameController,
                              validator: (text){
                                if (text == null || text.trim().isEmpty){
                                  return 'Please Enter User Name';
                                }
                                return null; }
                          ),
                        ),

                        SizedBox(height: MediaQuery.of(context).size.height*0.015),
                        Text("Mobile Number", style: AppFonts.appFont.bodyMedium!.copyWith( fontWeight: FontWeight.w500, fontSize: 18),),

                        SizedBox(height: MediaQuery.of(context).size.height*0.025),
                        SizedBox(
                          height: 80,
                          child: CustomTextFormfield(
                              label:"enter your mobile no." ,
                              controller:cubit.phoneController ,
                              validator: (text){
                                if (text == null || text.trim().isEmpty){
                                  return 'Please Enter Mobile Number';
                                }
                                return null; },
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: cubit.isObscure,




                              
                          ),
                          
                          
                        ),

                        SizedBox(height: MediaQuery.of(context).size.height*0.015),
                        Text("E-mail address", style: AppFonts.appFont.bodyMedium!.copyWith( fontWeight: FontWeight.w500, fontSize: 18),),
                        SizedBox(height: MediaQuery.of(context).size.height*0.025),

                        SizedBox(
                          height: 80,
                          child: CustomTextFormfield(
                              label:"enter your email address." ,
                              controller:cubit.emailController ,
                              validator: (text){
                                if (text == null || text.trim().isEmpty){
                                  return 'Please Enter Email';
                                }
                                return null; }
                          ),
                        ),

                        SizedBox(height: MediaQuery.of(context).size.height*0.015),

                        Text("Password", style: AppFonts.appFont.bodyMedium!.copyWith( fontWeight: FontWeight.w500, fontSize: 18),),
                        SizedBox(height: MediaQuery.of(context).size.height*0.025),
                        SizedBox(
                          height: 80,
                          width: double.infinity,
                          child: CustomTextFormfield(
                              label:"enter your password" ,
                              controller:cubit.passwordController,
                              obscureText: cubit.isObscure,
                              validator: (text){
                                if (text == null || text.trim().isEmpty){
                                  return 'Please Enter Password';
                                }
                                return null; },
                              suffixIcon: InkWell(

                                child: cubit.isObscure ? Icon(Icons.visibility_off_outlined) :Icon(Icons.visibility_outlined)   ,
                                onTap: (){
                                  if( cubit.isObscure)
                                  {
                                    cubit.isObscure = false ;
                                  }
                                  else
                                    {
                                      cubit.isObscure = true ;

                                    }
    setState(() {

    });

                                },
                              )
                          ),
                        ),


                        SizedBox(height: MediaQuery.of(context).size.height*0.015),

                        Text("Confirm Password", style: AppFonts.appFont.bodyMedium!.copyWith( fontWeight: FontWeight.w500, fontSize: 18),),
                        SizedBox(height: MediaQuery.of(context).size.height*0.025),
                        SizedBox(
                          height: 80,
                          width: double.infinity,
                          child: CustomTextFormfield(
                              label:"enter your Confirm password" ,
                              controller: cubit.rePasswordController,
                              obscureText: cubit.isObscure,

                              validator: (text){
                                if (text == null || text.trim().isEmpty){
                                  return 'Please Enter Confirm Password';
                                }
                                return null; },
                              suffixIcon: InkWell(

                          child: cubit.isObscure ? Icon(Icons.visibility_off_outlined) :Icon(Icons.visibility_outlined)   ,
                    onTap: () {
                      if (cubit.isObscure) {
                        cubit.isObscure = false;
                      }
                      else {
                        cubit.isObscure = true;
                      }
                      setState(() {

                      });
                    })
                ),
                        ),

                        SizedBox(height: MediaQuery.of(context).size.height*0.040),
                        SizedBox(height: 64,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15),)),
                              onPressed: ()
                              {
                                cubit.register();
                              },
                              child: Text("Sign up",style: AppFonts.appFont.bodyMedium!.copyWith(fontSize: 18,color: AppColors.primaryColor))),
                        ),






                      ],
                    ),
                  ),
                ),
              )

          )
        ,
    );
  }
}
