// To parse this JSON data, do
//
//     final imagesModel = imagesModelFromJson(jsonString);

import 'dart:convert';

ImagesModel imagesModelFromJson(String str) => ImagesModel.fromJson(json.decode(str));

String imagesModelToJson(ImagesModel data) => json.encode(data.toJson());

class ImagesModel {
  ImagesModel({
    this.label,
    this.value,
  });

  String label;
  List<Value> value;

  factory ImagesModel.fromJson(Map<String, dynamic> json) => ImagesModel(
    label: json["label"],
    value: List<Value>.from(json["value"].map((x) => Value.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "label": label,
    "value": List<dynamic>.from(value.map((x) => x.toJson())),
  };
}

class Value {
  Value({
    this.albumDate,
    this.addAlbum,
  });

  String albumDate;
  List<String> addAlbum;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    albumDate: json["album_date"],
    addAlbum: List<String>.from(json["add_album"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "album_date": albumDate,
    "add_album": List<dynamic>.from(addAlbum.map((x) => x)),
  };
}
