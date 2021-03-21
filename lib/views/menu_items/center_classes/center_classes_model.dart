// To parse this JSON data, do
//
//     final centerClassesModel = centerClassesModelFromJson(jsonString);

import 'dart:convert';

List<CenterClassesModel> centerClassesModelFromJson(String str) => List<CenterClassesModel>.from(json.decode(str).map((x) => CenterClassesModel.fromJson(x)));

String centerClassesModelToJson(List<CenterClassesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CenterClassesModel {
  CenterClassesModel({
    this.id,
    this.name,
    this.img,
    this.content,
    this.shortDesc,
    this.links,
  });

  int id;
  String name;
  String img;
  String content;
  String shortDesc;
  Links links;

  factory CenterClassesModel.fromJson(Map<String, dynamic> json) => CenterClassesModel(
    id: json["id"],
    name: json["name"],
    img: json["img"],
    content: json["content"],
    shortDesc: json["short_desc"],
    links: Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "img": img,
    "content": content,
    "short_desc": shortDesc,
    "_links": links.toJson(),
  };
}

class Links {
  Links({
    this.self,
    this.collection,
    this.about,
    this.wpFeaturedmedia,
    this.wpAttachment,
    this.curies,
  });

  List<About> self;
  List<About> collection;
  List<About> about;
  List<WpFeaturedmedia> wpFeaturedmedia;
  List<About> wpAttachment;
  List<Cury> curies;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: List<About>.from(json["self"].map((x) => About.fromJson(x))),
    collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
    about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
    wpFeaturedmedia: List<WpFeaturedmedia>.from(json["wp:featuredmedia"].map((x) => WpFeaturedmedia.fromJson(x))),
    wpAttachment: List<About>.from(json["wp:attachment"].map((x) => About.fromJson(x))),
    curies: List<Cury>.from(json["curies"].map((x) => Cury.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": List<dynamic>.from(self.map((x) => x.toJson())),
    "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
    "about": List<dynamic>.from(about.map((x) => x.toJson())),
    "wp:featuredmedia": List<dynamic>.from(wpFeaturedmedia.map((x) => x.toJson())),
    "wp:attachment": List<dynamic>.from(wpAttachment.map((x) => x.toJson())),
    "curies": List<dynamic>.from(curies.map((x) => x.toJson())),
  };
}

class About {
  About({
    this.href,
  });

  String href;

  factory About.fromJson(Map<String, dynamic> json) => About(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}

class Cury {
  Cury({
    this.name,
    this.href,
    this.templated,
  });

  Name name;
  Href href;
  bool templated;

  factory Cury.fromJson(Map<String, dynamic> json) => Cury(
    name: nameValues.map[json["name"]],
    href: hrefValues.map[json["href"]],
    templated: json["templated"],
  );

  Map<String, dynamic> toJson() => {
    "name": nameValues.reverse[name],
    "href": hrefValues.reverse[href],
    "templated": templated,
  };
}

enum Href { HTTPS_API_W_ORG_REL }

final hrefValues = EnumValues({
  "https://api.w.org/{rel}": Href.HTTPS_API_W_ORG_REL
});

enum Name { WP }

final nameValues = EnumValues({
  "wp": Name.WP
});

class WpFeaturedmedia {
  WpFeaturedmedia({
    this.embeddable,
    this.href,
  });

  bool embeddable;
  String href;

  factory WpFeaturedmedia.fromJson(Map<String, dynamic> json) => WpFeaturedmedia(
    embeddable: json["embeddable"],
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "embeddable": embeddable,
    "href": href,
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
