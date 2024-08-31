import 'package:e_commerce/themes/app_colors.dart';
import 'package:e_commerce/themes/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 348.w,
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 24.07.w),
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25.r),
          border: Border.all(color: AppColors.primaryColor)

      ),
      child: Row(
        children: [
          ImageIcon(AssetImage('assets/icon _search_.png'), color: AppColors.primaryColor,size: 24.sp,),
          SizedBox(width: 11.36.w,),
          Text('what do you search for?',style: AppFonts.appFont.bodyMedium!.copyWith(fontSize: 14.sp,fontWeight: FontWeight.w200,color: AppColors.purpleColor),)
        ],
      ),
    );
  }
}