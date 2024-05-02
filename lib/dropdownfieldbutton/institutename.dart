import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class MultiSelectDropdownExample extends StatefulWidget {
  final List<dynamic> selectedInstitutes; // Added parameter
  final Function(List<dynamic>) onSelectionChanged; // Added parameter

  MultiSelectDropdownExample({
    required this.selectedInstitutes,
    required this.onSelectionChanged,
  });

  @override
  _MultiSelectDropdownExampleState createState() =>
      _MultiSelectDropdownExampleState();
}

class _MultiSelectDropdownExampleState
    extends State<MultiSelectDropdownExample> {
  List<dynamic> _institutes = [];

  @override
  void initState() {
    super.initState();
    _fetchInstitutes();
  }

  Future<void> _fetchInstitutes() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');
    final url = 'https://api.softpark.xyz/api/institute';

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Bearer $token',
      });
      if (response.statusCode == 200) {
        setState(() {
          _institutes = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load institutes');
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
          items: _institutes
              .map((institute) =>
              MultiSelectItem<dynamic>(institute, institute['name']))
              .toList(),
          initialValue: widget.selectedInstitutes, // Use widget.selectedInstitutes
          onConfirm: (List<dynamic> results) {
            setState(() {
              widget.onSelectionChanged(results); // Call callback function
            });
          },
          title: Text('Select Institutes'),
          buttonText: Text('Select Institutes'),
          chipDisplay: MultiSelectChipDisplay(
            onTap: (value) {
              setState(() {
                widget.selectedInstitutes.remove(value);
                widget.onSelectionChanged(widget.selectedInstitutes); // Call callback function
              });
            },
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Selected Institutes: ${widget.selectedInstitutes.map((item) => item['name']).join(', ')}',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
