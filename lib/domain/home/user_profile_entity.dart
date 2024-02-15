class UserProfileEntity {
  int statusCode;
  String message;
  UserData data;

  UserProfileEntity({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory UserProfileEntity.fromJson(Map<String, dynamic> json) =>
      UserProfileEntity(
        statusCode: json["status_code"],
        message: json["message"],
        data: UserData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "data": data.toJson(),
      };
}

class UserData {
  String id;
  String userId;
  String fullName;
  String email;
  String phoneNumber;
  String photoUrl;
  String defaultNotification;
  String defaultReminder;
  DateTime createdAt;
  String createdBy;
  DateTime updatedAt;
  String updatedBy;
  int status;
  int v;

  UserData({
    required this.id,
    required this.userId,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.photoUrl,
    required this.defaultNotification,
    required this.defaultReminder,
    required this.createdAt,
    required this.createdBy,
    required this.updatedAt,
    required this.updatedBy,
    required this.status,
    required this.v,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
        id: json["_id"],
        userId: json["user_id"],
        fullName: json["full_name"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        photoUrl: json["photo_url"],
        defaultNotification: json["default_notification"],
        defaultReminder: json["default_reminder"],
        createdAt: DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        updatedAt: DateTime.parse(json["updated_at"]),
        updatedBy: json["updated_by"],
        status: json["status"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user_id": userId,
        "full_name": fullName,
        "email": email,
        "phone_number": phoneNumber,
        "photo_url": photoUrl,
        "default_notification": defaultNotification,
        "default_reminder": defaultReminder,
        "created_at": createdAt.toIso8601String(),
        "created_by": createdBy,
        "updated_at": updatedAt.toIso8601String(),
        "updated_by": updatedBy,
        "status": status,
        "__v": v,
      };
}
