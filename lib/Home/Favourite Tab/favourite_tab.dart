import 'package:e_commerce/Home/Favourite%20Tab/Wishlist%20View%20Model/cubit/wishlist_states.dart';
import 'package:e_commerce/Home/Favourite%20Tab/Wishlist%20View%20Model/wishlist_view_model.dart';
import 'package:e_commerce/Home/Favourite%20Tab/favourite_container.dart';
import 'package:e_commerce/data/AppSearchBar.dart';
import 'package:e_commerce/themes/app_colors.dart';
import 'package:e_commerce/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavouriteTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishListViewModel, WishlistStates>(
      bloc: WishListViewModel()..getWishlistItems(),
      builder: (context, state) {
        return Scaffold(
            backgroundColor: AppColors.whiteColor,
            appBar: AppBar(
                toolbarHeight: 140.h,
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.whiteColor,
                title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Style.smallAppLogo,
                      SizedBox(
                        height: 18.h,
                      ),
                      AppSearchBar(),
                    ])),
            body: Column(
              children: [
                state is WishlistSuccuessState
                    ? Expanded(
                        child: ListView.builder(
                            itemCount: state.response.data!.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return FavouriteContainer(
                                wishList: state.response.data![index],
                              );
                            }),
                      )
                    : Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ),
                      )
              ],
            ));
      },
    );
  }
}
