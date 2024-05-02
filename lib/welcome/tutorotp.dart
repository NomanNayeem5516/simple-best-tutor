import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../routes/routesname.dart';

class Tutorotp extends StatelessWidget {
  const Tutorotp({Key? key});

  Future<void> _submitOTP(BuildContext context, String otp) async {
    try {
      // Your API endpoint URL
      final apiUrl = 'https://api.softpark.xyz/api/submit-verification';

      // Make a POST request to your API endpoint
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({
          'otp': otp,
        }),
        headers: {
          'Content-Type': 'application/json',
          // Add any additional headers if required
        },
      );

      // Check if the response is successful
      if (response.statusCode == 200) {
        // Navigate to the next page on success
        Get.toNamed(RouteName.curvednavbar2);
      } else {
        // Handle error response
        // Show an error message to the user
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Failed to verify OTP. Please try again.'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (error) {
      // Handle any errors that occur during the API call
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // Handle back button press
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.blue,
        ),
        title: Text("Tutor OTP"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 15),
            Text(
              "OTP Verification",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              "Enter the verification code we just sent your\nnumber",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Form(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 70,
                            width: 65,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21),
                                  borderSide: BorderSide(
                                    color: Colors.deepOrange,
                                    width: 2,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21),
                                  borderSide: BorderSide(
                                    color: Colors.indigoAccent,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21),
                                  borderSide: BorderSide(
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 70,
                            width: 65,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21),
                                  borderSide: BorderSide(
                                    color: Colors.deepOrange,
                                    width: 2,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21),
                                  borderSide: BorderSide(
                                    color: Colors.indigoAccent,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21),
                                  borderSide: BorderSide(
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 70,
                            width: 65,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).nextFocus();
                                }
                              },
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21),
                                  borderSide: BorderSide(
                                    color: Colors.deepOrange,
                                    width: 2,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21),
                                  borderSide: BorderSide(
                                    color: Colors.indigoAccent,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21),
                                  borderSide: BorderSide(
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 70,
                            width: 65,
                            child: TextFormField(
                              onChanged: (value) {
                                if (value.length == 1) {
                                  FocusScope.of(context).unfocus();
                                }
                              },
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(1),
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21),
                                  borderSide: BorderSide(
                                    color: Colors.deepOrange,
                                    width: 2,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21),
                                  borderSide: BorderSide(
                                    color: Colors.indigoAccent,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(21),
                                  borderSide: BorderSide(
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _submitOTP(context, '1234');
                    },
                    child: Text("Submit"),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text("Resend code in 111 sec"),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
