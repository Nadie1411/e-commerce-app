import 'package:e_commerce/API%20Model/API%20Data/Response/GetCartResponse.dart';
import 'package:e_commerce/Home/cart_screen/Cubit/cart_screen_view_model.dart';
import 'package:e_commerce/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartContainer extends StatelessWidget {
  GetProductCart productCart;

  CartContainer({required this.productCart});

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
                productCart.product?.imageCover ?? '',
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
                        productCart.product?.title ?? '',
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
                        'EGP ${productCart.price}',
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
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: AppColors.grayColor, width: 2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            int counter = productCart.count!.toInt();
                            counter--;
                            CartScreenViewModel.get(context).updateCountInCart(
                                productCart.product?.id ?? '', counter);
                          },
                          icon: Icon(
                            Icons.remove_circle_outline_rounded,
                            color: AppColors.whiteColor,
                            size: 20.sp,
                          )),
                      Text(
                        productCart.count.toString(),
                        style: TextStyle(
                            fontSize: 14.sp,
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                      IconButton(
                          onPressed: () {
                            int counter = productCart.count!.toInt();
                            counter++;
                            CartScreenViewModel.get(context).updateCountInCart(
                                productCart.product?.id ?? '', counter);
                          },
                          icon: Icon(
                            Icons.add_circle_outline_rounded,
                            color: AppColors.whiteColor,
                            size: 20.sp,
                          )),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 10.w,
                child: IconButton(
                    onPressed: () {
                      //todo delete product
                      CartScreenViewModel.get(context)
                          .deleteItemFromCart(productCart.product?.id ?? '');
                    },
                    icon: Icon(
                      Icons.delete_outline,
                      color: AppColors.darkBlue,
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
