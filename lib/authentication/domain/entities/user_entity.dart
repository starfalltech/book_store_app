// To parse this JSON data, do
//
//     final userEntity = userEntityFromJson(jsonString);

import 'dart:convert';

UserEntity userEntityFromJson(String str) => UserEntity.fromJson(json.decode(str));

class UserEntity {
  bool status;
  Response response;

  UserEntity({
    required this.status,
    required this.response,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
    status: json["status"],
    response: Response.fromJson(json["response"]),
  );

}

class Response {
  String error;
  String message;

  Response({
    required this.error,
    required this.message,


  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    error: json["Error"],
    message: json["Message"],

  );

}
