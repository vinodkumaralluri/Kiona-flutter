// To parse this JSON data, do
//
//     final assigneeEntity = assigneeEntityFromJson(jsonString);

import 'dart:convert';

List<AssigneeEntity> assigneeEntityFromJson(String str) =>
    List<AssigneeEntity>.from(
        json.decode(str).map((x) => AssigneeEntity.fromJson(x)));

String assigneeEntityToJson(List<AssigneeEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AssigneeEntity {
  String name;
  String phoneNumber;

  AssigneeEntity({
    required this.name,
    required this.phoneNumber,
  });

  factory AssigneeEntity.fromJson(Map<String, dynamic> json) => AssigneeEntity(
        name: json["name"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone_number": phoneNumber,
      };
}
