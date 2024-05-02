import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HearAboutUsDropdown extends StatefulWidget {
  final String? selectedOption;
  final void Function(String?)? onChanged;

  HearAboutUsDropdown({this.selectedOption, this.onChanged});

  @override
  _HearAboutUsDropdownState createState() => _HearAboutUsDropdownState();
}

class _HearAboutUsDropdownState extends State<HearAboutUsDropdown> {
  List<Map<String, dynamic>> options = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('access_token');
      final response = await http.get(
        Uri.parse('https://api.softpark.xyz/api/hear-about-us'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          options = List<Map<String, dynamic>>.from(json.decode(response.body));
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching options: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(21),
          borderSide: BorderSide(color: Colors.deepOrange, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(21),
          borderSide: BorderSide(color: Colors.indigoAccent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(21),
          borderSide: BorderSide(color: Colors.amber),
        ),
        labelText: 'Hear About Us',
      ),
      value: widget.selectedOption,
      hint: Text('Select option'),
      items: options.map<DropdownMenuItem<String>>((option) {
        return DropdownMenuItem<String>(
          value: option['id'].toString(), // Assign ID, not name
          child: Text(option['name']),
        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          widget.onChanged?.call(newValue);
        });
      },
    );
  }
}
