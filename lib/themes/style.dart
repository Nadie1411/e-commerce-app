import 'package:e_commerce/themes/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Style
{
  static Image appLogo = new Image(
    image: new ExactAssetImage("assets/Route_white.png"));

  static Image smallAppLogo = new Image(
      image: new ExactAssetImage("assets/smallRoute_logo.png"));


  static var BottomNavigationBarTheme= BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryColor,
      showUnselectedLabels: false,
      backgroundColor: Colors.transparent,
      elevation: 0);

static final ThemeData theme = ThemeData(
  bottomNavigationBarTheme: BottomNavigationBarTheme= BottomNavigationBarThemeData(
      selectedItemColor: AppColors.primaryColor,
      showUnselectedLabels: false,
      backgroundColor: Colors.transparent,
      elevation: 0)
);
}