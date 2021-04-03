// To parse this JSON data, do
//
//     final chatModel = chatModelFromJson(jsonString);

import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  ChatModel({
    this.label,
    this.value,
  });

  String label;
  List<Value> value;

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
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
    this.sender,
    this.messge,
    this.time,
  });

  String sender;
  String messge;
  String time;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
    sender: json["sender"],
    messge: json["messge"],
    time: json["time"],
  );

  Map<String, dynamic> toJson() => {
    "sender": sender,
    "messge": messge,
    "time": time,
  };
}
