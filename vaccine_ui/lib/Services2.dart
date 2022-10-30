import 'package:http/http.dart' as http;
import 'package:vaccine_ui/Users2.dart';
import 'dart:convert';

class Services2 {
  //
  static const String url =
      'http://10.0.2.2:8080/vaccine_drive/future_vac_drives';
  static Future<List<Users2>> getUsers() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        print(json.decode(response.body)["vaccine_drive"]);
        final List<Users2> users = users2FromJson(
            json.encode(json.decode(response.body)["vaccine_drive"]));
        print(users);
        return users;
      } else {
        return <Users2>[];
      }
    } catch (e) {
      print(e);
      return <Users2>[];
    }
  }
}
