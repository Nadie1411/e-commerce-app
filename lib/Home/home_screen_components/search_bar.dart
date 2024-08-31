import 'package:e_commerce/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AppSearchBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return TextField(

      decoration: InputDecoration(
          labelText: "what do you search for?",
          prefixIcon:Icon(Icons.search_rounded, color: AppColors.primaryColor,) ,
          suffix: Icon(Icons.shopping_cart_outlined),

          enabledBorder: OutlineInputBorder(

            borderRadius: BorderRadius.circular(120),
            borderSide: BorderSide(color: AppColors.primaryColor, width: 1,style: BorderStyle.solid),




          )
      ),
    );
  }
}
