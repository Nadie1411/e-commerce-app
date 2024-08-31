import 'package:flutter/material.dart';
import 'package:e_commerce/themes/app_colors.dart';

class AddIcon extends StatelessWidget {






  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
          color: AppColors.primaryColor,),
        child: IconButton(
          onPressed: (){},
          icon:Icon(Icons.add,size: 30,color: AppColors.whiteColor,)
          ,
        ));
  }
}