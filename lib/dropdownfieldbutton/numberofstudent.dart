import 'package:flutter/material.dart';
class Numberofstudent extends StatefulWidget {
  const Numberofstudent({super.key});

  @override
  State<Numberofstudent> createState() => _NumberofstudentState();
}

class _NumberofstudentState extends State<Numberofstudent> {
  String? _selectedItem;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedItem,
      onChanged: (String? newValue) {
        setState(() {
          _selectedItem = newValue;
        });
      },
      items: <String>['1', '2', '3', '4','5','6','7','8','9','10']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(21),
          borderSide:
          BorderSide(color: Colors.deepOrange, width: 2),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(21),
          borderSide: BorderSide(color: Colors.indigoAccent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular((21)),
          borderSide: BorderSide(color: Colors.amber),
        ),
        hintText: 'Number of Students',
      ),
    );
  }
}
