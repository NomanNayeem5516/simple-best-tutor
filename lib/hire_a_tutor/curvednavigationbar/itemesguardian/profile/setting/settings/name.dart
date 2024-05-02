import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class Name extends StatefulWidget {
  @override
  _NameState createState() => _NameState();
}

class _NameState extends State<Name> {
  TextEditingController _nameController = TextEditingController();

  Future<void> _updateProfile(String name, String accessToken) async {
    final url = Uri.parse('https://api.besttutor.xyz/api/tutor/profileUpdate');
    final Map<String, String> requestBody = {
      'name': name,
    };

    try {
      final response = await http.post(
        url,
        body: jsonEncode(requestBody),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        // Handle success response
        print('Profile updated successfully');
      } else {
        // Handle error response
        print('Failed to update profile: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network error
      print('Network error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Update'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Enter your name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String name = _nameController.text.trim();
                if (name.isNotEmpty) {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  String? accessToken = prefs.getString('access_token');
                  if (accessToken != null) {
                    _updateProfile(name, accessToken);
                  } else {
                    // Handle case when access token is not available
                    print('Access token not found');
                  }
                } else {
                  // Show error message if name is empty
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please enter your name'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Update Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
