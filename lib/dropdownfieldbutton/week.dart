import 'package:flutter/material.dart';

class Daysperweek extends StatefulWidget {
  final ValueChanged<String?>? onChanged; // Define named parameter onChanged

  const Daysperweek({Key? key, this.onChanged}) : super(key: key);

  @override
  State<Daysperweek> createState() => _DaysperweekState();
}

class _DaysperweekState extends State<Daysperweek> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedItem,
      onChanged: (String? newValue) {
        setState(() {
          _selectedItem = newValue;
        });
        // Call onChanged callback if provided
        if (widget.onChanged != null) {
          widget.onChanged!(newValue);
        }
      },
      items: <String>[
        '1 Days/Week',
        '2 Days/Week',
        '3 Days/Week',
        '4 Days/Week',
        '5 Days/Week',
        '6 Days/Week',
        '7 Days/Week'
      ].map<DropdownMenuItem<String>>((String value) {
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
          borderRadius: BorderRadius.circular((21)),
          borderSide: BorderSide(color: Colors.amber),
        ),
        hintText: 'Days/Week',
      ),
    );
  }
}
