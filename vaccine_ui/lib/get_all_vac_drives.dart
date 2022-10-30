import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vaccine_ui/signup.dart';
import 'package:vaccine_ui/dashboard.dart';
import 'package:vaccine_ui/user.dart';
import 'package:vaccine_ui/vac_drive.dart';
import 'package:vaccine_ui/get_all_vac_drives.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import 'package:vaccine_ui/Services2.dart';
import 'package:vaccine_ui/Users2.dart';

class JsonParseDemo2 extends StatefulWidget {
  //
  const JsonParseDemo2({super.key});

  @override
  _JsonParseDemo2State createState() => _JsonParseDemo2State();
}

class _JsonParseDemo2State extends State<JsonParseDemo2> {
  //
  List<Users2> _users = <Users2>[];
  bool _loading = true;
  @override
  void initState() {
    super.initState();
    _loading = true;
    Services2.getUsers().then((users) {
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
        title: Text(_loading ? 'Loading...' : 'Future Vaccination Drives'),
      ),
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: null == _users ? 0 : _users.length,
          itemBuilder: (context, index) {
            Users2 user = _users[index];
            return ListTile(
              title: Text("Student ID: " + user.name),
              subtitle: Text("Vac name: " + user.noOfVaccine.toString()),
              leading: Icon(Icons.label),
              trailing: Text("Date: " + user.date),
            );
          },
        ),
      ),
    );
  }
}
