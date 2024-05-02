import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryMultiSelectDropdown extends StatefulWidget {
  final List<dynamic> selectedCategories; // Added parameter
  final Function(List<dynamic>) onSelectionChanged; // Added parameter

  CategoryMultiSelectDropdown({
    required this.selectedCategories,
    required this.onSelectionChanged,
  });

  @override
  _CategoryMultiSelectDropdownState createState() =>
      _CategoryMultiSelectDropdownState();
}

class _CategoryMultiSelectDropdownState
    extends State<CategoryMultiSelectDropdown> {
  List<dynamic> _categories = [];

  @override
  void initState() {
    super.initState();
    _fetchCategories();
  }

  Future<void> _fetchCategories() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('access_token');
    final url = 'https://api.softpark.xyz/api/category';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      if (response.statusCode == 200) {
        setState(() {
          _categories = json.decode(response.body);
        });
      } else {
        throw Exception('Failed to load categories');
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
          items: _categories
              .map((category) =>
              MultiSelectItem<dynamic>(category, category['name']))
              .toList(),
          initialValue: widget.selectedCategories, // Use widget.selectedCategories
          onConfirm: (List<dynamic> results) {
            setState(() {
              widget.onSelectionChanged(results); // Call callback function
            });
          },
          title: Text('Select Categories'),
          buttonText: Text('Select Categories'),
          chipDisplay: MultiSelectChipDisplay(
            onTap: (value) {
              setState(() {
                widget.selectedCategories.remove(value);
                widget.onSelectionChanged(
                    widget.selectedCategories); // Call callback function
              });
            },
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Selected Categories: ${widget.selectedCategories.map((item) => item['name']).join(', ')}',
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
