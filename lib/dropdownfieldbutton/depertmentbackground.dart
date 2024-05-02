import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DepertmantbackgroundMultiSelect extends StatefulWidget {
  final List<dynamic> selectedDepartments; // Added parameter
  final Function(List<dynamic>) onSelectionChanged; // Added parameter

  DepertmantbackgroundMultiSelect({
    required this.selectedDepartments,
    required this.onSelectionChanged,
  });

  @override
  _DepertmantbackgroundMultiSelectState createState() =>
      _DepertmantbackgroundMultiSelectState();
}

class _DepertmantbackgroundMultiSelectState
    extends State<DepertmantbackgroundMultiSelect> {
  List<dynamic> _educationbackground = [];

  @override
  void initState() {
    super.initState();
    _fetchEducationBackground();
  }

  Future<void> _fetchEducationBackground() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');
    final url = 'https://api.softpark.xyz/api/tutor/education-background';
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          _educationbackground = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load education backgrounds');
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
          items: _educationbackground
              .map((background) =>
              MultiSelectItem<dynamic>(background, background['name']))
              .toList(),
          initialValue: widget.selectedDepartments, // Use widget.selectedDepartments
          onConfirm: (List<dynamic> results) {
            setState(() {
              widget.onSelectionChanged(results); // Call callback function
            });
          },
          title: Text('Department Background'),
          buttonText: Text('Department Background'),
          chipDisplay: MultiSelectChipDisplay(
            onTap: (value) {
              setState(() {
                widget.selectedDepartments.remove(value);
                widget.onSelectionChanged(widget.selectedDepartments); // Call callback function
              });
            },
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Selected Department Backgrounds: ${widget.selectedDepartments.map((item) => item['name']).join(', ')}',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
