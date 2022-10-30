// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  Users({
    required this.id,
    required this.studentId,
    required this.vaccinationStatus,
    required this.date,
    required this.vacType,
    required this.v,
  });

  final String id;
  final String studentId;
  final String vaccinationStatus;
  final String date;
  final String vacType;
  final int v;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["_id"],
        studentId: json["student_id"],
        vaccinationStatus: json["vaccination_status"],
        date: json["date"],
        vacType: json["vac_type"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "student_id": studentId,
        "vaccination_status": vaccinationStatus,
        "date": date,
        "vac_type": vacType,
        "__v": v,
      };
}

class Id {
  Id({
    required this.oid,
  });

  final String oid;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
        oid: json["\u0024oid"],
      );

  Map<String, dynamic> toJson() => {
        "\u0024oid": oid,
      };
}

// // To parse this JSON data, do
// //
// //     final users = usersFromJson(jsonString);

// import 'dart:convert';

// List<Users> usersFromJson(String str) =>
//     List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

// String usersToJson(List<Users> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Users {
//   Users({
//     required this.id,
//     required this.email,
//     required this.password,
//     required this.v,
//   });

//   final String id;
//   final String email;
//   final String password;
//   final int v;

//   factory Users.fromJson(Map<String, dynamic> json) => Users(
//         id: json["_id"],
//         email: json["email"],
//         password: json["password"],
//         v: json["__v"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "email": email,
//         "password": password,
//         "__v": v,
//       };
// }

// class Id {
//   Id({
//     required this.oid,
//   });

//   final String oid;

//   factory Id.fromJson(Map<String, dynamic> json) => Id(
//         oid: json["\u0024oid"],
//       );

//   Map<String, dynamic> toJson() => {
//         "\u0024oid": oid,
//       };
// }
