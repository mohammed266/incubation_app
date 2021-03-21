// To parse this JSON data, do
//
//     final whoAreWeModel = whoAreWeModelFromJson(jsonString);

import 'dart:convert';

List<WhoAreWeModel> whoAreWeModelFromJson(String str) => List<WhoAreWeModel>.from(json.decode(str).map((x) => WhoAreWeModel.fromJson(x)));

String whoAreWeModelToJson(List<WhoAreWeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class WhoAreWeModel {
  WhoAreWeModel({
    this.title,
    this.img,
    this.content,
  });

  String title;
  String img;
  String content;

  factory WhoAreWeModel.fromJson(Map<String, dynamic> json) => WhoAreWeModel(
    title: json["title"],
    img: json["img"],
    content: json["content"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "img": img,
    "content": content,
  };
}
