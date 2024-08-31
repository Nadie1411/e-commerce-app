import 'package:e_commerce/Home/Account/account_screen.dart';
import 'package:e_commerce/Home/Menu_tab/MenuTab.dart';
import 'package:e_commerce/Home/home_screen_tab.dart';
import 'package:e_commerce/auth/login.dart';
import 'package:e_commerce/themes/app_colors.dart';
import 'package:e_commerce/themes/style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
class HomeScreen extends StatefulWidget {
   static const String routeName= 'home_Screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int selectedIndex=0;

   TextEditingController searchConterllor = TextEditingController();

   List<String> iconPath = [
     'assets/home_icon.png',
     'assets/menu_icon.png',
     'assets/Frame 79.png',
     'assets/Frame 80.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body:
         selectedIndex == 0? HomeScreenTab() : selectedIndex == 1?  MenuTab() : selectedIndex == 3 ? AccountScreen() : HomeScreen()







    ,bottomNavigationBar: AnimatedBottomNavigationBar.builder(
    itemCount:iconPath.length ,
    tabBuilder: (int index, bool isActive) {
    final color = isActive ? AppColors.whiteColor : AppColors.whiteColor;

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
      activeIndex: selectedIndex,
      splashColor: AppColors.whiteColor,
      notchSmoothness: NotchSmoothness.smoothEdge,
      gapLocation: GapLocation.center, // Optional: center or none
      leftCornerRadius: 32,
      rightCornerRadius: 32,
      gapWidth: MediaQuery.of(context).size.width*0.01,
      onTap: (index){
      setState(() => selectedIndex = index);}

    ),
    );

  }
}
