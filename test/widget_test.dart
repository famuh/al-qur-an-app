import 'dart:convert';

import 'package:alquran_app/app/data/models/surah.dart';
import 'package:http/http.dart' as http;

void main() async {
  Uri url = Uri.parse('https://api.quran.gading.dev/surah');
 var res = await http.get(url);

var data = (jsonDecode(res.body) as Map<String, dynamic>)["data"];

//  print(data[113]);
 Surah annas = Surah.fromJson(data[113] );
 print(annas.toJson());

}