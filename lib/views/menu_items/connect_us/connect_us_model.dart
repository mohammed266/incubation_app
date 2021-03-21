// To parse this JSON data, do
//
//     final connectUsModel = connectUsModelFromJson(jsonString);

import 'dart:convert';

ConnectUsModel connectUsModelFromJson(String str) => ConnectUsModel.fromJson(json.decode(str));

String connectUsModelToJson(ConnectUsModel data) => json.encode(data.toJson());

class ConnectUsModel {
  ConnectUsModel({
    this.latLong,
    this.googleMapIframe,
    this.contactInfo,
    this.social,
    this.contactPhone,
  });

  String latLong;
  String googleMapIframe;
  List<ContactInfo> contactInfo;
  List<Social> social;
  String contactPhone;

  factory ConnectUsModel.fromJson(Map<String, dynamic> json) => ConnectUsModel(
    latLong: json["lat_long"],
    googleMapIframe: json["google_map_iframe"],
    contactInfo: List<ContactInfo>.from(json["contact_info"].map((x) => ContactInfo.fromJson(x))),
    social: List<Social>.from(json["social"].map((x) => Social.fromJson(x))),
    contactPhone: json["contact_phone"],
  );

  Map<String, dynamic> toJson() => {
    "lat_long": latLong,
    "google_map_iframe": googleMapIframe,
    "contact_info": List<dynamic>.from(contactInfo.map((x) => x.toJson())),
    "social": List<dynamic>.from(social.map((x) => x.toJson())),
    "contact_phone": contactPhone,
  };
}

class ContactInfo {
  ContactInfo({
    this.name,
    this.icon,
    this.value,
  });

  String name;
  bool icon;
  String value;

  factory ContactInfo.fromJson(Map<String, dynamic> json) => ContactInfo(
    name: json["name"],
    icon: json["icon"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "icon": icon,
    "value": value,
  };
}

class Social {
  Social({
    this.icon,
    this.iconLink,
  });

  String icon;
  String iconLink;

  factory Social.fromJson(Map<String, dynamic> json) => Social(
    icon: json["icon"],
    iconLink: json["icon_link"],
  );

  Map<String, dynamic> toJson() => {
    "icon": icon,
    "icon_link": iconLink,
  };
}
