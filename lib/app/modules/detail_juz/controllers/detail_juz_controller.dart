import 'dart:convert';

import 'package:get/get.dart';

import '../../../data/models/juz.dart';
import 'package:http/http.dart' as http;

class DetailJuzController extends GetxController {
  final  startJuz = ''.obs;
  final  endJuz = ''.obs;
  final totalVerses = ''.obs;
  final anu = '';

   Future<Juz> getJuz(int juz) async {
    Uri url = Uri.parse('https://api.quran.gading.dev/juz/$juz');
    var res = await http.get(url);

    if (res.statusCode == 200) { // Pastikan respons berhasil
      Map<String, dynamic> data =
          (jsonDecode(res.body) as Map<String, dynamic>)["data"];
      Juz juzData = Juz.fromJson(data);

      startJuz.value = juzData.juzStartInfo!;
      endJuz.value = juzData.juzEndInfo!;
      totalVerses.value = juzData.totalVerses.toString();


      return juzData;
    } else {
      // Bisa lempar exception atau mengembalikan data default
      throw Exception('Failed to load Juz');
    }
  }

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
