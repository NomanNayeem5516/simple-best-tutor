import 'package:flutter/material.dart';

class StudentGenderDropdown extends StatefulWidget {
  final ValueChanged<String?>? onChanged; // Added named parameter

  const StudentGenderDropdown({Key? key, this.onChanged}) : super(key: key);

  @override
  State<StudentGenderDropdown> createState() => _StudentGenderDropdownState();
}

class _StudentGenderDropdownState extends State<StudentGenderDropdown> {
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
      items: <String>['Male', 'Female']
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
        hintText: 'Student Gender',
      ),
    );
  }
}
