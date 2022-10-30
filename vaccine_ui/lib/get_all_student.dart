import 'package:flutter/material.dart';
import 'package:vaccine_ui/Services.dart';
import 'package:vaccine_ui/Users.dart';

class JsonParseDemo extends StatefulWidget {
  //
  JsonParseDemo() : super();
  @override
  _JsonParseDemoState createState() => _JsonParseDemoState();
}

class _JsonParseDemoState extends State<JsonParseDemo> {
  //
  List<Users> _users = <Users>[];
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getUsers().then((users) {
      setState(() {
        print(users);
        _users = users;
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_loading ? 'Loading...' : 'All Users'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _users ? 0 : _users.length,
          itemBuilder: (context, index) {
            Users user = _users[index];
            return ListTile(
              title: Text(user.email),
              subtitle: Text(user.password),
            );
          },
        ),
      ),
    );
  }
}
