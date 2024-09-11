import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:e_commerce/Home/Cubit/HomeScreenStates.dart';
import 'package:e_commerce/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'HomeScreen_ViewModel/HomeScreenViewModel.dart';

class HomeScreen extends StatefulWidget {
   static const String routeName= 'home_Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenViewModel viewModel = HomeScreenViewModel();

  var searchController = TextEditingController();

  List<String> iconPath = [
     'assets/home_icon.png',
     'assets/menu_icon.png',
     'assets/Frame 79.png',
     'assets/Frame 80.png'];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenViewModel, HomeScreenState>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          body: viewModel.tabs[viewModel.selectedIndex], bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: iconPath.length,
            tabBuilder: (int index, bool isActive) {
              final color = isActive ? AppColors.whiteColor : AppColors
                  .whiteColor;
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageIcon(
                    AssetImage(iconPath[index]),
                    color: color,
                    size: 40,
                  ),
                ],
              );
            },
            backgroundColor: AppColors.primaryColor,
            activeIndex: viewModel.selectedIndex,
            splashColor: AppColors.whiteColor,
            notchSmoothness: NotchSmoothness.smoothEdge,
            gapLocation: GapLocation.center,
            // Optional: center or none
            leftCornerRadius: 32,
            rightCornerRadius: 32,
            gapWidth: MediaQuery
                .of(context)
                .size
                .width * 0.01,
            onTap: (index) {
              viewModel.changeSelectedIndex(index);
            }
        ),);
      },
    );
  }
}
