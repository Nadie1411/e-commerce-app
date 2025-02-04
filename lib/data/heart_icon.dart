import 'package:e_commerce/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeartIcon extends StatefulWidget {


  @override
  State<HeartIcon> createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        backgroundColor: Colors.white,
        radius: 20,
        child: IconButton(onPressed: () {
        setState(() {
          isPressed = !isPressed; // Toggle the state on button press
        });

      },
          icon:
          ImageIcon(
              AssetImage
                (isPressed?
              'assets/heart filled.png'
                  :
               'assets/Vector.png'), size: 25.r,
              color:AppColors.primaryColor

    )
      )
    );
  }
}