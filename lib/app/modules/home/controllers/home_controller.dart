import 'dart:convert';

import 'package:alquran_app/app/data/models/juz.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../data/models/surah.dart';

class HomeController extends GetxController {
  RxBool isDark = false.obs;

  Future<List<Surah>> getAllSurah() async {
    Uri url = Uri.parse('https://api.quran.gading.dev/surah');
    var res = await http.get(url);

    List data = (jsonDecode(res.body) as Map<String, dynamic>)["data"];

    if (data.isEmpty) {
      return [];
    } else {
      return data.map((e) => Surah.fromJson(e)).toList();
    }
  }

 Future<Juz> getJuz(int juz) async {
    Uri url = Uri.parse('https://api.quran.gading.dev/juz/$juz');
    var res = await http.get(url);

    if (res.statusCode == 200) { // Pastikan respons berhasil
      Map<String, dynamic> data =
          (jsonDecode(res.body) as Map<String, dynamic>)["data"];
      Juz juzData = Juz.fromJson(data);

      return juzData;
    } else {
      // Bisa lempar exception atau mengembalikan data default
      throw Exception('Failed to load Juz');
    }
  }

// default
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
