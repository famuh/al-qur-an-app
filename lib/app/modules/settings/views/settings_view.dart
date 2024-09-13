import 'package:alquran_app/common/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({super.key});
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
            child: Obx(
              () => LiteRollingSwitch(
                //initial value
                value: controller.isDarkMode.value,
                textOn: '',
                textOff: '',
                colorOn: const Color.fromARGB(255, 216, 167, 6),
                colorOff: appPurple,
                iconOn: Icons.sunny,
                iconOff: Icons.nightlight_sharp,
                width: 90,
                onTap: () {},
                onDoubleTap: () {},
                onSwipe: () {},
                onChanged: (bool state) {
                  print('Current State of SWITCH IS: $state');
                  controller.switchTheme();
                },
              ),
            )),
      ),
    );
  }
}
