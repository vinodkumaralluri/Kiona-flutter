// ignore_for_file: public_member_api_docs, sort_constructors_first
class TasksEntity {
  int statusCode;
  String message;
  TaskData data;

  TasksEntity({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory TasksEntity.fromJson(Map<String, dynamic> json) => TasksEntity(
        statusCode: json["status_code"],
        message: json["message"],
        data: TaskData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "data": data.toJson(),
      };
}

class TaskData {
  List<Task> mytasks;
  List<Task> assignedtasks;

  TaskData({
    required this.mytasks,
    required this.assignedtasks,
  });

  factory TaskData.fromJson(Map<String, dynamic> json) => TaskData(
        mytasks: List<Task>.from(json["mytasks"].map((x) => Task.fromJson(x))),
        assignedtasks:
            List<Task>.from(json["assignedtasks"].map((x) => Task.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mytasks": List<dynamic>.from(mytasks.map((x) => x.toJson())),
        "assignedtasks":
            List<dynamic>.from(assignedtasks.map((x) => x.toJson())),
      };
}

class Task {
  String id;
  String taskId;
  String taskTitle;
  String description;
  String dueDate;
  String dueTime;
  String priority;
  List<Document> documents;
  List<String> notificationModes;
  List<Reminder> reminders;
  String taskStatus;
  DateTime createdAt;
  String createdBy;
  int status;
  List<AssignedTo> assignedTo;

  Task({
    required this.id,
    required this.taskId,
    required this.taskTitle,
    required this.description,
    required this.dueDate,
    required this.dueTime,
    required this.priority,
    required this.documents,
    required this.notificationModes,
    required this.reminders,
    required this.taskStatus,
    required this.createdAt,
    required this.createdBy,
    required this.status,
    required this.assignedTo,
  });

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["_id"],
        taskId: json["task_id"],
        taskTitle: json["task_title"],
        description: json["description"],
        dueDate: json["due_date"],
        dueTime: json["due_time"],
        priority: json["priority"],
        documents: List<Document>.from(
            json["documents"].map((x) => Document.fromJson(x))),
        notificationModes:
            List<String>.from(json["notification_modes"].map((x) => x)),
        reminders: List<Reminder>.from(
            json["reminders"].map((x) => Reminder.fromJson(x))),
        taskStatus: json["task_status"],
        createdAt: DateTime.parse(json["created_at"]),
        createdBy: json["created_by"],
        status: json["status"],
        assignedTo: List<AssignedTo>.from(
            json["assigned_to"].map((x) => AssignedTo.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "task_id": taskId,
        "task_title": taskTitle,
        "description": description,
        "due_date": dueDate,
        "due_time": dueTime,
        "priority": priority,
        "documents": List<dynamic>.from(documents.map((x) => x.toJson())),
        "notification_modes":
            List<dynamic>.from(notificationModes.map((x) => x)),
        "reminders": List<dynamic>.from(reminders.map((x) => x.toJson())),
        "task_status": taskStatus,
        "created_at": createdAt.toIso8601String(),
        "created_by": createdBy,
        "status": status,
        "assigned_to": List<dynamic>.from(assignedTo.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'Task(id: $id, taskId: $taskId, taskTitle: $taskTitle, description: $description, dueDate: $dueDate, dueTime: $dueTime, priority: $priority, documents: $documents, notificationModes: $notificationModes, reminders: $reminders, taskStatus: $taskStatus, createdAt: $createdAt, createdBy: $createdBy, status: $status, assignedTo: $assignedTo)';
  }
}

class AssignedTo {
  String userId;
  String name;
  String phoneNumber;
  String photoUrl;

  AssignedTo({
    required this.userId,
    required this.name,
    required this.phoneNumber,
    required this.photoUrl,
  });

  factory AssignedTo.fromJson(Map<String, dynamic> json) => AssignedTo(
        userId: json["user_id"],
        name: json["name"],
        phoneNumber: json["phone_number"],
        photoUrl: json["photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "name": name,
        "phone_number": phoneNumber,
        "photo_url": photoUrl,
      };

  @override
  String toString() {
    return 'AssignedTo(userId: $userId, name: $name, phoneNumber: $phoneNumber, photoUrl: $photoUrl)';
  }
}

class Document {
  String documentName;
  String documentType;
  String url;
  int status;
  String id;

  Document({
    required this.documentName,
    required this.documentType,
    required this.url,
    required this.status,
    required this.id,
  });

  factory Document.fromJson(Map<String, dynamic> json) => Document(
        documentName: json["document_name"],
        documentType: json["document_type"],
        url: json["url"],
        status: json["status"],
        id: json["_id"],
      );

  Map<String, dynamic> toJson() => {
        "document_name": documentName,
        "document_type": documentType,
        "url": url,
        "status": status,
        "_id": id,
      };

  @override
  String toString() {
    return 'Document(documentName: $documentName, documentType: $documentType, url: $url, status: $status, id: $id)';
  }
}

class Reminder {
  String reminderType;
  String startDate;
  String time;
  String dayOfWeek;
  int dayOfMonth;
  String month;

  Reminder({
    required this.reminderType,
    required this.startDate,
    required this.time,
    required this.dayOfWeek,
    required this.dayOfMonth,
    required this.month,
  });

  factory Reminder.fromJson(Map<String, dynamic> json) => Reminder(
        reminderType: json["reminder_type"],
        startDate: json["start_date"],
        time: json["time"],
        dayOfWeek: json["day_of_week"],
        dayOfMonth: json["day_of_month"],
        month: json["month"],
      );

  Map<String, dynamic> toJson() => {
        "reminder_type": reminderType,
        "start_date": startDate,
        "time": time,
        "day_of_week": dayOfWeek,
        "day_of_month": dayOfMonth,
        "month": month,
      };

  @override
  String toString() {
    return 'Reminder(reminderType: $reminderType, startDate: $startDate, time: $time, dayOfWeek: $dayOfWeek, dayOfMonth: $dayOfMonth, month: $month)';
  }
}
