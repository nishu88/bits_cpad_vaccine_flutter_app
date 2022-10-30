import 'package:http/http.dart' as http;
import 'package:vaccine_ui/Users.dart';

class Services {
  //
  static const String url = 'http://10.0.2.2:8080/get_all_users';
  static Future<List<Users>> getUsers() async {
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        print(response.body);
        final List<Users> users = usersFromJson(response.body);
        print(users);
        return users;
      } else {
        return <Users>[];
      }
    } catch (e) {
      print(e);
      return <Users>[];
    }
  }
}
