// To parse this JSON data, do
//
//     final surah = surahFromJson(jsonString);

import 'dart:convert';

Surah surahFromJson(String str) => Surah.fromJson(json.decode(str));

String surahToJson(Surah data) => json.encode(data.toJson());

class Surah {
    int number;
    int sequence;
    int numberOfVerses;
    Name name;
    Name revelation;
    Name tafsir;
    dynamic preBismillah;
    List<dynamic> verses;

    Surah({
        required this.number,
        required this.sequence,
        required this.numberOfVerses,
        required this.name,
        required this.revelation,
        required this.tafsir,
        required this.preBismillah,
        required this.verses,
    });

    factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        number: json["number"],
        sequence: json["sequence"],
        numberOfVerses: json["numberOfVerses"],
        name: Name.fromJson(json["name"]),
        revelation: Name.fromJson(json["revelation"]),
        tafsir: Name.fromJson(json["tafsir"]),
        preBismillah: json["preBismillah"],
        verses: List<dynamic>.from(json["verses"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "sequence": sequence,
        "numberOfVerses": numberOfVerses,
        "name": name.toJson(),
        "revelation": revelation.toJson(),
        "tafsir": tafsir.toJson(),
        "preBismillah": preBismillah,
        "verses": List<dynamic>.from(verses.map((x) => x)),
    };
}

class Name {
    Name();

    factory Name.fromJson(Map<String, dynamic> json) => Name(
    );

    Map<String, dynamic> toJson() => {
    };
}
