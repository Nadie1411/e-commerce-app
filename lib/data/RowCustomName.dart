import 'package:e_commerce/themes/app_colors.dart';
import 'package:e_commerce/themes/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RowCustomName extends StatelessWidget {
  String name;

  RowCustomName({required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$name',
              style: AppFonts.appFont.bodyMedium!
                  .copyWith(color: AppColors.primaryColor, fontSize: 18.sp)),
          TextButton(
              onPressed: () {},
              child: Text('View all',
                  style: AppFonts.appFont.bodySmall!.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold)))
        ],
      ),
    );
  }
}
