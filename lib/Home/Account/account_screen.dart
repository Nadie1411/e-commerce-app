import 'package:e_commerce/Home/HomeScreen.dart';
import 'package:e_commerce/auth/register.dart';
import 'package:e_commerce/themes/app_colors.dart';
import 'package:e_commerce/themes/app_fonts.dart';
import 'package:e_commerce/themes/style.dart';
import 'package:e_commerce/themes/textfield_custom.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {

  static const String routeName = "account_Screen";

  @override
  State<AccountScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<AccountScreen> {
  TextEditingController nameController =
  TextEditingController();

  TextEditingController passwordController =
  TextEditingController();

  TextEditingController numberController =
  TextEditingController();

  TextEditingController emailController =
  TextEditingController();

  TextEditingController addressController =
  TextEditingController();

  TextEditingController mobileController =
  TextEditingController();


  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        automaticallyImplyLeading: false
        ,
        title: Style.smallAppLogo,) ,



      body:
      Padding(
        padding: const EdgeInsets.all(12.0),

        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
            
              children: [
                Text("Welcome Back",style: AppFonts.appFont.bodyMedium!.copyWith(color: AppColors.darkBlue)),
                Text("insert email",style: AppFonts.appFont.bodySmall!.copyWith(color: AppColors.purpleColor),textAlign: TextAlign.left,),
            SizedBox(height: MediaQuery.of(context).size.height*0.030),
            
                Text("Your Full name", style: AppFonts.appFont.bodyMedium!.copyWith( fontWeight: FontWeight.w500, fontSize: 18,color: AppColors.darkBlue),),

                SizedBox(height: MediaQuery.of(context).size.height*0.010),
            
                SizedBox(
                    height: 80,
                  child: CustomTextFormfield(
                    label:"full name" ,
                      controller: nameController,
                      suffixIcon: IconButton(onPressed: (){}, icon: ImageIcon(AssetImage('assets/edit_icon.png'),color: AppColors.darkBlue)),
                      validator: (text){
                    if (text == null || text.trim().isEmpty){
                      return 'Please Enter Your Full Name';
                     }
                    return null; }
                  ),
                ),
            
            SizedBox(height: MediaQuery.of(context).size.height*0.010),
            
                Text("Your E-mail", style: AppFonts.appFont.bodyMedium!.copyWith( fontWeight: FontWeight.w500, fontSize: 18,color: AppColors.darkBlue),),
                SizedBox(height: MediaQuery.of(context).size.height*0.010),
                SizedBox(
                  height: 80,
                  child: CustomTextFormfield(
                      label:"e-mail" ,
                      suffixIcon: IconButton(onPressed: (){}, icon: ImageIcon(AssetImage('assets/edit_icon.png'),color: AppColors.darkBlue)),
                      controller: emailController,
                      validator: (text){
                        if (text == null || text.trim().isEmpty){
                          return 'Please Enter Your E-mail';
                        }
                        return null; }
                  ),
                ),
            
            
                SizedBox(height: MediaQuery.of(context).size.height*0.010),
            
                Text("Password", style: AppFonts.appFont.bodyMedium!.copyWith( fontWeight: FontWeight.w500, fontSize: 18, color: AppColors.darkBlue),),
                SizedBox(height: MediaQuery.of(context).size.height*0.010),
                SizedBox(
                    height: 80,
                  child: CustomTextFormfield(
                      label:"enter your password" ,
                      suffixIcon: IconButton(onPressed: (){}, icon: ImageIcon(AssetImage('assets/edit_icon.png'),color: AppColors.darkBlue)),
                      controller: passwordController,
                      obscureText: true,
                      validator: (text){
                        if (text == null || text.trim().isEmpty){
                          return 'Please Enter Password';
                        }
                        return null; }
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.010),
                Text("Your mobile number", style: AppFonts.appFont.bodyMedium!.copyWith( fontWeight: FontWeight.w500, fontSize: 18,color: AppColors.darkBlue),),
                SizedBox(height: MediaQuery.of(context).size.height*0.010),
                SizedBox(
                  height: 80,
                  child: CustomTextFormfield(
                      label:"Your mobile number" ,
                      keyboardType: TextInputType.number,
                      suffixIcon: IconButton(onPressed: (){}, icon: ImageIcon(AssetImage('assets/edit_icon.png'),color: AppColors.darkBlue,)) ,
                      controller: mobileController,
                      validator: (text){
                        if (text == null || text.trim().isEmpty){
                          return 'Please Enter Your mobile number';
                        }
                        return null; }
                  ),
                ),
            
                SizedBox(height: MediaQuery.of(context).size.height*0.010),
                Text("Your Address", style: AppFonts.appFont.bodyMedium!.copyWith( fontWeight: FontWeight.w500, fontSize: 18,color: AppColors.darkBlue),),
                SizedBox(height: MediaQuery.of(context).size.height*0.010),
            
                SizedBox(
                  height: 80,
                  child: CustomTextFormfield(
                      label:"Your address" ,
                      keyboardType:TextInputType.streetAddress,
                      suffixIcon: IconButton(onPressed: (){}, icon: ImageIcon(AssetImage('assets/edit_icon.png'),color: AppColors.darkBlue)),
                      controller: addressController,
                      validator: (text){
                        if (text == null || text.trim().isEmpty){
                          return 'Please Enter Your Address';
                        }
                        return null; }
                  ),
                ),
            
            
            
            
            
              ],
            ),
          ),
        ),
      )

    );
  }
}
