

import 'package:flutter/material.dart';



class TutorRequestForm extends StatefulWidget {
  @override
  _TutorRequestFormState createState() => _TutorRequestFormState();
}

class _TutorRequestFormState extends State<TutorRequestForm> {
  String? _selectedTuitionType;
  String? _selectedInstitute;
  String? _selectedCountry;
  String? _selectedDivision;
  String? _selectedDistrict;
  String? _selectedArea;
  String? _selectedNumberOfStudents;
  String? _selectedCategory;
  String? _selectedClassCourse;
  DateTime _selectedHireDate = DateTime.now();
  String? _selectedSubject;
  String? _selectedSalary;
  String? _selectedStudentGender;
  String? _selectedHearAbout;
  String _moreRequirement = '';
  String _addressDetails = '';

  final List<String> _tuitionTypes = ['One-on-One', 'Group'];
  final List<String> _instituteNames = ['Institute A', 'Institute B', 'Institute C'];
  final List<String> _countries = ['Country A', 'Country B', 'Country C'];
  final List<String> _divisions = ['Division A', 'Division B', 'Division C'];
  final List<String> _districts = ['District A', 'District B', 'District C'];
  final List<String> _areas = ['Area A', 'Area B', 'Area C'];
  final List<String> _numberOfStudents = ['1', '2', '3+'];
  final List<String> _categories = ['Category A', 'Category B', 'Category C'];
  final List<String> _classCourses = ['Class A', 'Class B', 'Class C'];
  final List<String> _subjects = ['Subject A', 'Subject B', 'Subject C'];
  final List<String> _salaries = ['Salary A', 'Salary B', 'Salary C'];
  final List<String> _studentGenders = ['Male', 'Female', 'Any'];
  final List<String> _hearAboutOptions = ['Option A', 'Option B', 'Option C'];

  Future<void> _selectHireDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedHireDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedHireDate)
      setState(() {
        _selectedHireDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tutor Request Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              value: _selectedTuitionType,
              onChanged: (newValue) {
                setState(() {
                  _selectedTuitionType = newValue;
                });
              },
              items: _tuitionTypes.map((type) {
                return DropdownMenuItem<String>(
                  value: type,
                  child: Text(type),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Tuition Type'),
            ),
            SizedBox(height: 16.0),
            // Add DropdownButtonFormField widgets for other fields similarly
            ElevatedButton(
              onPressed: () {
                // Submit logic goes here
                print('Submitting form...');
                print('Tuition Type: $_selectedTuitionType');
                // Print other selected values
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
