import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Tutiontype extends StatefulWidget {
  final String? selectedTuitionType;
  final void Function(String?)? onChanged;

  Tutiontype({this.selectedTuitionType, this.onChanged});

  @override
  _TutiontypeState createState() => _TutiontypeState();
}

class _TutiontypeState extends State<Tutiontype> {
  List<Map<String, dynamic>> tuitionTypes = [];

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
        Uri.parse('https://api.softpark.xyz/api/tuition-types'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          tuitionTypes = List<Map<String, dynamic>>.from(json.decode(response.body));
        });
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      print('Error fetching tuition types: $error');
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
        labelText: 'TutorType',
      ),
      value: widget.selectedTuitionType,
      hint: Text('Select Tuition Type'),
      items: tuitionTypes.map<DropdownMenuItem<String>>((tuitionType) {
        return DropdownMenuItem<String>(
          value: tuitionType['id'].toString(), // Assign ID, not name
          child: Text(tuitionType['name']),


        );
      }).toList(),
      onChanged: (newValue) {
        setState(() {
          widget.onChanged?.call(newValue);
          print("select tution types: "+newValue!);
        });
      },
    );
  }
}