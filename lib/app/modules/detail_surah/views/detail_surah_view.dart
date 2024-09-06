import 'package:alquran_app/app/data/models/detail_surah.dart' as detail;
import 'package:alquran_app/app/data/models/surah.dart';
import 'package:alquran_app/common/colors.dart';
import 'package:alquran_app/common/space.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/detail_surah_controller.dart';

class DetailSurahView extends GetView<DetailSurahController> {
  DetailSurahView({Key? key}) : super(key: key);

  final Surah surah = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Surah ${surah.name?.transliteration?.id}'),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            GestureDetector(
              onTap: () => Get.defaultDialog(
                  title: "Tafsir ${surah.name?.transliteration?.id}",
                  titleStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  content: SizedBox(
                    height: Get.height / 2,
                    child: SingleChildScrollView(
                        child: Text(
                      surah.tafsir?.id ?? "Tidak Ada Tafsir",
                    )),
                  ),
                  contentPadding:
                      // const EdgeInsets.symmetric(horizontal: 30, vertical: 10)),
                      const EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 0)),
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          colors: [appPurpleLight1, appPurpleDark])),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          "${surah.name?.transliteration?.id}",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: appWhite),
                        ),
                        Text(
                          "${surah.name?.translation?.id}",
                          style: TextStyle(
                              // fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: appWhite),
                        ),
                        const Divider(
                          color: Colors.transparent,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${surah.revelation?.id.toString().split(".").last.capitalizeFirst}",
                              style: TextStyle(
                                  // fontWeight: FontWeight.w500,
                                  color: appWhite,
                                  fontSize: 16),
                            ),
                            Container(
                              width: 5,
                              height: 5,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: appWhite,
                              ),
                            ),
                            Text(
                              " ${surah.numberOfVerses} Ayat",
                              style: TextStyle(
                                  // fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: appWhite),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder<detail.DetailSurah>(
              future: controller.getDetailSurah(surah.number!),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
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
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: snapshot.data?.verses.length,
                  itemBuilder: (context, index) {
                    if (snapshot.data?.verses.length == 0) {
                      return const SizedBox();
                    }
                    detail.Verse? ayat = snapshot.data?.verses[index];
                    return Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage: const AssetImage(
                                      'assets/images/avatar-border-list.png'),
                                  backgroundColor:
                                      appPurpleLight1.withOpacity(.1),
                                  radius: 16,
                                  child: Text(
                                    "${ayat?.number.inSurah}",
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.bookmark_add_outlined,
                                          color: appPurpleLight1,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.play_arrow,
                                          color: appPurpleLight1,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                            spaceH10,
                            Text(
                              ayat!.text.arab,
                              textAlign: TextAlign.end,
                              style: const TextStyle(fontSize: 18),
                            ),
                            spaceH10,
                            Text(
                              ayat.text.transliteration.en,
                              style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                            ),
                            spaceH10,
                            Text(
                              ayat.translation.id,
                              textAlign: TextAlign.left,
                              style: const TextStyle(fontSize: 12),
                            ),
                            spaceH10
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            )
          ],
        ));
  }
}
