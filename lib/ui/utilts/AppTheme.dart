import 'package:flutter/material.dart';
import 'package:todo/ui/utilts/app_colors.dart';

abstract class AppTheme {
  static const TextStyle appBarTextStyle =TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: AppColors.white);
  static const TextStyle taskTitleTextStyle =TextStyle(fontWeight: FontWeight.bold,fontSize: 22,color: AppColors.primary);
  static const TextStyle taskDescriptionTextStyle =TextStyle(fontWeight: FontWeight.normal,fontSize: 14,color: AppColors.black);
  static const TextStyle bottomSheetTitleTextStyle =TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: AppColors.accentDark);

  static ThemeData lightTheme = ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor:AppColors.accent ,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          shape: StadiumBorder(side: BorderSide(color: AppColors.white,width: 4))
      ),
      appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primary,
        elevation: 0,
        titleTextStyle: appBarTextStyle,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        unselectedIconTheme: IconThemeData(size: 32),
          selectedIconTheme: IconThemeData(size: 32),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.gray,
          ),
    dividerTheme: DividerThemeData(thickness: 3,color: AppColors.primary)
      );
  static ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primaryDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryDark,
      elevation: 0,
      titleTextStyle: appBarTextStyle,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedIconTheme: IconThemeData(size: 32),
      selectedIconTheme: IconThemeData(size: 32),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.gray,
    ),
  );
}
