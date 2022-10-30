import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vaccine_ui/signup.dart';
import 'package:vaccine_ui/dashboard.dart';
import 'package:vaccine_ui/user.dart';
import 'package:vaccine_ui/vac_drive.dart';
import 'package:vaccine_ui/get_all_vac_drives.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class AddVacDrive extends StatefulWidget {
  const AddVacDrive({super.key});

  @override
  State<AddVacDrive> createState() => _AddVacDriveState();
}

class _AddVacDriveState extends State<AddVacDrive> {
  final _formKey = GlobalKey<FormState>();

  Future save() async {
    var res = await http.post(
        "http://10.0.2.2:8080/vaccine_drive/reg_new_vac_drive",
        headers: <String, String>{
          'Context-Type': 'application/json;charSet=UTF-8'
        },
        body: <String, String>{
          'date': vac_drive.date,
          'name': vac_drive.name,
          'no_of_vaccine': vac_drive.no_of_vaccine,
        });
    // if(re.)
    // if (value.toString().isEmpty)
    print("-------------");
    print(vac_drive.date);
    print(vac_drive.name);
    print("-------------");

    print(res.body);

    //   if (res.body != "null") {
    //     Navigator.push(
    //         context, new MaterialPageRoute(builder: (context) => GetVacDrives()));
    //     return null;
    //   }
  }

  Vaccine_Drive vac_drive = Vaccine_Drive('', '', '');

  @override
  Widget build(BuildContext context) {
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
                      "Add New VacDrive",
                      style: GoogleFonts.pacifico(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.green),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextFormField(
                        controller: TextEditingController(text: vac_drive.date),
                        onChanged: (value) {
                          vac_drive.date = value;
                        },
                        decoration: InputDecoration(
                            icon: Icon(
                              Icons.date_range,
                              color: Colors.blue,
                            ),
                            hintText: 'Enter Date of Vaccine Drive',
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
                        controller: TextEditingController(text: vac_drive.name),
                        onChanged: (value) {
                          vac_drive.name = value;
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
                            hintText: 'Enter Name of Vaccine',
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
                        controller: TextEditingController(
                            text: vac_drive.no_of_vaccine),
                        onChanged: (value) {
                          vac_drive.no_of_vaccine = value;
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
                              Icons.numbers,
                              color: Colors.blue,
                            ),
                            hintText: 'Enter No. of Vaccines available',
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
                                    MaterialStateProperty.all(Colors.green)),
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
                              "Add/Register New VacDrive",
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
