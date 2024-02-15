class UserVerifiedEntity {
  int statusCode;
  String message;
  UserVerifyData data;

  UserVerifiedEntity({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory UserVerifiedEntity.fromJson(Map<String, dynamic> json) =>
      UserVerifiedEntity(
        statusCode: json["status_code"],
        message: json["message"],
        data: UserVerifyData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "data": data.toJson(),
      };
}

class UserVerifyData {
  String userId;
  bool is2FaEnabled;
  String phoneNumber;
  String userType;
  bool firstTimeLogin;
  String accessToken;

  UserVerifyData({
    required this.userId,
    required this.is2FaEnabled,
    required this.phoneNumber,
    required this.userType,
    required this.firstTimeLogin,
    required this.accessToken,
  });

  factory UserVerifyData.fromJson(Map<String, dynamic> json) => UserVerifyData(
        userId: json["user_id"],
        is2FaEnabled: json["is2FaEnabled"],
        phoneNumber: json["phone_number"],
        userType: json["user_type"],
        firstTimeLogin: json["firstTime_login"],
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "is2FaEnabled": is2FaEnabled,
        "phone_number": phoneNumber,
        "user_type": userType,
        "firstTime_login": firstTimeLogin,
        "access_token": accessToken,
      };
}
