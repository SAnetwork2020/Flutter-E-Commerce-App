import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData theme(){
  return ThemeData(
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: inputDecorationTheme()
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: const BorderSide(color: kTextColor),
      gapPadding: 10,
      );
  return InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 42, vertical: 20,
      ),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}
TextTheme textTheme() {
  return const TextTheme(
    bodyLarge: TextStyle(color: kTextColor),
    bodyMedium: TextStyle(color: kTextColor),
  );
}
AppBarTheme appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: const IconThemeData(color:Colors.black),
    // systemOverlayStyle: SystemUiOverlayStyle.dark,
    toolbarTextStyle: const TextTheme(titleLarge: TextStyle(fontSize: 16, color: Color(0xff8B8B8B))).bodyMedium,
    titleTextStyle: const TextTheme(titleLarge: TextStyle(fontSize: 16, color: Color(0xff8B8B8B))).titleLarge,
  );
}