import 'package:e_commerce/data/add_Icon.dart';
import 'package:e_commerce/data/heart_icon.dart';
import 'package:e_commerce/data/star_icon.dart';
import 'package:e_commerce/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: 191.w,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.r),


    ),
      child: Padding(
        padding: EdgeInsets.all(5.h.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset('assets/shoe.png'),
                Positioned
                  (top: 5.h,
                    right: 5.w,
                    child: HeartIcon()),
        
              ],
        
            ),
        
            SizedBox(height: 8.h,),
        
            Expanded(
              child: InkWell( onTap: (){},
                  child: Text('Product Name',style: TextStyle(fontSize: 14.sp,color: AppColors.darkBlue),overflow: TextOverflow.ellipsis,textAlign: TextAlign.start,)),
            )
        
            ,SizedBox(height: 8.h,)
            ,Text('Price',style: TextStyle(fontSize: 14.sp,color: AppColors.darkBlue),overflow: TextOverflow.ellipsis,),
            Row(

                children: [
                  Text('Review (0.0)',
                    style: TextStyle(fontSize: 12.sp,color: AppColors.darkBlue),overflow: TextOverflow.ellipsis,),
                  StarIcon(),
                  SizedBox(width: 65.w,),

                  AddIcon(),
                ]
            ),
        
        
          ],
        
        
        
        ),
      ),
    );


  }
}


class MenuProductCard extends StatelessWidget {
  const MenuProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300.h,
      width: 191.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),


      ),
      child: Padding(
        padding: EdgeInsets.all(5.h.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset('assets/shoe.png'),
                Positioned
                  (top: 5.h,
                    right: 5.w,
                    child: HeartIcon()),

              ],

            ),

            SizedBox(height: 8.h,),

            InkWell( onTap: (){},
                child: Text('Product Name',style: TextStyle(fontSize: 14.sp,color: AppColors.darkBlue),overflow: TextOverflow.ellipsis,textAlign: TextAlign.start,))

            ,SizedBox(height: 8.h,)
            ,Text('Price',style: TextStyle(fontSize: 14.sp,color: AppColors.darkBlue),overflow: TextOverflow.ellipsis,),
            Row(

                children: [
                  Text('Review (0.0)',
                    style: TextStyle(fontSize: 12.sp,color: AppColors.darkBlue),overflow: TextOverflow.ellipsis,),
                  StarIcon(),
                  SizedBox(width: 81.w,),

                  AddIcon(),
                ]
            ),


          ],



        ),
      ),
    );
  }
}
