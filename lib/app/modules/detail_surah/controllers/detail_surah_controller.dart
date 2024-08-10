import 'dart:convert';

import 'package:alquran_app/app/data/models/detail_surah.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DetailSurahController extends GetxController {
  Future<DetailSurah> getDetailSurah(int id) async {
    Uri url = Uri.parse('https://api.quran.gading.dev/surah/$id');
    var res = await http.get(url);
    // print(res);

    Map<String, dynamic> data =
        (jsonDecode(res.body) as Map<String, dynamic>)["data"];
    // DetailSurah test = DetailSurah.fromJson(data);
    // print( "Data $test");
    return DetailSurah.fromJson(data);
  }

 
}
