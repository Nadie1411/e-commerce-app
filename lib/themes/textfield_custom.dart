import 'package:e_commerce/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormfield extends StatefulWidget{
  String label;
  Widget suffixIcon;
  String hintText ;
  TextEditingController controller;
  TextInputType keyboardType;
  bool obscureText;
  String? Function(String?)? validator;

  CustomTextFormfield(
      {this.hintText ='' ,
        this.label = '',
        required this.controller,
        this.keyboardType = TextInputType.text,
        this.obscureText = false,
        required this.validator,
      this.suffixIcon = const Icon(Icons.edit_square, color:  Colors.white,)});

  @override
  State<CustomTextFormfield> createState() => _CustomTextFormfieldState();
}

class _CustomTextFormfieldState extends State<CustomTextFormfield> {
  @override
  Widget build(BuildContext context)
  {
    return
      TextFormField(
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
           hintText: widget.hintText ,
           labelText: widget.label,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.primaryColor))
                 ,
                filled: true,
                fillColor: AppColors.whiteColor,

            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: AppColors.primaryColor)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.red)),
            errorMaxLines: 4),
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        obscureText: widget.obscureText,
        validator: widget.validator,


      );



  }
}

