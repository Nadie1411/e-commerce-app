import 'package:e_commerce/Home/Cubit/HomeTabStates.dart';
import 'package:e_commerce/Home/HomeTab_ViewModel/homeTab_viewModel.dart';
import 'package:e_commerce/Home/home_screen_components/Image_slider.dart';
import 'package:e_commerce/Home/home_screen_components/Image_sliderSmall.dart';
import 'package:e_commerce/data/AppSearchBar.dart';
import 'package:e_commerce/data/CategoryOrBrandSection.dart';
import 'package:e_commerce/data/ProductListView.dart';
import 'package:e_commerce/data/RowCustomName.dart';
import 'package:e_commerce/themes/app_colors.dart';
import 'package:e_commerce/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreenTab extends StatefulWidget {
  @override
  State<HomeScreenTab> createState() => _HomeScreenTabState();
}

class _HomeScreenTabState extends State<HomeScreenTab> {
  HomeTabViewModel viewModel = HomeTabViewModel();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: AppColors.whiteColor,
       appBar : AppBar( toolbarHeight:140.h,
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.whiteColor,
        title:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Style.smallAppLogo,
            SizedBox(height: 18.h,),
            AppSearchBar(),
          ])),
      body: BlocBuilder<HomeTabViewModel, HomeTabState>(
        bloc: viewModel
          ..getAllCategories()
          ..getAllBrands(),
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageSlider(),

                SizedBox(
                  height: 8.h,
                ),
                RowCustomName(name: 'Categories'),
                SizedBox(
                  height: 16.h,
                ),
                state is HomeTabCategoryLoadingState
                    ? Center(
                        child: CircularProgressIndicator(
                        color: AppColors.primaryColor,
                      ))
                    : CategoryOrBrandSection(
                        list: viewModel.categoriesList ?? []),
                //viewModel.categoriesList.isEmpty? Center(child: CircularProgressIndicator(color: AppColors.primaryColor,)) : CategoryOrBrandSection(categoriesList:state.),

                SizedBox(height: 8.h,),
               RowCustomName(name: 'Brands',),
               SizedBox(height: 16.h,),
               state is HomeTabBrandLoadingState ? Center(
                   child: CircularProgressIndicator(
                     color: AppColors.primaryColor,)) : CategoryOrBrandSection(
                   list: viewModel.brandsList ?? []),

               SizedBox(height: 8.h,),
               RowCustomName(name: 'Home Appliance'),
               ProductListView(),

                SizedBox(height: 10.h),
                ImageSlidersmall(),

                SizedBox(height: 16.h),
                RowCustomName(name: 'New Arrival'),
                ProductListView(),

                SizedBox(height: 16.h),
               RowCustomName(name: 'Smart Watch'),
               ProductListView(),
             ],
           ),
          );
        },
      ),
    );
  }
}
