import 'package:alquran_app/app/routes/app_pages.dart';
import 'package:alquran_app/common/colors.dart';
import 'package:alquran_app/common/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  // Inisialisasi ThemeService menggunakan Get.put()
  await GetStorage.init();
  Get.put(ThemeService());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mengambil instance ThemeService yang diinisialisasi dengan Get.put()
    final ThemeService _themeService = Get.find<ThemeService>();
    final box = GetStorage();
print("membaca ${box.read('themeDark')} di main");
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: box.read('themeDark') == true ? themeDark : themeLight,
      darkTheme: themeDark,
      themeMode: box.read('themeDark') == true ? ThemeMode.dark : ThemeMode.light,
      title: "application",
      initialRoute: Routes.HOME,
      getPages: AppPages.routes,
    );
  }
}
