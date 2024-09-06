import 'package:alquran_app/app/data/models/juz.dart' as juz;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../../../../common/colors.dart';
import '../../../../common/space.dart';
import '../../../widget/InformationDetailCard.dart';
import '../controllers/detail_juz_controller.dart';

class DetailJuzView extends GetView<DetailJuzController> {
  final int juzNumber = Get.arguments;
  DetailJuzView({Key? key}) : super(key: key);
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
      return ListView(
        physics: const NeverScrollableScrollPhysics(),
        children : [
           InformationDetailCard(
                  "Juz $juzNumber",
                  "",
                  "${controller.startJuz}",
                  " ${controller.endJuz}"
                  ),

          ListView.builder(
          shrinkWrap: true,
          // physics: const NeverScrollableScrollPhysics(),
          itemCount: snapshot.data?.verses?.length,
          itemBuilder: (context, index) {
            if (snapshot.data?.verses?.length == 0) {
              return const SizedBox();
            }
            juz.Verses? ayat = snapshot.data?.verses![index];
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
        ),
        ]
      );
                },
              ),
    );
  }
}
