// To parse this JSON data, do
//
//     final horoScopeModel = horoScopeModelFromJson(jsonString);

import 'dart:convert';

HoroScopeModel horoScopeModelFromJson(String str) => HoroScopeModel.fromJson(json.decode(str));

String horoScopeModelToJson(HoroScopeModel data) => json.encode(data.toJson());

class HoroScopeModel {
    HoroScopeModel({
        this.date,
        this.horoscope,
        this.sunsign,
    });

    DateTime? date;
    String? horoscope;
    String? sunsign;

    factory HoroScopeModel.fromJson(Map<String, dynamic> json) => HoroScopeModel(
        date: DateTime.parse(json["date"]),
        horoscope: json["horoscope"],
        sunsign: json["sunsign"],
    );

    Map<String, dynamic> toJson() => {
        "date": "${date?.year.toString().padLeft(4, '0')}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}",
        "horoscope": horoscope,
        "sunsign": sunsign,
    };
}
