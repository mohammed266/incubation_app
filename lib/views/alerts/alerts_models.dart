// To parse this JSON data, do
//
//     final alertaModel = alertaModelFromJson(jsonString);

import 'dart:convert';

AlertsModel alertaModelFromJson(String str) => AlertsModel.fromJson(json.decode(str));

String alertaModelToJson(AlertsModel data) => json.encode(data.toJson());

class AlertsModel {
  AlertsModel({
    this.notifications,
  });

  List<Notification> notifications;

  factory AlertsModel.fromJson(Map<String, dynamic> json) => AlertsModel(
    notifications: List<Notification>.from(json["notifications"].map((x) => Notification.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "notifications": List<dynamic>.from(notifications.map((x) => x.toJson())),
  };
}

class Notification {
  Notification({
    this.title,
    this.content,
    this.time,
    this.link,
    this.isSeen,
  });

  String title;
  String content;
  String time;
  String link;
  bool isSeen;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    title: json["title"],
    content: json["content"],
    time: json["time"],
    link: json["link"],
    isSeen: json["is_seen"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "content": content,
    "time": time,
    "link": link,
    "is_seen": isSeen,
  };
}
