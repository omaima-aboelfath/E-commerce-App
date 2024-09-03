import 'package:ecommerce_app/my_bloc_observer.dart';
import 'package:ecommerce_app/ui/auth/login/login_screen.dart';
import 'package:ecommerce_app/ui/auth/register/signup_screen.dart';
import 'package:ecommerce_app/ui/home/home_screen.dart';
import 'package:ecommerce_app/ui/splash/splash_screen.dart';
import 'package:ecommerce_app/ui/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/* 
splash screen:
1- native
2- package
3- normal screen
*/
void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932), // size of design
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: SplashScreen.routeName,
          theme: AppTheme.mainTheme,
          routes: {
            SplashScreen.routeName: (context) => SplashScreen(),
            LoginScreen.routeName: (context) => LoginScreen(),
            SignUpScreen.routeName: (context) => SignUpScreen(),
            HomeScreen.routeName: (context) => HomeScreen(),
          },
        );
      },
    );
  }
}

