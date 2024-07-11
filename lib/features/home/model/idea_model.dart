// To parse this JSON data, do
//
//     final ideaModel = ideaModelFromJson(jsonString);

import 'dart:convert';

IdeaModel ideaModelFromJson(String str) => IdeaModel.fromJson(json.decode(str));
String ideaModelToJson(IdeaModel data) => json.encode(data.toJson());

class IdeaModel {
  String? message;
  Data? data;

  IdeaModel({
    this.message,
    this.data,
  });

  factory IdeaModel.fromJson(Map<String, dynamic> json) => IdeaModel(
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "data": data!.toJson(),
      };
}

class Data {
  int? id;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  Business? business;

  Data({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.business,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        business: Business.fromJson(json["business"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "business": business?.toJson(),
      };
}

class Business {
  int? currentPage;
  List<Datum>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  dynamic? nextPageUrl;
  String? path;
  int? perPage;
  dynamic? prevPageUrl;
  int? to;
  int? total;

  Business({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Business.fromJson(Map<String, dynamic> json) => Business(
        currentPage: json["current_page"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"],
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "first_page_url": firstPageUrl,
        "from": from,
        "last_page": lastPage,
        "last_page_url": lastPageUrl,
        "links": List<dynamic>.from(links!.map((x) => x.toJson())),
        "next_page_url": nextPageUrl,
        "path": path,
        "per_page": perPage,
        "prev_page_url": prevPageUrl,
        "to": to,
        "total": total,
      };
}

class Datum {
  int? id;
  String? categoryId;
  String? name;
  String? capital;
  String? skills;
  String? necessaryPeople;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? imagePath;

  Datum({
    this.id,
    this.categoryId,
    this.name,
    this.capital,
    this.skills,
    this.necessaryPeople,
    this.createdAt,
    this.updatedAt,
    this.imagePath,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        categoryId: json["category_id"] ?? "5",
        name: json["name"],
        capital: json["capital"],
        skills: json["skills"],
        necessaryPeople: json["necessary_people"],
        imagePath: json['image'] ?? "/images/random.png",
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "capital": capital,
        "skills": skills,
        "necessary_people": necessaryPeople,
        'image': imagePath,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
      };
}
