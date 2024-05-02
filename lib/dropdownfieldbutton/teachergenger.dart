import 'package:flutter/material.dart';

class TeacherGenderDropdown extends StatefulWidget {
  final ValueChanged<String?>? onChanged; // Added named parameter

  const TeacherGenderDropdown({Key? key, this.onChanged}) : super(key: key);

  @override
  State<TeacherGenderDropdown> createState() => _TeacherGenderDropdownState();
}

class _TeacherGenderDropdownState extends State<TeacherGenderDropdown> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedItem,
      onChanged: (String? newValue) {
        setState(() {
          _selectedItem = newValue;
        });
        // Invoke onChanged callback if provided
        if (widget.onChanged != null) {
          widget.onChanged!(newValue);
        }
      },
      items: <String>['Male', 'Female', 'Other']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
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
        hintText: 'Tutor Gender Preference',
      ),
    );
  }
}
