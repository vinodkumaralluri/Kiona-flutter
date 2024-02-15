import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:mime/mime.dart';
import 'package:project_x_task_management_freelance/core/api_client.dart';
import 'package:project_x_task_management_freelance/core/prefs.dart';
import 'package:project_x_task_management_freelance/domain/home/assignee_list_entity.dart';
import 'package:project_x_task_management_freelance/domain/home/document_entity.dart';
import 'package:project_x_task_management_freelance/domain/home/imp_home_repo.dart';
import 'package:project_x_task_management_freelance/injection/injection.dart';
import 'package:project_x_task_management_freelance/utils/color.dart';
import 'package:project_x_task_management_freelance/utils/logger.dart';
import 'package:project_x_task_management_freelance/utils/toast.dart';

@LazySingleton(as: ImpHomeRepository)
class HomeRepo extends ImpHomeRepository {
  final APIClient apiClient;

  HomeRepo(this.apiClient);

  @override
  Future<Response> getTask() async {
    final response = await apiClient.get("/tasks/getTasks");
    logger.i("/tasks/getTasks: $response");
    return response;
  }

  @override
  Future<Response> getUserTask() async {
    final response = await apiClient.get("/tasks/getTasksByUser");
    logger.i("/tasks/getTasksByUser/: $response");
    return response;
  }

  @override
  Future<http.StreamedResponse> uploadDocs(File file, bool isProfile) async {
    String getMimeType(String filePath) {
      final mimeTypeResolver = MimeTypeResolver();
      return mimeTypeResolver.lookup(filePath)!;
    }

    String mimeType = getMimeType(file.path);
    logger.i(mimeType);
    logger.i(file.path);

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(isProfile
          ? "http://13.234.113.105:3000/users/upload_photo"
          : "http://13.234.113.105:3000/tasks/upload_document"),
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

  @override
  Future createTask({
    required String taskName,
    required String taskDescription,
    String? taskId,
    required List<AssigneeEntity> assignees,
    required String dueDate,
    required String dueTime,
    required String priority,
    required List<String> notificationMode,
    required List<dynamic> reminders,
    required List<DocumentData> documents,
    required bool isTaskUpdate,
  }) async {
    try {
      final response = isTaskUpdate
          ? await apiClient.put(
              "/tasks/editTask/$taskId",
              data: {
                "task_title": taskName,
                "description": taskDescription,
                "assigned_to": jsonEncode(assignees),
                "due_date": dueDate,
                "due_time": dueTime,
                "priority": priority,
                "notification_modes": notificationMode,
                "reminders": reminders,
                "documents": documents
              },
            )
          : await apiClient.post(
              "/tasks/addTask",
              data: {
                "task_title": taskName,
                "description": taskDescription,
                "assigned_to": assignees,
                "due_date": dueDate,
                "due_time": dueTime,
                "priority": priority,
                "notification_modes": notificationMode,
                "reminders": reminders,
                "documents": documents
              },
            );
      logger.i("/tasks/addTask : $response");
      return response;
    } catch (e) {
      showToast(e.toString(), redColor);
      logger.e(e);
    }
  }

  @override
  Future<Response> addComment({
    required String taskId,
    required String comment,
    required List<DocumentData> documents,
  }) async {
    final response = await apiClient.post(
      "/comments/addComment",
      data: {"task_id": taskId, "comment": comment, "documents": documents},
    );
    logger.i("/comments/addComment : $response");
    return response;
  }

  @override
  Future<Response> getComments({required String taskId}) async {
    final response = await apiClient.get("/comments/getComments/$taskId");
    logger.i("/comments/getComments/$taskId : $response");
    return response;
  }

  @override
  Future<Response> deleteTask({required String taskId}) async {
    final response = await apiClient.delete("/tasks/deleteTask/$taskId");
    logger.i("/tasks/deleteTask/$taskId : $response");
    return response;
  }

  @override
  Future<Response> updateTaskStatus(
      {required String taskId, required String status}) async {
    final response = await apiClient
        .put("/tasks/task_status/$taskId", data: {"task_status": status});
    logger.i("/tasks/task_status/$taskId : $response");
    return response;
  }

  @override
  Future<Response> getUserProfile() async {
    final response = await apiClient.get("/users/getUserdetails");
    logger.i("/users/getUserdetails: $response");
    return response;
  }

  @override
  Future<Response> updateUserProfile({
    required String fullName,
    required String email,
    required String phoneNumber,
    required String defaultNotification,
    required String defaultReminder,
    required dynamic profilePhoto,
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
  Future<Response> deleteComments({required String commentId}) async {
    final response =
        await apiClient.delete("/comments/deleteComment/$commentId");
    logger.i("/comments/deleteComment/$commentId : $response");
    return response;
  }
}
