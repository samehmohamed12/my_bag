import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




ThemeData lightMode() => ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      actionsIconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 23,
      ),
      iconTheme: IconThemeData(color: Colors.black),
      backwardsCompatibility: false,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      contentPadding: const EdgeInsetsDirectional.only(top: 5, start: 20),
      hintStyle: const TextStyle(color: Colors.black),
    ),
    textTheme: const TextTheme(
        bodyText1: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w400, fontSize: 18)),
    bottomNavigationBarTheme:const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.amberAccent,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed));

ThemeData darkMode() => ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        actionsIconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 23,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
          statusBarColor: Colors.black,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      primarySwatch: Colors.red,
      scaffoldBackgroundColor: Colors.black,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        contentPadding: const EdgeInsetsDirectional.only(top: 5, start: 30),
        hintStyle: const TextStyle(color: Colors.white),
      ),
      textTheme: const TextTheme(
          bodyText1: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w400, fontSize: 15)),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor:Colors.black,
          selectedItemColor: Colors.amberAccent,
          unselectedItemColor: Colors.white,
          type: BottomNavigationBarType.fixed),
      iconTheme: const IconThemeData(color: Colors.white),
      primaryIconTheme: const IconThemeData(color: Colors.white),
    );
