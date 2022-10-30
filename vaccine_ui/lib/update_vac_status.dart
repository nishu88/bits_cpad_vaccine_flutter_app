import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vaccine_ui/signup.dart';
import 'package:vaccine_ui/dashboard.dart';
import 'package:vaccine_ui/user.dart';
import 'package:vaccine_ui/student.dart';
import 'package:vaccine_ui/vaccine.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class UpdateVacStatus extends StatefulWidget {
  String coordinator_email;
  UpdateVacStatus({required this.coordinator_email});

  @override
  State<UpdateVacStatus> createState() => _UpdateVacStatusState();
}

class _UpdateVacStatusState extends State<UpdateVacStatus> {
  final _formKey = GlobalKey<FormState>();

  Future save() async {
    var res = await http
        .post("http://10.0.2.2:8080/vaccine/update", headers: <String, String>{
      'Context-Type': 'application/json;charSet=UTF-8'
    }, body: <String, String>{
      'student_id': vaccine.student_id,
      'date': "30/10/2022",
      'vaccination_status': "true",
      'vac_type': vaccine.vac_type,
      'coordinator_email': widget.coordinator_email
    });
    // if(re.)
    // if (value.toString().isEmpty)
    print("-------------");
    print(vaccine.student_id);
    print(vaccine.vac_type);
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

  Vaccine vaccine = Vaccine('', '', '', '');
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
                      "Update Vac Status",
                      style: GoogleFonts.pacifico(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.orange),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller:
                            TextEditingController(text: vaccine.student_id),
                        onChanged: (value) {
                          vaccine.student_id = value;
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
                            TextEditingController(text: vaccine.vac_type),
                        onChanged: (value) {
                          vaccine.vac_type = value;
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
                            hintText: 'Enter Vac name',
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
                                    MaterialStateProperty.all(Colors.orange)),
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
                              "Update Vac Status for Student",
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
