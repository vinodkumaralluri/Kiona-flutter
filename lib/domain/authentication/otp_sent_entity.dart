class OtpSentEntity {
  int statusCode;
  String message;
  OtpVerifyData data;

  OtpSentEntity({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory OtpSentEntity.fromJson(Map<String, dynamic> json) => OtpSentEntity(
        statusCode: json["status_code"],
        message: json["message"],
        data: OtpVerifyData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "data": data.toJson(),
      };
}

class OtpVerifyData {
  String userId;
  int otp;

  OtpVerifyData({
    required this.userId,
    required this.otp,
  });

  factory OtpVerifyData.fromJson(Map<String, dynamic> json) => OtpVerifyData(
        userId: json["user_id"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "otp": otp,
      };
}
