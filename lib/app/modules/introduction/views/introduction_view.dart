import 'package:alquran_app/app/routes/app_pages.dart';
import 'package:alquran_app/common/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../controllers/introduction_controller.dart';

class IntroductionView extends GetView<IntroductionController> {
  const IntroductionView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Al-Qur'an App",
              style:  TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 10,),
             const Text(
              "Bacalah al-qur'an setiap hari",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Lottie.asset('assets/lotties/quran-lottie.json', width: 300),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: appOrange
              ),
              onPressed: () => Get.offAllNamed(Routes.HOME), child: const Text("GET STARTED"))
        
          ],
        ),
      ),
    );
  }
}
