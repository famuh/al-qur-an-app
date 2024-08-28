import 'dart:ffi';

import 'package:alquran_app/app/routes/app_pages.dart';
import 'package:alquran_app/common/colors.dart';
import 'package:alquran_app/common/space.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/models/surah.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // if (Get.isDarkMode) {
    //   controller.isDark.value = true;
    // }
    return Scaffold(
        appBar: AppBar(
          title: const Text('Quran App'),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () => Get.toNamed(Routes.SEARCH),
                icon: const Icon(Icons.search))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                "Assalamualaikum",
                style:  TextStyle(
                  fontSize: 16,
                  color: appPurpleLight1
                  // fontWeight: FontWeight
                ),
              ),
               const Text(
                "Fadhil Muhammad",
                style:
                     const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, ),
              ),
              spaceH10,
              InkWell(
                onTap: (){
                  Get.defaultDialog(
                    content: const Text("belum diimplementasikan")
                  );
                },
                child: Container(
                  height: 120,
                  width: Get.width,
                  padding: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [appPurpleLight1, appPurpleDark])),
                  child: Stack(
                    children: [
                      Positioned(
                          bottom: -40,
                          right: -10,
                          child: SizedBox(
                            width: 140,
                            height: 140,
                            child: Image.asset(
                              'assets/images/alquran.png',
                              fit: BoxFit.contain,
                            ),
                          )),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.menu_book_outlined,
                                color: appWhite,
                              ),
                              spaceW10,
                              Text(
                                "Terakhir Dibaca",
                                style: TextStyle(color: appWhite),
                              )
                            ],
                          ),
                          spaceH10,
                          Text(
                            "Al-Fatihah",
                            style: TextStyle(color: appWhite, fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          spaceH10,
                          Text(
                            "Juz 1 | Ayat 5",
                            style: TextStyle(color: appWhite),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        )
        // FutureBuilder<List<Surah>>(
        //   future: controller.getAllSurah(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //     if (!snapshot.hasData) {
        //       return const Center(
        //         child: Text("Tidak ada data"),
        //       );
        //     }
        //     return ListView.builder(
        //       itemCount: snapshot.data?.length,
        //       itemBuilder: (context, index) {
        //         Surah surah = snapshot.data![index];
        //         return ListTile(
        //           leading: CircleAvatar(
        //             child: Text("${index + 1}"),
        //           ),
        //           title: Text(surah.name!.transliteration!.id),
        //           subtitle: Text(
        //               "${surah.numberOfVerses} Ayat | ${surah.revelation?.id.toString().split(".").last.capitalizeFirst}"),
        //           trailing: Text(surah.name!.short!),
        //           onTap: () {
        //             Get.toNamed(Routes.DETAIL_SURAH, arguments: surah);
        //           },
        //         );
        //       },
        //     );
        //   },
        // )

        );
  }
}
