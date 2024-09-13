import 'package:alquran_app/common/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
    final box = GetStorage();


  final _isDarkMode = false.obs; // Obx works with Rx types

   get isDarkMode => _isDarkMode;

@override
  void onInit() {
    _isDarkMode.value = box.read('themeDark') ?? false;
    super.onInit();
  }

  void switchTheme() {
    _isDarkMode.value = !_isDarkMode.value;
    Get.changeTheme(_isDarkMode.value ? themeDark : themeLight);
    Get.changeThemeMode(_isDarkMode.value ? ThemeMode.dark : ThemeMode.light);

    final box = GetStorage();
    box.write('themeDark', _isDarkMode.value);
    print("mennulis ${_isDarkMode.value} ke lokal");
  }
 
}
