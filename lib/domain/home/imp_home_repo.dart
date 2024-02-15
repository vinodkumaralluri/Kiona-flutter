// Package imports:

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:project_x_task_management_freelance/domain/home/assignee_list_entity.dart';
import 'package:project_x_task_management_freelance/domain/home/document_entity.dart';

abstract class ImpHomeRepository {
  Future<Response> getTask();
  Future<Response> getUserTask();
  Future<http.StreamedResponse> uploadDocs(File file, bool isProfile);
  Future createTask({
    required String taskName,
    String? taskId,
    required String taskDescription,
    required List<AssigneeEntity> assignees,
    required String dueDate,
    required String dueTime,
    required String priority,
    required List<String> notificationMode,
    required List<dynamic> reminders,
    required List<DocumentData> documents,
    required bool isTaskUpdate,
  });

  Future<Response> addComment({
    required String taskId,
    required String comment,
    required List<DocumentData> documents,
  });

  Future<Response> getComments({required String taskId});
  Future<Response> deleteComments({required String commentId});
  Future<Response> deleteTask({required String taskId});
  Future<Response> updateTaskStatus(
      {required String taskId, required String status});
  Future<Response> getUserProfile();
  Future<Response> updateUserProfile({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String defaultNotification,
    required String defaultReminder,
    required dynamic profilePhoto,
  });
}
