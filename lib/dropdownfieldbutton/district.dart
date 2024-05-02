import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class District extends StatefulWidget {
  final String? selectedDistrict;
  final void Function(String?)? onChanged;

  const District({this.selectedDistrict, this.onChanged});

  @override
  State<District> createState() => _DistrictState();
}

class _DistrictState extends State<District> {
  List<dynamic> districts = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');
    final response = await http.get(
      Uri.parse('https://api.softpark.xyz/api/district?divisionId=1'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      setState(() {
        districts = json.decode(response.body);
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
        labelText: 'District',
      ),
      value: widget.selectedDistrict,
      hint: Text('Select District'),
      items: districts.map<DropdownMenuItem<String>>((dynamic district) {
        return DropdownMenuItem<String>(
          value: district['id'].toString(), // Change here
          child: Text(district['name']),
        );
      }).toList(),
      onChanged: widget.onChanged,
    );
  }
}
