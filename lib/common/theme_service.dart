import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeService {
  final _isDarkMode = false.obs; // Obx works with Rx types

  bool get isDarkMode => _isDarkMode.value;

  void switchTheme() {
    _isDarkMode.value = !_isDarkMode.value;
    Get.changeThemeMode(_isDarkMode.value ? ThemeMode.dark : ThemeMode.light);

    final box = GetStorage();
    box.write('themeDark', _isDarkMode.value);
    print("mennulis ${_isDarkMode.value} ke lokal");

    // if (_isDarkMode.value == true) {
    //   // dark > light
    //   box.remove('themeDark');
    // }else{
    //   // light > dark
    //   box.write('themeDark', true);
    // }
  }
}
