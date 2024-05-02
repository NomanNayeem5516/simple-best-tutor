import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Area extends StatefulWidget {
  final String? selectedArea;
  final void Function(String?)? onChanged;
  const Area({this.selectedArea, this.onChanged});

  @override
  State<Area> createState() => _AreaState();
}

class _AreaState extends State<Area> {
  List<dynamic> area = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');
    final response = await http.get(Uri.parse('https://api.softpark.xyz/api/area?districtId=1'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    if (response.statusCode == 200) {
      setState(() {
        area = json.decode(response.body);
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
        labelText: 'Area',
      ),
      value: widget.selectedArea,
      hint: Text('Select Area'),
      items: area.map<DropdownMenuItem<String>>((dynamic area) {
        return DropdownMenuItem<String>(
          value: area['id'].toString(), // Change here
          child: Text(area['name']),
        );
      }).toList(),
      onChanged: widget.onChanged,
    );
  }
}
