import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../model/tutordashboard/tutordashboard.dart';


class TutorDashboard extends StatefulWidget {
  const TutorDashboard({Key? key}) : super(key: key);

  @override
  _TutorDashboardState createState() => _TutorDashboardState();
}

class _TutorDashboardState extends State<TutorDashboard> {
  late Future<tutordashboardModel> _futureData;

  @override
  void initState() {
    super.initState();
    _futureData = fetchData();
  }

  Future<tutordashboardModel> fetchData() async {
    final response = await http.get(Uri.parse('https://api.besttutor.xyz/api/tutor/dashboard'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return tutordashboardModel.fromJson(jsonData);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tutor Dashboard"),
      ),
      body: FutureBuilder<tutordashboardModel>(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final data = snapshot.data!;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ID: ${data.id}'),
                  Text('Name: ${data.name}'),
                  Text('Email: ${data.email}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
