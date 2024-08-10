import 'package:alquran_app/app/data/models/detail_surah.dart' as detail;
import 'package:alquran_app/app/data/models/surah.dart';
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
          title: Text('Surah ${surah.name.transliteration.id}'),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "${surah.name.transliteration.id}",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Text(
                      "${surah.name.translation.id}",
                      style: TextStyle(
                          // fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                    Text(
                      "${surah.numberOfVerses} Ayat | ${surah.revelation.id.toString().split(".").last.capitalizeFirst}",
                      style: TextStyle(
                          // fontWeight: FontWeight.w500,
                          fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder<detail.DetailSurah>(
              future: controller.getDetailSurah(surah.number),
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
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  child: Text("${ayat?.number.inSurah}"),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                            Icons.bookmark_add_outlined)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.play_arrow)),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              ayat!.text.arab,
                              textAlign: TextAlign.end,
                              style: const TextStyle(fontSize: 18),
                            ),
                            const SizedBox(height: 10,),
                            Text(
                              ayat.translation.id,
                              style: const TextStyle(fontSize: 12),
                            ),
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
