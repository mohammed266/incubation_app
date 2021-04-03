// To parse this JSON data, do
//
//     final reportsModel = reportsModelFromJson(jsonString);

import 'dart:convert';

ReportsModel reportsModelFromJson(String str) => ReportsModel.fromJson(json.decode(str));

String reportsModelToJson(ReportsModel data) => json.encode(data.toJson());

class ReportsModel {
  ReportsModel({
    this.label,
    this.value,
  });

  String label;
  List<Value> value;

  factory ReportsModel.fromJson(Map<String, dynamic> json) => ReportsModel(
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
    this.file,
  });

  String file;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    file: json["file"],
  );

  Map<String, dynamic> toJson() => {
    "file": file,
  };
}
