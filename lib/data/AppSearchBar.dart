import 'package:e_commerce/Home/Menu_tab/Product_ViewModel/product_ViewModel.dart';
import 'package:e_commerce/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSearchBar extends StatefulWidget {
  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  ProductViewModel viewModel = ProductViewModel();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
                labelText: "what do you search for?",
                labelStyle: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w300,
                    color: AppColors.purpleColor),
                prefixIcon: ImageIcon(
                  AssetImage('assets/icon _search_.png'),
                  color: AppColors.primaryColor,
                  size: 24.sp,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                )),
          ),
        ),
        InkWell(
          onTap: () {
            //todo : navigate to cart
          },
          child: Badge(
            label: Text(viewModel.numOfCartItem.toString()),
            child: Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.primaryColor,
            ),
          ),
        )
      ],
    );
  }
}
