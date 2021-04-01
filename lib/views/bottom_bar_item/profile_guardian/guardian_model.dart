// To parse this JSON data, do
//
//     final guardianModel = guardianModelFromJson(jsonString);

import 'dart:convert';

List<GuardianModel> guardianModelFromJson(String str) => List<GuardianModel>.from(json.decode(str).map((x) => GuardianModel.fromJson(x)));

String guardianModelToJson(List<GuardianModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GuardianModel {
  GuardianModel({
    this.id,
    this.name,
    this.status,
    this.img,
  });

  int id;
  String name;
  var status;
  String img;

  factory GuardianModel.fromJson(Map<String, dynamic> json) => GuardianModel(
    id: json["id"],
    name: json["name"] ,
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

enum Name { EMPTY, AHMEDAHMED, MOHAMED, NAME }

final nameValues = EnumValues({
  "ahmedahmed": Name.AHMEDAHMED,
  "احمد ابراهيم": Name.EMPTY,
  "mohamed": Name.MOHAMED,
  "احمد على": Name.NAME
});

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
