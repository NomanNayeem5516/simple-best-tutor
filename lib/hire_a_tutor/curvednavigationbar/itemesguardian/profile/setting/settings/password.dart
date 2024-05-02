import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Password extends StatefulWidget {
  @override
  _PasswordState createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  TextEditingController _oldPasswordController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _oldPasswordController,
              decoration: InputDecoration(
                labelText: 'Enter your old password',
                errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Enter your new password',
                errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _confirmPasswordController,
              decoration: InputDecoration(
                labelText: 'Confirm your new password',
                errorText: _errorMessage.isNotEmpty ? _errorMessage : null,
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                String oldPassword = _oldPasswordController.text.trim();
                String newPassword = _passwordController.text.trim();
                String confirmPassword = _confirmPasswordController.text.trim();
                if (oldPassword.isNotEmpty && newPassword.isNotEmpty && confirmPassword.isNotEmpty) {
                  if (newPassword == confirmPassword) {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    String? accessToken = prefs.getString('access_token');
                    if (accessToken != null) {
                      _updatePassword(oldPassword, newPassword, accessToken);
                    } else {
                      // Handle case when access token is not available
                      print('Access token not found');
                    }
                  } else {
                    setState(() {
                      _errorMessage = 'Passwords do not match.';
                    });
                  }
                } else {
                  setState(() {
                    _errorMessage = 'Please fill all password fields.';
                  });
                }
              },
              child: Text('Update Password'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updatePassword(String oldPassword, String newPassword, String accessToken) async {
    final String apiUrl = 'https://api.besttutor.xyz/api/tutor/profileUpdate';

    try {
      final response = await http.put(
        Uri.parse(apiUrl),
        body: jsonEncode({
          'oldpass': oldPassword,
          'newpass': newPassword,
          'connewpass': newPassword
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          _errorMessage = 'Password updated successfully.';
        });
      } else {
        setState(() {
          _errorMessage = 'Failed to update password. Please try again.';
        });
      }
    } catch (error) {
      setState(() {
        _errorMessage = 'Failed to update password. Please try again.';
      });
    }
  }
}
