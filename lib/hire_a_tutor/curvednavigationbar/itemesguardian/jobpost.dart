import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../dropdownfieldbutton/area.dart';
import '../../../dropdownfieldbutton/category.dart';
import '../../../dropdownfieldbutton/class_course.dart';
import '../../../dropdownfieldbutton/country.dart';
import '../../../dropdownfieldbutton/depertmentbackground.dart';
import '../../../dropdownfieldbutton/district.dart';
import '../../../dropdownfieldbutton/division.dart';
import '../../../dropdownfieldbutton/hairaboutus.dart';
import '../../../dropdownfieldbutton/institutename.dart';
import '../../../dropdownfieldbutton/numberofstudent.dart';
import '../../../dropdownfieldbutton/preferablesubject.dart';
import '../../../dropdownfieldbutton/studentgender.dart';
import '../../../dropdownfieldbutton/teachergenger.dart';
import '../../../dropdownfieldbutton/tutortype.dart';
import '../../../dropdownfieldbutton/week.dart';

class Jobpost extends StatefulWidget {
  const Jobpost({Key? key}) : super(key: key);

  @override
  State<Jobpost> createState() => _JobpostState();
}

class _JobpostState extends State<Jobpost> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController addressController = TextEditingController();
  TextEditingController requirmentController = TextEditingController();
  TextEditingController saleryyController = TextEditingController();
  TextEditingController numberofstudentController = TextEditingController();
  TextEditingController daysweekController = TextEditingController();

  String? selectedTuitionType;
  String? selectedCountry;
  String? selectedDivision;
  String? selectedDistrict;
  String? selectedArea;
  String? selectedDaysPerWeek;
  String? selectedstudentgender;
  String? selectedTeachergender;
  String? selectedhairaboutus;

  List<dynamic> _selectedInstitutes = [];
  List<dynamic> _selectedBackgrounds = [];
  List<dynamic> _selectedCategories = [];
  List<dynamic> _selectedClassandCourse = [];
  List<dynamic> _selectedPrefarableSubject = [];

  DateTime? _selectedDate; // Variable to hold selected date
  TimeOfDay? _selectedTime; // Variable to hold selected time

  Future<void> submitJobPost() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('access_token');

      // Ensure token is not null
      if (token == null) {
        throw Exception('Access token not found');
      }

      // Extract text values from controllers
      String address = addressController.text;
      String requirement = requirmentController.text;
      String salary = saleryyController.text;
      String numberOfStudents = numberofstudentController.text;
      String daysweek = daysweekController.text;

      // Format selected date
      String? formattedTuitionTime;
      if (_selectedDate != null) {
        formattedTuitionTime = DateFormat('yyyy-MM-dd').format(_selectedDate!);
      }

      // Format selected time
      String? formattedHireDate;
      if (_selectedTime != null) {
        formattedHireDate = _selectedTime!.format(context);
      }

      // Construct the request body
      final Map<String, dynamic> requestBody = {



        'tuition_type_id': selectedTuitionType.toString(),
        'country_id': selectedCountry.toString(),
        'division_id': selectedDivision.toString(),
        'district_id': selectedDistrict.toString(),
        'area_id': selectedArea.toString(),
        'category_id': _selectedCategories.map((item) => item['id']).join(','),
        'class_or_course_id':
        _selectedClassandCourse.map((item) => item['id']).join(','),
        "hire_date": formattedTuitionTime.toString(),
        'subject_ids':
        _selectedPrefarableSubject.map((item) => item['id']).join(','),
        'salary': salary.toString(),
        "number_of_student": numberOfStudents.toString(),
        "student_gender": selectedstudentgender.toString(),
        'hear_about_us_id': selectedhairaboutus.toString(),
        "tutor_gender": selectedTeachergender.toString(),



         'address_details': address.toString(),
         'more_requirement': requirement.toString(),
          "days_of_week": daysweek.toString(),
          "tuition_time": formattedHireDate.toString(),
         'education_background_id':
              _selectedBackgrounds.map((item) => item['id']).join(','),
          'institute_name':
              _selectedInstitutes.map((item) => item['name']).join(','),

        // Add other fields as needed
      };

      print("checking- $requestBody");

      // Make POST request to the API endpoint
      final response = await http.post(
        Uri.parse('https://api.softpark.xyz/api/guardian/job'),
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
        body: json.encode(requestBody),
      );

      // Check response status code
      if (response.statusCode == 200) {
        // Job post created successfully
        print('Job post created successfully');
        // You can navigate to a success screen or show a success message here
      } else {
        // Failed to create job post
        print('Failed to create job post');
        print('Response status code: ${response.statusCode}');
        print('Response body: ${response.body}');
        // Handle the error as per your application's requirements
      }
    } catch (error) {
      print('Error creating job post: $error');
      // Handle the error as per your application's requirements
    }
  }

  // Function to show Date Picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  // Function to show Time Picker
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime)
      setState(() {
        _selectedTime = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Post'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Tutiontype(
                  selectedTuitionType: selectedTuitionType,
                  onChanged: (newValue) {
                    setState(() {
                      selectedTuitionType = newValue;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                MultiSelectDropdownExample(
                  selectedInstitutes: _selectedInstitutes,
                  onSelectionChanged: (newValue) {
                    setState(() {
                      _selectedInstitutes = newValue;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                DepertmantbackgroundMultiSelect(
                  selectedDepartments: _selectedBackgrounds,
                  onSelectionChanged: (newValue) {
                    setState(() {
                      _selectedBackgrounds = newValue;
                    });
                  },
                ),
                SizedBox(height: 10),
                ClassCourse(
                  selectedCourses: _selectedClassandCourse,
                  onSelectionChanged: (newValue) {
                    setState(() {
                      _selectedClassandCourse = newValue;
                    });
                  },
                ),
                SizedBox(height: 10),
                Prefareblesubject(
                  selectedSubjects: _selectedPrefarableSubject,
                  onSelectionChanged: (newValue) {
                    setState(() {
                      _selectedPrefarableSubject = newValue;
                    });
                  },
                ),
                CategoryMultiSelectDropdown(
                  selectedCategories: _selectedCategories,
                  onSelectionChanged: (newValue) {
                    setState(() {
                      _selectedCategories = newValue;
                    });
                  },
                ),
                SizedBox(height: 10),
                CountryDropdown(
                  selectedCountry: selectedCountry,

                  onChanged: (newValue) {

                    setState(() {
                      selectedCountry = newValue; // Update selected country
                    });
                  },
                ),

                SizedBox(
                  height: 10,
                ),
                Division(
                  selectedDivision: selectedDivision,
                  onChanged: (newValue) {
                    setState(() {
                      selectedDivision = newValue;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                District(
                  selectedDistrict: selectedDistrict,
                  onChanged: (newValue) {
                    setState(() {
                      selectedDistrict = newValue;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Area(
                  selectedArea: selectedArea,
                  onChanged: (newValue) {
                    setState(() {
                      selectedArea = newValue;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),

                TextFormField(
                  controller: daysweekController,
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
                      borderRadius: BorderRadius.circular((21)),
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    labelText: 'Days/week',
                    hintText: 'Days/week',
                  ),
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter days';
                    }
                    return null;
                  },
                ),
                // Daysperweek(
                //   onChanged: (newValue) {
                //     setState(() {
                //       selectedDaysPerWeek = newValue;
                //     });
                //   },
                // ),
                SizedBox(
                  height: 10,
                ),

                TextFormField(
                  controller: addressController,
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
                      borderRadius: BorderRadius.circular((21)),
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    labelText: 'Address',
                    hintText: 'Enter your address',
                  ),
                  keyboardType: TextInputType.streetAddress,
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                StudentGenderDropdown(
                  onChanged: (newValue) {
                    setState(() {
                      selectedstudentgender = newValue;
                    });
                  },
                ),
                TeacherGenderDropdown(
                  onChanged: (newValue) {
                    setState(() {
                      selectedTeachergender = newValue;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: requirmentController,
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
                      borderRadius: BorderRadius.circular((21)),
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    labelText: 'More about your requirement',
                    hintText: 'More about your requirement',
                  ),
                  keyboardType: TextInputType.streetAddress,
                  maxLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter more about your requirement';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                // Button to select Date
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text(_selectedDate != null
                      ? 'Selected Date: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}'
                      : 'Select Date'),
                ),
                SizedBox(
                  height: 10,
                ),
                // Button to select Time
                ElevatedButton(
                  onPressed: () => _selectTime(context),
                  child: Text(_selectedTime != null
                      ? 'Selected Time: ${_selectedTime!.format(context)}'
                      : 'Select Time'),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: numberofstudentController,
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
                      borderRadius: BorderRadius.circular((21)),
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    labelText: 'Number of student',
                    hintText: 'Number of student',
                  ),
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter salary';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: saleryyController,
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
                      borderRadius: BorderRadius.circular((21)),
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    labelText: 'Salary',
                    hintText: 'Salary',
                  ),
                  keyboardType: TextInputType.number,
                  maxLines: 1,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter salary';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                HearAboutUsDropdown(
                  selectedOption: selectedhairaboutus,
                  onChanged: (newValue) {
                    setState(() {
                      selectedhairaboutus = newValue;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Form is valid, proceed with submission
                      submitJobPost(); // Call the function to submit job post
                    }
                  },
                  child: Text('Submit'),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
