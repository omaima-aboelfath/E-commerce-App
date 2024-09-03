import 'dart:async';

import 'package:ecommerce_app/ui/auth/login/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = 'splash_screen';
  @override
  Widget build(BuildContext context) {
    Timer // or  Future.delayed
    (Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
    });
    return Scaffold(
      body: Image.asset(
        'assets/SplashScreen.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}
