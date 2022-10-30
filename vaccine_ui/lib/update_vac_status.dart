import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vaccine_ui/signup.dart';
import 'package:vaccine_ui/dashboard.dart';
import 'package:vaccine_ui/user.dart';
import 'package:vaccine_ui/student.dart';
import 'package:vaccine_ui/vaccine.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class AddStudent extends StatefulWidget {
  String coordinator_email;
  AddStudent({required this.coordinator_email});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final _formKey = GlobalKey<FormState>();

  Future save() async {
    var res = await http
        .post("http://10.0.2.2:8080/vaccine/update", headers: <String, String>{
      'Context-Type': 'application/json;charSet=UTF-8'
    }, body: <String, String>{
      'student_id': student.student_id,
      'student_name': student.student_name,
      'coordinator_email': widget.coordinator_email
    });
    // if(re.)
    // if (value.toString().isEmpty)
    print("-------------");
    print(student.student_id);
    print(student.student_name);
    print(widget.coordinator_email);
    print("-------------");

    print(res.statusCode);
    print(res.body);

    if (res.statusCode == 400) {
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(
        SnackBar(
          content: Text(res.body),
          action: SnackBarAction(label: 'Error', onPressed: () {}),
        ),
      );
    }
    if (res.statusCode == 200) {
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(
        SnackBar(
          content: Text(res.body),
          action: SnackBarAction(label: 'Success', onPressed: () {}),
        ),
      );
    }
  }

  Student student = Student('', '', '');
  @override
  Widget build(BuildContext context) {
    print(widget.coordinator_email);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Back'),
        ),
        body: Stack(
          children: [
            Positioned(
                top: 0,
                child: SvgPicture.asset(
                  'images/top.svg',
                  width: 400,
                  height: 150,
                )),
            Container(
              alignment: Alignment.center,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 150,
                    ),
                    Text(
                      "Add New Student",
                      style: GoogleFonts.pacifico(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.purple),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller:
                            TextEditingController(text: student.student_id),
                        onChanged: (value) {
                          student.student_id = value;
                          student.coordinator_email = widget.coordinator_email;
                        },
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.info_rounded,
                              color: Colors.blue,
                            ),
                            hintText: 'Enter Student ID',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.blue)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(color: Colors.black)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(color: Colors.red)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(color: Colors.red))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller:
                            TextEditingController(text: student.student_name),
                        onChanged: (value) {
                          student.student_name = value;
                        },
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Enter something';
                          }
                          return null;
                        },
                        obscureText: false,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.supervised_user_circle_outlined,
                              color: Colors.blue,
                            ),
                            hintText: 'Enter Student name',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16),
                                borderSide: BorderSide(color: Colors.blue)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(color: Colors.black)),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(color: Colors.red)),
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25),
                                borderSide: BorderSide(color: Colors.red))),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(55, 16, 16, 0),
                      child: Container(
                        height: 50,
                        width: 400,
                        child: TextButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.purple)),
                            // color: Colors.blue,
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(16.0)),
                            onPressed: () {
                              print(_formKey.currentState);

                              if (_formKey.currentState!.validate()) {
                                save();
                              } else {
                                print("not ok");
                              }
                            },
                            child: Text(
                              "Add/Register New Student",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
