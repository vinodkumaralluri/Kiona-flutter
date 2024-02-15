// Package imports:

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

abstract class ImpAuthRepository {
  Future<Response> sendOTP(String phoneNumber);
  Future<Response> verifyOTP(String otp, String userId);
  Future<Response> updateUserProfile({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String defaultNotification,
    required String defaultReminder,
    dynamic profilePhoto,
  });
  Future<http.StreamedResponse> uploadDocs(File file);
}
