import 'package:alquran_app/app/routes/app_pages.dart';
import 'package:alquran_app/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: themeLight,
    darkTheme: themeDark,
    title: "application",
    initialRoute: Routes.HOME,
    getPages: AppPages.routes,
  ));
}
