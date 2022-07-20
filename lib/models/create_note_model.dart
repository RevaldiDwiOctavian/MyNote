// To parse this JSON data, do
//
//     final createNoteModel = createNoteModelFromJson(jsonString);

import 'dart:convert';

List<CreateNoteModel> createNoteModelFromJson(String str) =>
    List<CreateNoteModel>.from(
        json.decode(str).map((x) => CreateNoteModel.fromJson(x)));

String createNoteModelToJson(List<CreateNoteModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CreateNoteModel {
  CreateNoteModel({
    required this.title,
    required this.body,
    required this.isPublic,
    required this.userId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String title;
  String body;
  String isPublic;
  String userId;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory CreateNoteModel.fromJson(Map<String, dynamic> json) =>
      CreateNoteModel(
        title: json["title"],
        body: json["body"],
        isPublic: json["is_public"],
        userId: json["user_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "is_public": isPublic,
        "user_id": userId,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
