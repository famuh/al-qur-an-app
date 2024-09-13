import 'package:alquran_app/app/data/models/juz.dart' as juz;
import 'package:alquran_app/common/list_surah.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../../../../common/colors.dart';
import '../../../../common/space.dart';
import '../controllers/detail_juz_controller.dart';

class DetailJuzView extends GetView<DetailJuzController> {
  final int juzNumber = Get.arguments;
  DetailJuzView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Juz $juzNumber'),
          // centerTitle: true,
          ),
      body: FutureBuilder<juz.Juz>(
        future: controller.getJuz(juzNumber),
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

          // Total item = jumlah ayat + 1 untuk informasi Juz
          int itemCount = (snapshot.data?.verses?.length ?? 0) + 1;

          return ListView.builder(
            shrinkWrap: true,
            itemCount: itemCount,
            itemBuilder: (context, index) {
              if (snapshot.data?.verses?.length == 0) {
                return const SizedBox();
              }

              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.lightbulb_outline_rounded,
                                color: appOrange,
                              ),
                              spaceW10,
                              Text(
                                'Informasi mengenai Juz $juzNumber',
                                style: TextStyle(
                                    color: appOrange,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          spaceH10,
                          Text(
                            'Juz $juzNumber terdiri dari ${controller.totalVerses} Ayat \ndimulai dari QS. ${controller.startJuz}\nsampai QS. ${controller.endJuz}',
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
              // di reverse untuk ngecek ayat terakhir
              // List<juz.Verses>? reversedVerses = snapshot.data?.verses?.reversed.toList();

              // Untuk index > 0, tampilkan ayat
              juz.Verses? ayat = snapshot.data?.verses![index - 1];

              return Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
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
                            backgroundColor: appPurpleLight1.withOpacity(.1),
                            radius: 16,
                            child: Text(
                              "${ayat?.number?.inSurah}",
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
                        ayat!.text!.arab!,
                        textAlign: TextAlign.end,
                        style: const TextStyle(fontSize: 18),
                      ),
                      spaceH10,
                      Text(
                        ayat.text!.transliteration!.en!,
                        textAlign: TextAlign.end,
                        style: const TextStyle(
                            fontSize: 12, fontStyle: FontStyle.italic),
                      ),
                      spaceH10,
                      Text(
                        ayat.translation!.id!,
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontSize: 12),
                      ),
                      spaceH10,
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
