
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../colors/colors.dart';
import '../routes/routesname.dart';

class LoginPage2 extends StatefulWidget {
  @override
  _LoginPage2State createState() => _LoginPage2State();
}

class _LoginPage2State extends State<LoginPage2> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _selectedRole = 'tutor';
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  _checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      String role = prefs.getString('role') ?? 'tutor';
      Get.offNamed(
          role == 'tutor' ? RouteName.curvednavbar2 : RouteName.curvednavbar);
    }
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      const String apiUrl = 'https://api.softpark.xyz/api/login';

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('access_token');

      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode({
          'mobile': _mobileController.text,
          'password': _passwordController.text,
          'role': _selectedRole,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        print('Login Successful!');
        print(response.body);
        Map<String, dynamic> responseData = jsonDecode(response.body);
        bool success = responseData['success'];
        if(success){
          print('Login Successful!');
          String accessToken = responseData['access_token'];
          String role = responseData['role'];

          await prefs.setBool('isLoggedIn', true);
          await prefs.setString('role', role);
          await prefs.setString('access_token', accessToken);

          Get.offNamed(_selectedRole == 'tutor'
              ? RouteName.curvednavbar2
              : RouteName.curvednavbar);
        }

      } else {
        // Handle errors
        print('Login Failed');
        print(response.statusCode);
        print(response.body);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        centerTitle: true,
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
                    labelText: 'Mobile',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Mobile is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.h),
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
                    ),
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _selectedRole,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedRole = newValue!;
                    });
                  },
                  items: ['tutor', 'guardian'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
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
                    ),
                    labelText: 'Role',
                  ),
                ),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: _login,
                  child: Container(
                    height: 50,
                    width: 400,
                    child: Center(
                      child: Text(
                        'Log In',
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
                SizedBox(height: 20.h),
                Row(
                  children: [
                    Text('Don\'t have an account? Please'),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(RouteName.registrationpage);
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(fontSize: 17),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                SvgPicture.asset(
                  'icons/abcd.svg',
                  height: 100.h,
                  width: 150.w,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}