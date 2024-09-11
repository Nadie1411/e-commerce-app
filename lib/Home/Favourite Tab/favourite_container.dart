import 'package:e_commerce/API%20Model/API%20Data/Response/GetWishlistResponse.dart';
import 'package:e_commerce/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Wishlist View Model/wishlist_view_model.dart';

class FavouriteContainer extends StatelessWidget {
  GetWishlistData wishList;

  //Product product;

  FavouriteContainer({required this.wishList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
      child: Container(
        height: 113.h,
        width: 398.w,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.grayColor, width: 1),
            borderRadius: BorderRadius.circular(15.r)),
        child: Container(
          height: 113.h,
          width: 120.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(color: AppColors.grayColor, width: 1)),
          child: Stack(
            children: [
              Image.network(
                wishList.imageCover ?? '',
                alignment: Alignment.centerLeft,
              ),
              Positioned(
                left: 70.w,
                child: SizedBox(
                  width: 200.w,
                  height: 113.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        wishList.title ?? '',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkBlue),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        'EGP ${wishList.price}',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.darkBlue),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 12.h,
                right: 10.w,
                child: Container(
                    height: 42.h,
                    width: 122.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(20.r),
                      border: Border.all(color: AppColors.grayColor, width: 2),
                    ),
                    child: Text(
                      'Add to cart',
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.whiteColor),
                      textAlign: TextAlign.center,
                    )),
              ),
              Positioned(
                right: 10.w,
                child: IconButton(
                    onPressed: () {
                      //todo delete product

                      WishListViewModel.get(context)
                          .deleteItemFromWishlist(wishList.id ?? '');
                    },
                    icon: Icon(
                      Icons.favorite,
                      color: AppColors.primaryColor,
                      size: 20.sp,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
