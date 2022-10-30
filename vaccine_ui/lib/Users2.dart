// To parse this JSON data, do
//
//     final users2 = users2FromJson(jsonString);

import 'dart:convert';

List<Users2> users2FromJson(String str) =>
    List<Users2>.from(json.decode(str).map((x) => Users2.fromJson(x)));

String users2ToJson(List<Users2> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users2 {
  Users2({
    required this.id,
    required this.noOfVaccine,
    required this.date,
    required this.name,
    required this.v,
  });

  final String id;
  final int noOfVaccine;
  final String date;
  final String name;
  final int v;

  factory Users2.fromJson(Map<String, dynamic> json) => Users2(
        id: json["_id"],
        noOfVaccine: json["no_of_vaccine"],
        date: json["date"],
        name: json["name"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "no_of_vaccine": noOfVaccine,
        "date": date,
        "name": name,
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
