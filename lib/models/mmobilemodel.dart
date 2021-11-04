// To parse this JSON data, do
//
//     final mobileModel = mobileModelFromJson(jsonString);

import 'dart:convert';

MobileModel mobileModelFromJson(String str) => MobileModel.fromJson(json.decode(str));

String mobileModelToJson(MobileModel data) => json.encode(data.toJson());

class MobileModel {
    MobileModel({
        required this.tags,
    });

    List<Tag> tags;

    factory MobileModel.fromJson(Map<String, dynamic> json) => MobileModel(
        tags: List<Tag>.from(json["tags"].map((x) => Tag.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "tags": List<dynamic>.from(tags.map((x) => x.toJson())),
    };
}

class Tag {
    Tag({
        required this.spaceList,
        required this.id,
        required this.title,
        required this.displayName,
        required this.meta,
        required this.description,
        required this.v,
    });

    List<dynamic> spaceList;
    String id;
    String title;
    String displayName;
    String meta;
    String description;
    int v;

    factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        spaceList: List<dynamic>.from(json["spaceList"].map((x) => x)),
        id: json["_id"],
        title: json["title"],
        displayName: json["displayName"],
        meta: json["meta"] == null ? null : json["meta"],
        description: json["description"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "spaceList": List<dynamic>.from(spaceList.map((x) => x)),
        "_id": id,
        "title": title,
        "displayName": displayName,
        "meta": meta == null ? null : meta,
        "description": description,
        "__v": v,
    };
}
