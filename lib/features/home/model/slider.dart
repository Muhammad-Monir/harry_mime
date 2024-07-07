// To parse this JSON data, do
//
//     final sliderData = sliderDataFromJson(jsonString);

import 'dart:convert';

SliderData sliderDataFromJson(String str) =>
    SliderData.fromJson(json.decode(str));

String sliderDataToJson(SliderData data) => json.encode(data.toJson());

class SliderData {
  final bool? success;
  final String? message;
  final Data? data;
  final int? code;

  SliderData({
    this.success,
    this.message,
    this.data,
    this.code,
  });

  factory SliderData.fromJson(Map<String, dynamic> json) => SliderData(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
        "code": code,
      };
}

class Data {
  final String? transitionTime;
  final List<Slider>? sliders;

  Data({
    this.transitionTime,
    this.sliders,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        transitionTime: json["transition_time"],
        sliders: json["sliders"] == null
            ? []
            : List<Slider>.from(
                json["sliders"]!.map((x) => Slider.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "transition_time": transitionTime,
        "sliders": sliders == null
            ? []
            : List<dynamic>.from(sliders!.map((x) => x.toJson())),
      };
}

class Slider {
  final int? id;
  final String? imgPath;
  final String? link;
  final int? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? imgFullPath;

  Slider({
    this.id,
    this.imgPath,
    this.link,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.imgFullPath,
  });

  factory Slider.fromJson(Map<String, dynamic> json) => Slider(
        id: json["id"],
        imgPath: json["img_path"],
        link: json["link"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        imgFullPath: json["img_full_path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "img_path": imgPath,
        "link": link,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "img_full_path": imgFullPath,
      };
}
