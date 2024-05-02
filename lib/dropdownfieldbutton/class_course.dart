import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ClassCourse extends StatefulWidget {
  final List<dynamic> selectedCourses; // Added parameter
  final Function(List<dynamic>) onSelectionChanged; // Added parameter

  ClassCourse({
    required this.selectedCourses,
    required this.onSelectionChanged,
  });

  @override
  _ClassCourseState createState() => _ClassCourseState();
}

class _ClassCourseState extends State<ClassCourse> {
  List<dynamic> _classCourses = [];

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');
    final url = 'https://api.softpark.xyz/api/multiClassesSubjects?classes_id=1,3';

    try {
      final response = await http.get(Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          _classCourses = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load class courses');
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
          items: _classCourses
              .map((course) => MultiSelectItem<dynamic>(course, course['name']))
              .toList(),
          initialValue: widget.selectedCourses, // Use widget.selectedCourses
          onConfirm: (List<dynamic> results) {
            setState(() {
              widget.onSelectionChanged(results); // Call callback function
            });
          },
          title: Text('Select Class Courses'),
          buttonText: Text('Select Class Courses'),
          chipDisplay: MultiSelectChipDisplay(
            onTap: (value) {
              setState(() {
                widget.selectedCourses.remove(value);
                widget.onSelectionChanged(widget.selectedCourses); // Call callback function
              });
            },
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Selected Class Courses: ${widget.selectedCourses.map((item) => item['name']).join(', ')}',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
