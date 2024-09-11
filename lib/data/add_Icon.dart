import 'package:e_commerce/themes/app_colors.dart';
import 'package:flutter/material.dart';

class AddIcon extends StatelessWidget {






  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Colors.white,
        radius: 15,
        child: IconButton(
          onPressed: (){},
          icon: Icon(
            Icons.add,
            size: 20,
            color: AppColors.whiteColor,
          ),
        ));
  }
}