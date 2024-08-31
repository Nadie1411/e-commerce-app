import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StarIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: (){},
      icon: ImageIcon(AssetImage('assets/star.png'),color: Colors.amberAccent, ));
  }
}
