import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../colors/colors.dart';
import '../routes/routesname.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
  TextEditingController();
  String _selectedTutorType = 'isGuardian';

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      final String apiUrl = 'https://api.softpark.xyz/api/register';

      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({
          'name': _nameController.text,
          'email': _emailController.text,
          'mobile': _mobileController.text,
          'password': _passwordController.text,
          'confirmPassword': _confirmPasswordController.text,
          'tutorType': _selectedTutorType,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 201) {
        print('Registration Successful!');
        print(response.body);

        if (_selectedTutorType == 'isGuardian') {
          Get.toNamed(RouteName.guardianotp);
        } else {
          Get.toNamed(RouteName.tutorotp);
        }
      } else {
        print('Registration Failed');
        print(response.statusCode);
        print(response.body);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide:
                        BorderSide(color: Colors.deepOrange, width: 2),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: BorderSide(color: Colors.indigoAccent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular((21)),
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25.h),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide:
                        BorderSide(color: Colors.deepOrange, width: 2),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: BorderSide(color: Colors.indigoAccent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular((21)),
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25.h),
                TextFormField(
                  controller: _mobileController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide:
                        BorderSide(color: Colors.deepOrange, width: 2),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: BorderSide(color: Colors.indigoAccent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular((21)),
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      labelText: 'Mobile'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mobile is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 25.h),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide:
                        BorderSide(color: Colors.deepOrange, width: 2),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: BorderSide(color: Colors.indigoAccent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular((21)),
                        borderSide: BorderSide(color: Colors.amber),
                      ),labelText: 'Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(

                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide:
                        BorderSide(color: Colors.deepOrange, width: 2),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: BorderSide(color: Colors.indigoAccent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular((21)),
                        borderSide: BorderSide(color: Colors.amber),
                      ),
                      labelText: 'Confirm Password'),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Confirm Password is required';
                    } else if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _selectedTutorType,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedTutorType = newValue!;
                    });
                  },
                  items: ['isGuardian', 'isTutor'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value == 'isGuardian' ? 'Guardian' : 'Tutor'),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide:
                        BorderSide(color: Colors.deepOrange, width: 2),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(21),
                        borderSide: BorderSide(color: Colors.indigoAccent),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular((21)),
                        borderSide: BorderSide(color: Colors.amber),
                      ),labelText: 'User Type'),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap:_register ,
                  child: Container(
                    height: 50,
                    width: 400,
                    child: Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 17, color: Appcolors.whiteColor),
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Appcolors.ashColor,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),

                Row(
                  children: [
                    Text('Do you have an account? Please'),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(RouteName.signinpage);
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(fontSize: 17),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
