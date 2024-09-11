import 'dart:io';

import 'package:e_commerce/Home/Favourite%20Tab/Wishlist%20View%20Model/wishlist_view_model.dart';
import 'package:e_commerce/Home/HomeScreen.dart';
import 'package:e_commerce/Home/Menu_tab/Product_ViewModel/product_ViewModel.dart';
import 'package:e_commerce/Home/cart_screen/Cubit/cart_screen_view_model.dart';
import 'package:e_commerce/Home/cart_screen/cart_screen.dart';
import 'package:e_commerce/SplashScreen/splash_screen.dart';
import 'package:e_commerce/auth/login.dart';
import 'package:e_commerce/auth/register.dart';
import 'package:e_commerce/bloc_observer.dart';
import 'package:e_commerce/data/utils/shared_preference_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Home/Menu_tab/Product Details/product_details_tab.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  Bloc.observer = MyBlocObserver();
  await SharedPreferenceUtils.init();
  var token = SharedPreferenceUtils.getData(key: 'token');
  String route;
  if (token == null) {
    route = LoginScreen.routeName;
  } else {
    route = HomeScreen.routeName;
  }
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductViewModel(),
        ),
        BlocProvider(
          create: (context) => CartScreenViewModel(),
        ),
        BlocProvider(
          create: (context) => WishListViewModel(),
        )
      ],
      child: Ecommerce(
        route: route,
      )));
}

class Ecommerce extends StatelessWidget {
  String route;

  Ecommerce({required this.route});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child)
      {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: route,
          routes: {
            LoginScreen.routeName: (context) => LoginScreen(),
            RegisterScreen.routeName: (context) => RegisterScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
            SplashScreen.routeName: (context) => SplashScreen(),
            ProductDetailsTab.routeName: (context) => ProductDetailsTab(),
            CartScreen.routeName: (context) => CartScreen(),
          },
        );

      },

    );
  }

}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
