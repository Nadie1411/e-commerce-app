import 'package:e_commerce/themes/app_colors.dart';
import 'package:e_commerce/themes/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Home/HomeTab_ViewModel/Response/CategoryResponse.dart';

class CategoryOrBrandItem extends StatelessWidget {
  //todo CategoryOrBrandItem model
  CategoryOrBrand categoryOrBrand;

  CategoryOrBrandItem({required this.categoryOrBrand});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 8,
            //cachedNetworkImage

            child: CircleAvatar(
              backgroundImage: NetworkImage((categoryOrBrand.image ?? '')),
              radius: 50.r,
            )),
        SizedBox(
          height: 8.h,
        ),
        Expanded(
            flex: 2,
            child: Text(
              categoryOrBrand.name ?? '',
              textWidthBasis: TextWidthBasis.longestLine,
              textAlign: TextAlign.center,
              style: AppFonts.appFont.bodySmall!.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal),
            ))
      ],
    );
  }
}
