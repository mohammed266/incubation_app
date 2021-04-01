// To parse this JSON data, do
//
//     final childrenModel = childrenModelFromJson(jsonString);

import 'dart:convert';

List<ChildrenModel> childrenModelFromJson(String str) => List<ChildrenModel>.from(json.decode(str).map((x) => ChildrenModel.fromJson(x)));

String childrenModelToJson(List<ChildrenModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChildrenModel {
  ChildrenModel({
    this.id,
    this.name,
    this.status,
    this.img,
  });

  int id;
  String name;
  dynamic status;
  String img;

  factory ChildrenModel.fromJson(Map<String, dynamic> json) => ChildrenModel(
    id: json["id"],
    name: json["name"] ?? '',
    status: json["status"],
    img: json["img"] == null ? null : json["img"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name == null ? null : nameValues.reverse[name],
    "status": status,
    "img": img == null ? null : img,
  };
}

enum Name { EMPTY, AHMEDAHMED, MOHAMED, NAME, FELIX_WOODWARD, AHMED_MOHSAN }

final nameValues = EnumValues({
  "ahmedahmed": Name.AHMEDAHMED,
  "Ahmed mohsan": Name.AHMED_MOHSAN,
  "احمد ابراهيم": Name.EMPTY,
  "Felix Woodward": Name.FELIX_WOODWARD,
  "mohamed": Name.MOHAMED,
  "احمد على": Name.NAME
});

class StatusClass {
  StatusClass({
    this.value,
    this.label,
  });

  String value;
  String label;

  factory StatusClass.fromJson(Map<String, dynamic> json) => StatusClass(
    value: json["value"],
    label: json["label"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "label": label,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
