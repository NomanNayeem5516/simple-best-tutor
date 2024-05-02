import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Division extends StatefulWidget {
  final String? selectedDivision;
  final void Function(String?)? onChanged;
  Division({this.selectedDivision, this.onChanged});

  @override
  State<Division> createState() => _DivisionState();
}

class _DivisionState extends State<Division> {
  List<dynamic> division = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');
    final response = await http.get(Uri.parse('https://api.softpark.xyz/api/division?countryId=1'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      setState(() {
        division = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load data');
    }
  }
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
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
        labelText: 'Division',
      ),
      value: widget.selectedDivision,
      hint: Text('Select Division'),
      items: division.map<DropdownMenuItem<String>>((dynamic division) {
        return DropdownMenuItem<String>(
          value: division['id'].toString(), // Change here
          child: Text(division['name']),
        );
      }).toList(),
      onChanged: widget.onChanged,
    );;
  }
}
