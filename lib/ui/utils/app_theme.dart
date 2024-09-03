import 'package:ecommerce_app/ui/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/*
const => بكتبها لو انا عارفة القيمة بتاعتها وقت  compile time 
final => لو انا مش عارفة القيمة بتاعتها الا وقت run time
----
MediaQuery => use it to fit on all screen sizes on height or width
height of screen = 870
height of app bar = 157
ratio of mediaQuery = 157 / 870 = 0.18
*/
class AppTheme {
  static ThemeData mainTheme = ThemeData(
    // brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.primaryColor,

    // // styling all screens with app bar on the theme
    // appBarTheme: AppBarTheme(
    //   backgroundColor: AppColors.primaryColor,
    //   elevation: 0,
    //   // toolbarHeight: 130
    // ),

    textTheme: TextTheme(
        bodyLarge: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: AppColors.whiteColor,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: AppColors.whiteColor,
        ),
        bodySmall: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: AppColors.whiteColor,
        ),
        // displaySmall: GoogleFonts.inter(
        //     fontSize: 17, fontWeight: FontWeight.w400, color: Colors.grey)
            ),

    // // styling the navigation bar
    // bottomNavigationBarTheme: BottomNavigationBarThemeData(
    //     selectedItemColor: AppColors.primaryColor,
    //     unselectedItemColor: AppColors.greyColor,
    //     showUnselectedLabels: false,
    //     backgroundColor: Colors.transparent,
    //     elevation: 0),

    // // styling the bottom sheet
    // bottomSheetTheme: BottomSheetThemeData(
    //     shape: RoundedRectangleBorder(
    //   borderRadius: BorderRadius.only(
    //       topLeft: Radius.circular(15), topRight: Radius.circular(15)),
    // )),
  );
}
