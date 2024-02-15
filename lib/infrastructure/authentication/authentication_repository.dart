import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:mime/mime.dart';
import 'package:project_x_task_management_freelance/core/api_client.dart';
import 'package:project_x_task_management_freelance/core/prefs.dart';
import 'package:project_x_task_management_freelance/domain/authentication/imp_auth_repo.dart';
import 'package:project_x_task_management_freelance/injection/injection.dart';
import 'package:project_x_task_management_freelance/utils/logger.dart';

@LazySingleton(as: ImpAuthRepository)
class AuthenticationRepo extends ImpAuthRepository {
  final APIClient apiClient;

  AuthenticationRepo(this.apiClient);

  @override
  Future<Response> sendOTP(String phoneNumber) async {
    final response = await apiClient.post(
      "/auth/login",
      data: {"phone_number": phoneNumber},
    );
    logger.i("/auth/login : $response");
    return response;
  }

  @override
  Future<Response> verifyOTP(String otp, String userId) async {
    final response = await apiClient.post(
      "/auth/verify",
      data: {"user_id": userId, "otp": otp},
    );
    logger.i("/auth/verify : $response");
    return response;
  }

  @override
  Future<Response> updateUserProfile({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String defaultNotification,
    required String defaultReminder,
    dynamic profilePhoto,
  }) async {
    final response = await apiClient.post(
      "/users/updateUser",
      data: {
        "full_name": fullName,
        "email": email,
        "phone_number": phoneNumber,
        "default_notification": defaultNotification,
        "default_reminder": defaultReminder,
        "profile_photo": profilePhoto
      },
    );
    logger.i("/users/updateUser : $response");
    return response;
  }

  @override
  Future<http.StreamedResponse> uploadDocs(File file) async {
    String getMimeType(String filePath) {
      final mimeTypeResolver = MimeTypeResolver();
      return mimeTypeResolver.lookup(filePath)!;
    }

    String mimeType = getMimeType(file.path);
    logger.i(mimeType);
    logger.i(file.path);

    var request = http.MultipartRequest(
      'POST',
      Uri.parse("http://13.234.113.105:3000/users/upload_photo"),
    );

    // Add the file to the request
    var multipartFile = await http.MultipartFile.fromPath(
      'file',
      file.path,
    );
    var headers = {
      'Authorization': 'Bearer ${getIt<AppPrefs>().token.getValue()}'
    };
    request.headers.addAll(headers);
    request.files.add(multipartFile);
    // Send the request
    final response = await request.send();

    return response;
  }
}
