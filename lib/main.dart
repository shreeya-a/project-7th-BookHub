import 'package:flutter/material.dart';
import 'package:project_7th_bookhub/Config/Themes.dart';
import 'package:project_7th_bookhub/Screens/WelcomeScreen/WelcomeScreen.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'BookHub',
      // theme: lightTheme,
      home:  WelcomeScreen(),
    );
  }
}

