


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeService {
  final _isDarkMode = false.obs; // Obx works with Rx types

  bool get isDarkMode => _isDarkMode.value;

  void switchTheme() {
    _isDarkMode.value = !_isDarkMode.value;
    Get.changeThemeMode(_isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}
