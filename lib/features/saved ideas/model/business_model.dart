// import 'dart:convert';

// class BusinessModel {
//   late int id;
//   late int categoryId;
//   late String name;
//   late double capital;
//   late String skills;
//   late String necessaryPeople;

//   BusinessModel({
//     required this.id,
//     required this.categoryId,
//     required this.name,
//     required this.capital,
//     required this.skills,
//     required this.necessaryPeople,
//   });

//   BusinessModel.empty();
  
//   BusinessModel copyWith({
//     int? id,
//     int? categoryId,
//     String? name,
//     double? capital,
//     String? skills,
//     String? necessaryPeople,
//   }) =>
//       BusinessModel(
//         id: id ?? this.id,
//         categoryId: categoryId ?? this.categoryId,
//         name: name ?? this.name,
//         capital: capital ?? this.capital,
//         skills: skills ?? this.skills,
//         necessaryPeople: necessaryPeople ?? this.necessaryPeople,
//       );

//   factory BusinessModel.fromRawJson(String str) => BusinessModel.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory BusinessModel.fromJson(Map<String, dynamic> json) => BusinessModel(
//         id: int.parse(json["id"].toString()),
//         categoryId: int.parse(json["category_id"].toString()),
//         name: json["name"],
//         capital: double.parse(json["capital"].toString()),
//         skills: json["skills"],
//         necessaryPeople: json["necessary_people"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "category_id": categoryId,
//         "name": name,
//         "capital": capital,
//         "skills": skills,
//         "necessary_people": necessaryPeople,
//       };

//   static List<BusinessModel> fromList(List<dynamic> list) {
//     return list.map((item) => BusinessModel.fromJson(item)).toList();
//   }

//   static List<Map<String, dynamic>> toList(List<BusinessModel> businessList) {
//     return businessList.map((business) => business.toJson()).toList();
//   }
// }

// import 'dart:convert';

// class BusinessModel {
//   late int iid;
//   late int categoryId;
//   late String name;
//   late double capital;
//   late String skills;
//   late String necessaryPeople;

//   BusinessModel({
//     required this.iid,
//     required this.categoryId,
//     required this.name,
//     required this.capital,
//     required this.skills,
//     required this.necessaryPeople,
//   });

//   BusinessModel.empty();
  
//   BusinessModel copyWith({
//     int? iid,
//     int? categoryId,
//     String? name,
//     double? capital,
//     String? skills,
//     String? necessaryPeople,
//   }) =>
//       BusinessModel(
//         iid: iid ?? this.iid,
//         categoryId: categoryId ?? this.categoryId,
//         name: name ?? this.name,
//         capital: capital ?? this.capital,
//         skills: skills ?? this.skills,
//         necessaryPeople: necessaryPeople ?? this.necessaryPeople,
//       );

//   factory BusinessModel.fromRawJson(String str) => BusinessModel.fromJson(json.decode(str));

//   String toRawJson() => json.encode(toJson());

//   factory BusinessModel.fromJson(Map<String, dynamic> json) => BusinessModel(
//         iid: int.parse(json["iid"].toString()),
//         categoryId: int.parse(json["category_id"].toString()),
//         name: json["name"],
//         capital: double.parse(json["capital"].toString()),
//         skills: json["skills"],
//         necessaryPeople: json["necessary_people"],
//       );

//   Map<String, dynamic> toJson() => {
//         "iid": iid,
//         "category_id": categoryId,
//         "name": name,
//         "capital": capital,
//         "skills": skills,
//         "necessary_people": necessaryPeople,
//       };

//   static List<BusinessModel> fromList(List<dynamic> list) {
//     return list.map((item) => BusinessModel.fromJson(item)).toList();
//   }

//   static List<Map<String, dynamic>> toList(List<BusinessModel> businessList) {
//     return businessList.map((business) => business.toJson()).toList();
//   }
// }


import 'dart:convert';

class BusinessModel {
  late int uid;
  late String categoryId;
  late String name;
  late String capital;
  late String skills;
  late String necessaryPeople;

  BusinessModel({
    required this.uid,
    required this.categoryId,
    required this.name,
    required this.capital,
    required this.skills,
    required this.necessaryPeople,
  });

  BusinessModel.empty();
  
  BusinessModel copyWith({
    int? uid,
    String? categoryId,
    String? name,
    String? capital,
    String? skills,
    String? necessaryPeople,
  }) =>
      BusinessModel(
        uid: uid ?? this.uid,
        categoryId: categoryId ?? this.categoryId,
        name: name ?? this.name,
        capital: capital ?? this.capital,
        skills: skills ?? this.skills,
        necessaryPeople: necessaryPeople ?? this.necessaryPeople,
      );

  factory BusinessModel.fromRawJson(String str) => BusinessModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BusinessModel.fromJson(Map<String, dynamic> json) => BusinessModel(
        uid: int.parse(json["uid"].toString()),
        categoryId: json["category_id"],
        name: json["name"],
        capital:json["capital"],
        skills: json["skills"],
        necessaryPeople: json["necessary_people"],
      );

  Map<String, dynamic> toJson() => {
        "uid": uid,
        "category_id": categoryId,
        "name": name,
        "capital": capital,
        "skills": skills,
        "necessary_people": necessaryPeople,
      };

  static List<BusinessModel> fromList(List<dynamic> list) {
    return list.map((item) => BusinessModel.fromJson(item)).toList();
  }

  static List<Map<String, dynamic>> toList(List<BusinessModel> businessList) {
    return businessList.map((business) => business.toJson()).toList();
  }
}
