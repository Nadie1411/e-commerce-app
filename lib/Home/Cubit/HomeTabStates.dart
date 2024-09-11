import 'package:e_commerce/Home/HomeTab_ViewModel/Response/CategoryResponse.dart';

abstract class HomeTabState {}

class HomeTabInitialState extends HomeTabState {}

//Categories
class HomeTabCategoryLoadingState extends HomeTabState {}

class HomeTabCategoryErrorState extends HomeTabState {
  String errorMessage;

  HomeTabCategoryErrorState({required this.errorMessage});
}

class HomeTabCategorySuccessState extends HomeTabState {
  CategoryOrBrandResponse categoryResponse;

  HomeTabCategorySuccessState({required this.categoryResponse});
}

//Brands
class HomeTabBrandLoadingState extends HomeTabState {}

class HomeTabBrandErrorState extends HomeTabState {
  String errorMessage;

  HomeTabBrandErrorState({required this.errorMessage});
}

class HomeTabBrandSuccessState extends HomeTabState {
  CategoryOrBrandResponse categoryResponse;

  HomeTabBrandSuccessState({required this.categoryResponse});
}
