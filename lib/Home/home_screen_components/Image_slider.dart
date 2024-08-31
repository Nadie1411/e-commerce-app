import 'package:e_commerce/Home/home_screen_components/categories.dart';
import 'package:e_commerce/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ImageSlider extends StatefulWidget {

  @override
  State<ImageSlider> createState() => _ImageSliderState();

}


class _ImageSliderState extends State<ImageSlider> {
  List <AssetImage> imageInfo= [
    AssetImage('assets/upto25%.png'),
    AssetImage('assets/upto25%.png'),
    AssetImage('assets/upto25%.png')
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 16.w ),
      child: Container(
        height: 200.h,
        width: 398.w,
        child: AnotherCarousel(
            images:imageInfo,boxFit: BoxFit.fill,
          dotSize: 5 ,
          indicatorBgPadding: 8.0,
          borderRadius:true ,
          radius: Radius.circular(15),
          noRadiusForIndicator: false,

          dotColor: AppColors.whiteColor,
          autoplayDuration: Duration(seconds: 2),
          dotIncreasedColor: AppColors.primaryColor,
          animationCurve: Easing.linear
          ,dotBgColor: Colors.transparent,


                ),
      ),
    );
  }
}
