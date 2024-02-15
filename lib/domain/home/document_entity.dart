class DocumentsEntity {
  int statusCode;
  String message;
  DocumentData data;

  DocumentsEntity({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  factory DocumentsEntity.fromJson(Map<String, dynamic> json) =>
      DocumentsEntity(
        statusCode: json["status_code"],
        message: json["message"],
        data: DocumentData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status_code": statusCode,
        "message": message,
        "data": data.toJson(),
      };
}

class DocumentData {
  String documentName;
  String documentType;
  String url;

  DocumentData({
    required this.documentName,
    required this.documentType,
    required this.url,
  });

  factory DocumentData.fromJson(Map<String, dynamic> json) => DocumentData(
        documentName: json["document_name"],
        documentType: json["document_type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "document_name": documentName,
        "document_type": documentType,
        "url": url,
      };
}
