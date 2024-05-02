import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pin_code_fields/pin_code_fields.dart';

import '../routes/routesname.dart';





class Guardianotp extends StatefulWidget {
  @override
  _GuardianotpState createState() => _GuardianotpState();
}

class _GuardianotpState extends State<Guardianotp> {
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  Future<void> submitVerification(String phoneNumber, String otp) async {
    final url = 'https://api.softpark.xyz/api/submit-verification';
    final response = await http.post(
      Uri.parse(url),
      body: {'mobile': phoneNumber, 'enteredNumber': otp},
    );

    if (response.statusCode == 200) {
      // Verification successful
      print('Verification successful');
      Get.toNamed(RouteName.curvednavbar);
    } else {
      // Verification failed
      print('Verification failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Verification Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Phone Number',
              ),
            ),
            SizedBox(height: 20),
            PinCodeTextField(
              appContext: context,
              controller: _otpController,
              keyboardType: TextInputType.number,
              length: 6,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                submitVerification(
                  _phoneNumberController.text,
                  _otpController.text,
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
