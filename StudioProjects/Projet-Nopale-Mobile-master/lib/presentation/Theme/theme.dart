import 'package:flutter/material.dart';
import 'package:projet_nopale_mobile/constants/colors/app_colors.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: whiteColor,
      fontFamily: 'Muli',
      appBarTheme: appBarTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      inputDecorationTheme: inputDecorationTheme(),
      colorScheme: ThemeData().colorScheme.copyWith(
            primary: greenColor,
          ));
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: whiteColor,
    elevation: 0,
    iconTheme: IconThemeData(color: greenColor),
    titleTextStyle: TextStyle(color: Color(0XFF8B8B8B), fontSize: 18),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: textFieldGrayColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    // If  you are using latest version of flutter then lable text and hint text shown like this
    // if you r using flutter less then 1.20.* then maybe this is not working properly
    // if we are define our floatingLabelBehavior in our theme then it's not applayed
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}
