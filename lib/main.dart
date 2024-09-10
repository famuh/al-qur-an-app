import 'package:alquran_app/app/routes/app_pages.dart';
import 'package:alquran_app/common/colors.dart';
import 'package:alquran_app/common/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  // Inisialisasi ThemeService menggunakan Get.put()
  Get.put(ThemeService());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil instance ThemeService yang diinisialisasi dengan Get.put()
    final ThemeService _themeService = Get.find<ThemeService>();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeLight,
      darkTheme: themeDark,
      themeMode: _themeService.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      title: "application",
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    );
  }
}
