import 'package:alquran_app/common/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferensi Pengguna'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: 50,
          child: LiteRollingSwitch(
            //initial value
            value: Get.isDarkMode ? true : false,
            textOn: '',
            textOff: '',
            colorOn: const Color.fromARGB(255, 216, 167, 6),
            colorOff: appPurpleDark,
            iconOn: Icons.sunny,
            iconOff: Icons.nightlight_sharp,
            // textOffColor: Colors.black,
            // textSize: 16.0,
            width: 90,
            onTap: () {},
            onDoubleTap: () {},
            onSwipe: () {},
            onChanged: (bool state) {
              //Use it to manage the different states
              print('Current State of SWITCH IS: $state');
              Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
            },
          ),
        ),
      ),
    );
  }
}
