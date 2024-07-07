// // To parse this JSON data, do
// //
// //     final restaurantDto = restaurantDtoFromJson(jsonString);

// import 'dart:convert';

// RestaurantDto restaurantDtoFromJson(String str) => RestaurantDto.fromJson(json.decode(str));

// String restaurantDtoToJson(RestaurantDto data) => json.encode(data.toJson());

// class RestaurantDto {
//   final bool? success;
//   final String? message;
//   final Data? data;
//   final int? code;

//   RestaurantDto({
//     this.success,
//     this.message,
//     this.data,
//     this.code,
//   });

//   RestaurantDto copyWith({
//     bool? success,
//     String? message,
//     Data? data,
//     int? code,
//   }) =>
//       RestaurantDto(
//         success: success ?? this.success,
//         message: message ?? this.message,
//         data: data ?? this.data,
//         code: code ?? this.code,
//       );

//   factory RestaurantDto.fromJson(Map<String, dynamic> json) => RestaurantDto(
//         success: json["success"],
//         message: json["message"],
//         data: json["data"] == null ? null : Data.fromJson(json["data"]),
//         code: json["code"],
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "message": message,
//         "data": data?.toJson(),
//         "code": code,
//       };
// }

// class Data {
//   final Restaurants? restaurants;

//   Data({
//     this.restaurants,
//   });

//   Data copyWith({
//     Restaurants? restaurants,
//   }) =>
//       Data(
//         restaurants: restaurants ?? this.restaurants,
//       );

//   factory Data.fromJson(Map<String, dynamic> json) => Data(
//         restaurants: json["restaurants"] == null ? null : Restaurants.fromJson(json["restaurants"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "restaurants": restaurants?.toJson(),
//       };
// }

// class Restaurants {
//   final int? currentPage;
//   final List<Restaurant>? data;
//   final String? firstPageUrl;
//   final int? from;
//   final int? lastPage;
//   final String? lastPageUrl;
//   final List<Link>? links;
//   final dynamic nextPageUrl;
//   final String? path;
//   final int? perPage;
//   final dynamic prevPageUrl;
//   final int? to;
//   final int? total;

//   Restaurants({
//     this.currentPage,
//     this.data,
//     this.firstPageUrl,
//     this.from,
//     this.lastPage,
//     this.lastPageUrl,
//     this.links,
//     this.nextPageUrl,
//     this.path,
//     this.perPage,
//     this.prevPageUrl,
//     this.to,
//     this.total,
//   });

//   Restaurants copyWith({
//     int? currentPage,
//     List<Restaurant>? data,
//     String? firstPageUrl,
//     int? from,
//     int? lastPage,
//     String? lastPageUrl,
//     List<Link>? links,
//     dynamic nextPageUrl,
//     String? path,
//     int? perPage,
//     dynamic prevPageUrl,
//     int? to,
//     int? total,
//   }) =>
//       Restaurants(
//         currentPage: currentPage ?? this.currentPage,
//         data: data ?? this.data,
//         firstPageUrl: firstPageUrl ?? this.firstPageUrl,
//         from: from ?? this.from,
//         lastPage: lastPage ?? this.lastPage,
//         lastPageUrl: lastPageUrl ?? this.lastPageUrl,
//         links: links ?? this.links,
//         nextPageUrl: nextPageUrl ?? this.nextPageUrl,
//         path: path ?? this.path,
//         perPage: perPage ?? this.perPage,
//         prevPageUrl: prevPageUrl ?? this.prevPageUrl,
//         to: to ?? this.to,
//         total: total ?? this.total,
//       );

//   factory Restaurants.fromJson(Map<String, dynamic> json) => Restaurants(
//         currentPage: json["current_page"],
//         data: json["data"] == null ? [] : List<Restaurant>.from(json["data"]!.map((x) => Restaurant.fromJson(x))),
//         firstPageUrl: json["first_page_url"],
//         from: json["from"],
//         lastPage: json["last_page"],
//         lastPageUrl: json["last_page_url"],
//         links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
//         nextPageUrl: json["next_page_url"],
//         path: json["path"],
//         perPage: json["per_page"],
//         prevPageUrl: json["prev_page_url"],
//         to: json["to"],
//         total: json["total"],
//       );

//   Map<String, dynamic> toJson() => {
//         "current_page": currentPage,
//         "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
//         "first_page_url": firstPageUrl,
//         "from": from,
//         "last_page": lastPage,
//         "last_page_url": lastPageUrl,
//         "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
//         "next_page_url": nextPageUrl,
//         "path": path,
//         "per_page": perPage,
//         "prev_page_url": prevPageUrl,
//         "to": to,
//         "total": total,
//       };
// }

// class Restaurant {
//   final int? id;
//   final String? name;
//   final String? slug;
//   final int? restaurantGroupId;
//   final int? userId;
//   final dynamic managerId;
//   final int? restaurantCategoryId;
//   final int? isTrending;
//   final int? isFeatured;
//   final String? phone;
//   final String? email;
//   final dynamic shortDescription;
//   final dynamic description;
//   final String? iban;
//   final String? taxId;
//   final String? address;
//   final String? latitude;
//   final String? longitude;
//   final String? city;
//   final String? state;
//   final String? postalCode;
//   final String? country;
//   final String? featuredImage;
//   final dynamic facebookLink;
//   final dynamic youtubeLink;
//   final dynamic twitterLink;
//   final dynamic instagramLink;
//   final dynamic websiteLink;
//   final String? adminCommission;
//   final dynamic customerRange;
//   final int? status;
//   final dynamic deletedAt;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final dynamic countryCode;
//   final dynamic countryPhone;
//   final int? isClosed;
//   final int? receivingOrder;
//   final String? bagFee;
//   final String? timeSlots;
//   final double? distance;
//   final int? isFavourite;
//   final String? imageFullPath;
//   final String? rating;
//   final String? bagFeeInEuro;
//   final String? categoryName;

//   Restaurant({
//     this.id,
//     this.name,
//     this.slug,
//     this.restaurantGroupId,
//     this.userId,
//     this.managerId,
//     this.restaurantCategoryId,
//     this.isTrending,
//     this.isFeatured,
//     this.phone,
//     this.email,
//     this.shortDescription,
//     this.description,
//     this.iban,
//     this.taxId,
//     this.address,
//     this.latitude,
//     this.longitude,
//     this.city,
//     this.state,
//     this.postalCode,
//     this.country,
//     this.featuredImage,
//     this.facebookLink,
//     this.youtubeLink,
//     this.twitterLink,
//     this.instagramLink,
//     this.websiteLink,
//     this.adminCommission,
//     this.customerRange,
//     this.status,
//     this.deletedAt,
//     this.createdAt,
//     this.updatedAt,
//     this.countryCode,
//     this.countryPhone,
//     this.isClosed,
//     this.receivingOrder,
//     this.bagFee,
//     this.timeSlots,
//     this.distance,
//     this.isFavourite,
//     this.imageFullPath,
//     this.rating,
//     this.bagFeeInEuro,
//     this.categoryName,
//   });

//   Restaurant copyWith({
//     int? id,
//     String? name,
//     String? slug,
//     int? restaurantGroupId,
//     int? userId,
//     dynamic managerId,
//     int? restaurantCategoryId,
//     int? isTrending,
//     int? isFeatured,
//     String? phone,
//     String? email,
//     dynamic shortDescription,
//     dynamic description,
//     String? iban,
//     String? taxId,
//     String? address,
//     String? latitude,
//     String? longitude,
//     String? city,
//     String? state,
//     String? postalCode,
//     String? country,
//     String? featuredImage,
//     dynamic facebookLink,
//     dynamic youtubeLink,
//     dynamic twitterLink,
//     dynamic instagramLink,
//     dynamic websiteLink,
//     String? adminCommission,
//     dynamic customerRange,
//     int? status,
//     dynamic deletedAt,
//     DateTime? createdAt,
//     DateTime? updatedAt,
//     dynamic countryCode,
//     dynamic countryPhone,
//     int? isClosed,
//     int? receivingOrder,
//     String? bagFee,
//     String? timeSlots,
//     double? distance,
//     int? isFavourite,
//     String? imageFullPath,
//     String? rating,
//     String? bagFeeInEuro,
//     String? categoryName,
//   }) =>
//       Restaurant(
//         id: id ?? this.id,
//         name: name ?? this.name,
//         slug: slug ?? this.slug,
//         restaurantGroupId: restaurantGroupId ?? this.restaurantGroupId,
//         userId: userId ?? this.userId,
//         managerId: managerId ?? this.managerId,
//         restaurantCategoryId: restaurantCategoryId ?? this.restaurantCategoryId,
//         isTrending: isTrending ?? this.isTrending,
//         isFeatured: isFeatured ?? this.isFeatured,
//         phone: phone ?? this.phone,
//         email: email ?? this.email,
//         shortDescription: shortDescription ?? this.shortDescription,
//         description: description ?? this.description,
//         iban: iban ?? this.iban,
//         taxId: taxId ?? this.taxId,
//         address: address ?? this.address,
//         latitude: latitude ?? this.latitude,
//         longitude: longitude ?? this.longitude,
//         city: city ?? this.city,
//         state: state ?? this.state,
//         postalCode: postalCode ?? this.postalCode,
//         country: country ?? this.country,
//         featuredImage: featuredImage ?? this.featuredImage,
//         facebookLink: facebookLink ?? this.facebookLink,
//         youtubeLink: youtubeLink ?? this.youtubeLink,
//         twitterLink: twitterLink ?? this.twitterLink,
//         instagramLink: instagramLink ?? this.instagramLink,
//         websiteLink: websiteLink ?? this.websiteLink,
//         adminCommission: adminCommission ?? this.adminCommission,
//         customerRange: customerRange ?? this.customerRange,
//         status: status ?? this.status,
//         deletedAt: deletedAt ?? this.deletedAt,
//         createdAt: createdAt ?? this.createdAt,
//         updatedAt: updatedAt ?? this.updatedAt,
//         countryCode: countryCode ?? this.countryCode,
//         countryPhone: countryPhone ?? this.countryPhone,
//         isClosed: isClosed ?? this.isClosed,
//         receivingOrder: receivingOrder ?? this.receivingOrder,
//         bagFee: bagFee ?? this.bagFee,
//         timeSlots: timeSlots ?? this.timeSlots,
//         distance: distance ?? this.distance,
//         isFavourite: isFavourite ?? this.isFavourite,
//         imageFullPath: imageFullPath ?? this.imageFullPath,
//         rating: rating ?? this.rating,
//         bagFeeInEuro: bagFeeInEuro ?? this.bagFeeInEuro,
//         categoryName: categoryName ?? this.categoryName,
//       );

//   factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
//         id: json["id"],
//         name: json["name"],
//         slug: json["slug"],
//         restaurantGroupId: json["restaurant_group_id"],
//         userId: json["user_id"],
//         managerId: json["manager_id"],
//         restaurantCategoryId: json["restaurant_category_id"],
//         isTrending: json["is_trending"],
//         isFeatured: json["is_featured"],
//         phone: json["phone"],
//         email: json["email"],
//         shortDescription: json["short_description"],
//         description: json["description"],
//         iban: json["iban"],
//         taxId: json["tax_id"],
//         address: json["address"],
//         latitude: json["latitude"],
//         longitude: json["longitude"],
//         city: json["city"],
//         state: json["state"],
//         postalCode: json["postal_code"],
//         country: json["country"],
//         featuredImage: json["featured_image"],
//         facebookLink: json["facebook_link"],
//         youtubeLink: json["youtube_link"],
//         twitterLink: json["twitter_link"],
//         instagramLink: json["instagram_link"],
//         websiteLink: json["website_link"],
//         adminCommission: json["admin_commission"],
//         customerRange: json["customer_range"],
//         status: json["status"],
//         deletedAt: json["deleted_at"],
//         createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
//         countryCode: json["country_code"],
//         countryPhone: json["country_phone"],
//         isClosed: json["is_closed"],
//         receivingOrder: json["receiving_order"],
//         bagFee: json["bag_fee"],
//         timeSlots: json["time_slots"],
//         distance: json["distance"]?.toDouble(),
//         isFavourite: json["is_favourite"],
//         imageFullPath: json["image_full_path"],
//         rating: json["rating"],
//         bagFeeInEuro: json["bag_fee_in_euro"],
//         categoryName: json["category_name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "slug": slug,
//         "restaurant_group_id": restaurantGroupId,
//         "user_id": userId,
//         "manager_id": managerId,
//         "restaurant_category_id": restaurantCategoryId,
//         "is_trending": isTrending,
//         "is_featured": isFeatured,
//         "phone": phone,
//         "email": email,
//         "short_description": shortDescription,
//         "description": description,
//         "iban": iban,
//         "tax_id": taxId,
//         "address": address,
//         "latitude": latitude,
//         "longitude": longitude,
//         "city": city,
//         "state": state,
//         "postal_code": postalCode,
//         "country": country,
//         "featured_image": featuredImage,
//         "facebook_link": facebookLink,
//         "youtube_link": youtubeLink,
//         "twitter_link": twitterLink,
//         "instagram_link": instagramLink,
//         "website_link": websiteLink,
//         "admin_commission": adminCommission,
//         "customer_range": customerRange,
//         "status": status,
//         "deleted_at": deletedAt,
//         "created_at": createdAt?.toIso8601String(),
//         "updated_at": updatedAt?.toIso8601String(),
//         "country_code": countryCode,
//         "country_phone": countryPhone,
//         "is_closed": isClosed,
//         "receiving_order": receivingOrder,
//         "bag_fee": bagFee,
//         "time_slots": timeSlots,
//         "distance": distance,
//         "is_favourite": isFavourite,
//         "image_full_path": imageFullPath,
//         "rating": rating,
//         "bag_fee_in_euro": bagFeeInEuro,
//         "category_name": categoryName,
//       };
// }

// class Link {
//   final String? url;
//   final String? label;
//   final bool? active;

//   Link({
//     this.url,
//     this.label,
//     this.active,
//   });

//   Link copyWith({
//     String? url,
//     String? label,
//     bool? active,
//   }) =>
//       Link(
//         url: url ?? this.url,
//         label: label ?? this.label,
//         active: active ?? this.active,
//       );

//   factory Link.fromJson(Map<String, dynamic> json) => Link(
//         url: json["url"],
//         label: json["label"],
//         active: json["active"],
//       );

//   Map<String, dynamic> toJson() => {
//         "url": url,
//         "label": label,
//         "active": active,
//       };
// }
