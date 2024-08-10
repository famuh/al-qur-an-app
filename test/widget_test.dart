import 'dart:convert';

import 'package:alquran_app/app/data/models/detail_surah.dart';
import 'package:alquran_app/app/data/models/surah.dart';
import 'package:http/http.dart' as http;

void main() async {
    Future<DetailSurah> getDetailSurah(String id) async {
    Uri url = Uri.parse('https://api.quran.gading.dev/surah/$id');
    var res = await http.get(url);

    Map<String, dynamic> data =
        (jsonDecode(res.body) as Map<String, dynamic>)["data"];
    print(data);
    return DetailSurah.fromJson(data);
  }

  await getDetailSurah(1.toString());

//   Uri url = Uri.parse('https://api.quran.gading.dev/surah');
//  var res = await http.get(url);

// var data = (jsonDecode(res.body) as Map<String, dynamic>)["data"];

// //  print(data[113]);
//  Surah annas = Surah.fromJson(data[113] );
//  print(annas.toJson());

}