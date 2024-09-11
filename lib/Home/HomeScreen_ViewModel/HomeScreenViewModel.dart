import 'package:bloc/bloc.dart';
import 'package:e_commerce/API%20Model/API%20Data/Response/GetCartResponse.dart';
import 'package:e_commerce/Home/Account/account_screen.dart';
import 'package:e_commerce/Home/Cubit/HomeScreenStates.dart';
import 'package:e_commerce/Home/Favourite%20Tab/favourite_tab.dart';
import 'package:e_commerce/Home/Menu_tab/MenuTab.dart';
import 'package:e_commerce/Home/home_screen_tab.dart';
import 'package:flutter/material.dart';

class HomeScreenViewModel extends Cubit<HomeScreenState> {
  HomeScreenViewModel() : super(HomeScreenInitialState());
  GetProductCart productCart = GetProductCart();

  //todo: hold data - handle Logic
  int selectedIndex = 0;

  List<Widget> tabs = [
    HomeScreenTab(),
    MenuTab(),
    FavouriteTab(),
    AccountScreen()
  ];

  void changeSelectedIndex(int newIndex) {
    emit(HomeScreenInitialState());
    selectedIndex = newIndex; //new state
    emit(ChangeSelectedIndexState());
  }
}
