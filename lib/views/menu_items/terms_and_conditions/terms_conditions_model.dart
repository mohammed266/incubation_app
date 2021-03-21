// To parse this JSON data, do
//
//     final termsConditionsModel = termsConditionsModelFromJson(jsonString);

import 'dart:convert';

List<TermsConditionsModel> termsConditionsModelFromJson(String str) =>
    List<TermsConditionsModel>.from(
        json.decode(str).map((x) => TermsConditionsModel.fromJson(x)));

String termsConditionsModelToJson(List<TermsConditionsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TermsConditionsModel {
  TermsConditionsModel({
    this.title,
    this.desc,
  });

  String title;
  String desc;

  factory TermsConditionsModel.fromJson(Map<String, dynamic> json) =>
      TermsConditionsModel(
        title: json["title"],
        desc: json["desc"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "desc": desc,
      };
}
