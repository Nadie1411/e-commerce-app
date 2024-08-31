import 'dart:async';

import 'package:e_commerce/auth/login.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName= 'splash_Screen';

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3),(){Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);});
    return Scaffold(
      body:
      Image.asset(
         'assets/Splash_Screen.png',
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,)


    );
  }
}
