import 'package:advanced_flutter_reexam/screens/home/view/home_screen.dart';
import 'package:advanced_flutter_reexam/screens/last/view/last_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/',page: () => HomeScreen()),
        GetPage(name: '/last',page: () => LastScreen()),
      ],
    ),
  );
}