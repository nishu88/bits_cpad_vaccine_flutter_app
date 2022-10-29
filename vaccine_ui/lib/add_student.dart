import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vaccine_ui/signup.dart';
import 'package:vaccine_ui/dashboard.dart';
import 'package:vaccine_ui/user.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final _formKey = GlobalKey<FormState>();

  // Future save() async {
  //   var res = await http.post("http://10.0.2.2:8080/add_student",
  //       headers: <String, String>{
  //         'Context-Type': 'application/json;charSet=UTF-8'
  //       },
  //       body: <String, String>{
  //         'email': user.email,
  //         'password': user.password
  //       });
  //   // if(re.)
  //   // if (value.toString().isEmpty)
  //   print("-------------");
  //   print(user.email);
  //   print(user.password);
  //   print("-------------");

  //   print(res.body);

  //   if (res.body != "null") {
  //     Navigator.push(context,
  //         new MaterialPageRoute(builder: (context) => HomePageWidget()));
  //     return null;
  //   }
// }

  // Student student = Student('', '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
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
                            TextEditingController(text: "user.password"),
                        onChanged: (value) {
                          // user.email = value;
                        },
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.email,
                              color: Colors.blue,
                            ),
                            hintText: 'Enter Email',
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
                            TextEditingController(text: "user.password"),
                        onChanged: (value) {
                          // user.password = value;
                        },
                        validator: (value) {
                          if (value.toString().isEmpty) {
                            return 'Enter something';
                          }
                          return null;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.vpn_key,
                              color: Colors.blue,
                            ),
                            hintText: 'Enter Password',
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
                                // save();
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
