import 'dart:ffi';

import 'package:alquran_app/app/routes/app_pages.dart';
import 'package:alquran_app/common/colors.dart';
import 'package:alquran_app/common/space.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

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
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () {
                      Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        body: DefaultTabController(
          length: 3,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Assalamualaikum",
                  style: TextStyle(
                      fontSize: 16,
                      color: appPurpleLight1,
                      fontWeight: FontWeight.w500),
                ),
                const Text(
                  "Fadhil Muhammad",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                spaceH10,
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.LAST_READ);
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
                              style: TextStyle(
                                  color: appWhite,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
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
                ),
                spaceH10,
                TabBar(
                    dividerColor: Colors.transparent,
                    unselectedLabelColor: appPurpleLight2,
                    labelColor: Get.isDarkMode ? appOrange : appPurpleDark,
                    tabs: [
                      const Tab(
                        child: Text("Surah"),
                      ),
                      const Tab(
                        child: Text("Juz"),
                      ),
                      const Tab(
                        child: Text("Bookmark"),
                      ),
                    ]),
                Expanded(
                  child: TabBarView(children: [
                    // list surah
                    FutureBuilder<List<Surah>>(
                      future: controller.getAllSurah(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (!snapshot.hasData) {
                          return const Center(
                            child: Text("Tidak ada data"),
                          );
                        }
                        return ListView.builder(
                          itemCount: snapshot.data?.length,
                          itemBuilder: (context, index) {
                            Surah surah = snapshot.data![index];
                            return ListTile(
                              leading: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/avatar-border-list.png'),
                                  )),
                                  child: Center(
                                      child: Text(
                                    surah.number.toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ))),
                              title: Text(surah.name!.transliteration!.id),
                              subtitle: Text(
                                  "${surah.numberOfVerses} Ayat | ${surah.revelation?.id.toString().split(".").last.capitalizeFirst}"),
                              trailing: Text(surah.name!.short!),
                              onTap: () {
                                Get.toNamed(Routes.DETAIL_SURAH,
                                    arguments: surah);
                              },
                            );
                          },
                        );
                      },
                    ),

                    ListView.builder(
                      itemCount: 30,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Container(
                              width: 35,
                              height: 35,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/avatar-border-list.png'),
                              )),
                              child: Center(
                                  child: Text(
                                "${index + 1}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ))),
                          title: Text("Juz ${index + 1}"),
                          // subtitle: const Text(
                          //     "abc Ayat | surah.revelation?.id.toString().split(.).last.capitalizeFirst"),
                          // trailing: const Text("abc"),
                          onTap: () {
                            // belum diimplementasikan
                          },
                        );
                      },
                    ),
                    const Center(child: const Text("3")),
                  ]),
                )
              ],
            ),
          ),
        ));
  }
}
