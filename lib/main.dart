import 'package:alquran_app/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    title: "application",
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
  ));
}
