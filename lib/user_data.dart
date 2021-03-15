// To parse this JSON data, do
//
//     final userData = userDataFromJson(jsonString);

import 'dart:convert';

UserData userDataFromJson(String str) => UserData.fromJson(json.decode(str));

String userDataToJson(UserData data) => json.encode(data.toJson());

class UserData {
  UserData({
    this.data,
    this.recordCount,
    this.status,
    this.message,
  });



  List<Datum> data;
  int recordCount;
  bool status;
  String message;

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    recordCount: json["recordCount"],
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "recordCount": recordCount,
    "status": status,
    "message": message,
  };


}

class Datum {
  Datum({
    this.deletedAt,
    this.createdAt,
    this.brandImageUrl,
    this.id,
    this.updatedAt,
    this.name,
  });

  dynamic deletedAt;
  dynamic createdAt;
  dynamic brandImageUrl;
  int id;
  dynamic updatedAt;
  String name;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    deletedAt: json["deleted_at"],
    createdAt: json["created_at"],
    brandImageUrl: json["brand_image_url"],
    id: json["id"],
    updatedAt: json["updated_at"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "deleted_at": deletedAt,
    "created_at": createdAt,
    "brand_image_url": brandImageUrl,
    "id": id,
    "updated_at": updatedAt,
    "name": name,
  };
  @override
  String toString() => name;

}
