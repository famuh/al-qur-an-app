import 'package:alquran_app/app/modules/settings/controllers/settings_controller.dart';
import 'package:alquran_app/app/routes/app_pages.dart';
import 'package:alquran_app/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  // Inisialisasi ThemeService menggunakan Get.put()
  await GetStorage.init();
  // Get.put(ThemeService());
  Get.put(SettingsController());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // inisiasi local storage
    final box = GetStorage();

    // Debugging untuk melihat nilai themeDark di GetStorage
    print("membaca ${box.read('themeDark')} di main");

      // Membaca nilai themeDark dari GetStorage dan menggunakan fallback value
    final bool isDarkMode = box.read('themeDark') ?? false;


    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? themeDark : themeLight,
      darkTheme: themeDark,
      
      themeMode:isDarkMode ? ThemeMode.dark : ThemeMode.light,
      title: "application",
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    );
  }
}
