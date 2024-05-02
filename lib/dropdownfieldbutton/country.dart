import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Other import statements...

class CountryDropdown extends StatefulWidget {
  final String? selectedCountry;
  final void Function(String?)? onChanged;

  const CountryDropdown({this.selectedCountry, this.onChanged});

  @override
  _CountryDropdownState createState() => _CountryDropdownState();
}

class _CountryDropdownState extends State<CountryDropdown> {
  List<dynamic> countries = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');
    final response = await http.get(
      Uri.parse('https://api.softpark.xyz/api/country'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      setState(() {
        countries = json.decode(response.body);
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
        labelText: 'Country',
      ),
      value: widget.selectedCountry,
      hint: Text('Select Country'),
      items: countries.map<DropdownMenuItem<String>>((dynamic country) {
        return DropdownMenuItem<String>(
          value: country['id'].toString(), // Use country ID as value
          child: Text(country['name']),
        );
      }).toList(),
      onChanged: widget.onChanged, // Call the callback function
    );
  }
}
