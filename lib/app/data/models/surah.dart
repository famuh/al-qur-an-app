// To parse this JSON data, do
//
//     final surah = surahFromJson(jsonString);

import 'dart:convert';

SurahResponse surahFromJson(String str) => SurahResponse.fromJson(json.decode(str));

String surahToJson(SurahResponse data) => json.encode(data.toJson());

class SurahResponse {
    int code;
    String status;
    String message;
    List<Surah> data;

    SurahResponse({
        required this.code,
        required this.status,
        required this.message,
        required this.data,
    });

    factory SurahResponse.fromJson(Map<String, dynamic> json) => SurahResponse(
        code: json["code"],
        status: json["status"],
        message: json["message"],
        data: List<Surah>.from(json["data"].map((x) => Surah.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Surah {
    int number;
    int sequence;
    int numberOfVerses;
    Name name;
    Revelation revelation;
    Tafsir tafsir;

    Surah({
        required this.number,
        required this.sequence,
        required this.numberOfVerses,
        required this.name,
        required this.revelation,
        required this.tafsir,
    });

    factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        number: json["number"],
        sequence: json["sequence"],
        numberOfVerses: json["numberOfVerses"],
        name: Name.fromJson(json["name"]),
        revelation: Revelation.fromJson(json["revelation"]),
        tafsir: Tafsir.fromJson(json["tafsir"]),
    );

    Map<String, dynamic> toJson() => {
        "number": number,
        "sequence": sequence,
        "numberOfVerses": numberOfVerses,
        "name": name.toJson(),
        "revelation": revelation.toJson(),
        "tafsir": tafsir.toJson(),
    };
}

class Name {
    String short;
    String long;
    Translation transliteration;
    Translation translation;

    Name({
        required this.short,
        required this.long,
        required this.transliteration,
        required this.translation,
    });

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        short: json["short"],
        long: json["long"],
        transliteration: Translation.fromJson(json["transliteration"]),
        translation: Translation.fromJson(json["translation"]),
    );

    Map<String, dynamic> toJson() => {
        "short": short,
        "long": long,
        "transliteration": transliteration.toJson(),
        "translation": translation.toJson(),
    };
}

class Translation {
    String en;
    String id;

    Translation({
        required this.en,
        required this.id,
    });

    factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        en: json["en"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "en": en,
        "id": id,
    };
}

class Revelation {
    Arab arab;
    En en;
    Id id;

    Revelation({
        required this.arab,
        required this.en,
        required this.id,
    });

    factory Revelation.fromJson(Map<String, dynamic> json) => Revelation(
        arab: arabValues.map[json["arab"]]!,
        en: enValues.map[json["en"]]!,
        id: idValues.map[json["id"]]!,
    );

    Map<String, dynamic> toJson() => {
        "arab": arabValues.reverse[arab],
        "en": enValues.reverse[en],
        "id": idValues.reverse[id],
    };
}

enum Arab {
    ARAB,
    EMPTY
}

final arabValues = EnumValues({
    "مدينة": Arab.ARAB,
    "مكة": Arab.EMPTY
});

enum En {
    MECCAN,
    MEDINAN
}

final enValues = EnumValues({
    "Meccan": En.MECCAN,
    "Medinan": En.MEDINAN
});

enum Id {
    MADANIYYAH,
    MAKKIYYAH
}

final idValues = EnumValues({
    "Madaniyyah": Id.MADANIYYAH,
    "Makkiyyah": Id.MAKKIYYAH
});

class Tafsir {
    String id;

    Tafsir({
        required this.id,
    });

    factory Tafsir.fromJson(Map<String, dynamic> json) => Tafsir(
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
