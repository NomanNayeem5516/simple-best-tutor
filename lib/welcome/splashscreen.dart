import 'dart:async';

import 'package:finalbesttutor/routes/routesname.dart';
import 'package:finalbesttutor/welcome/welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () =>Get.toNamed(RouteName.welcomepage));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Change to match your splash screen background color
      body: Center(
        child: Image.asset('images/a.jpg'), // Change the path as per your image location
      ),
    );
  }
}

