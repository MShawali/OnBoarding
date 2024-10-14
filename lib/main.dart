import 'package:doctor_app/view/onboarding.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DoctorApp());
}

class DoctorApp extends StatelessWidget {
  const DoctorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Anton",
      ),
      debugShowCheckedModeBanner: false,
      home: const OnBoarding(),
    );
  }
}