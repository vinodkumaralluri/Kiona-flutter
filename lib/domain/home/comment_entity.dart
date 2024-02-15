class CommentsEntity {
  int statusCode;
  String message;
  CommentData data;

  CommentsEntity({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory CommentsEntity.fromJson(Map<String, dynamic> json) => CommentsEntity(
        statusCode: json["status_code"],
        message: json["message"],
        data: CommentData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "data": data.toJson(),
      };
}

class CommentData {
  List<ListElement> list;
  int count;

  CommentData({
    required this.list,
    required this.count,
  });

  factory CommentData.fromJson(Map<String, dynamic> json) => CommentData(
        list: List<ListElement>.from(
            json["list"].map((x) => ListElement.fromJson(x))),
        count: json["count"],
      );

  Map<String, dynamic> toJson() => {
        "list": List<dynamic>.from(list.map((x) => x.toJson())),
        "count": count,
      };
}

class ListElement {
  String id;
  String commentId;
  String comment;
  List<dynamic> documents;
  String user;
  String userPhoto;
  DateTime createdAt;
  int status;

  ListElement({
    required this.id,
    required this.commentId,
    required this.comment,
    required this.documents,
    required this.user,
    required this.userPhoto,
    required this.createdAt,
    required this.status,
  });

  factory ListElement.fromJson(Map<String, dynamic> json) => ListElement(
        id: json["_id"],
        commentId: json["comment_id"],
        comment: json["comment"],
        documents: List<dynamic>.from(json["documents"].map((x) => x)),
        user: json["user"],
        userPhoto: json["user_photo"],
        createdAt: DateTime.parse(json["created_at"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "comment_id": commentId,
        "comment": comment,
        "documents": List<dynamic>.from(documents.map((x) => x)),
        "user": user,
        "user_photo": userPhoto,
        "created_at": createdAt.toIso8601String(),
        "status": status,
      };
}
