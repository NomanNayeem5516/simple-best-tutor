import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefareblesubject extends StatefulWidget {
  final List<dynamic> selectedSubjects; // Added parameter
  final Function(List<dynamic>) onSelectionChanged; // Added parameter

  Prefareblesubject({
    required this.selectedSubjects,
    required this.onSelectionChanged,
  });

  @override
  _PrefareblesubjectState createState() => _PrefareblesubjectState();
}

class _PrefareblesubjectState extends State<Prefareblesubject> {
  List<dynamic> _subjects = [];

  @override
  void initState() {
    super.initState();
    _fetchSubjects();
  }

  Future<void> _fetchSubjects() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');
    final url = 'https://api.softpark.xyz/api/multiClassesSubjects?classes_id=1';

    try {
      final response = await http.get(Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          _subjects = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load subjects');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MultiSelectDialogField(
          items: _subjects
              .map((subject) => MultiSelectItem<dynamic>(subject, subject['name']))
              .toList(),
          initialValue: widget.selectedSubjects, // Use widget.selectedSubjects
          onConfirm: (List<dynamic> results) {
            setState(() {
              widget.onSelectionChanged(results); // Call callback function
            });
          },
          title: Text('Select Preferable Subjects'),
          buttonText: Text('Select Preferable Subjects'),
          chipDisplay: MultiSelectChipDisplay(
            onTap: (value) {
              setState(() {
                widget.selectedSubjects.remove(value);
                widget.onSelectionChanged(widget.selectedSubjects); // Call callback function
              });
            },
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Selected Subjects: ${widget.selectedSubjects.map((item) => item['name']).join(', ')}',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
