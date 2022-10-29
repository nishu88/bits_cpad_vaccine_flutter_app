import 'package:flutter/material.dart';
import 'package:vaccine_ui/signin.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Signin(),
  ));
}
