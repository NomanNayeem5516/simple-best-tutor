import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../model/jobModels/myjoblistmodel.dart';

// Define your model classes here...

class Jobpost2 extends StatefulWidget {
  const Jobpost2({Key? key});

  @override
  State<Jobpost2> createState() => _Jobpost2State();
}

class _Jobpost2State extends State<Jobpost2> {
  List<Jobs>? jobs = []; // List to store fetched jobs

  @override
  void initState() {
    super.initState();
    fetchData(); // Fetch data when the widget is initialized
  }

  Future<void> fetchData() async {
    final response =
    await http.get(Uri.parse('https://api.besttutor.xyz/api/all-job?myJobs=myJobs'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      setState(() {
        jobs = List<Jobs>.from(jsonData['jobs'].map((x) => Jobs.fromJson(x)));
      });
    } else {
      throw Exception('Failed to load jobs');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Job List'),
      ),
      body: Column(
        children: [
          if (jobs != null && jobs!.isNotEmpty) // Check if jobs are fetched
            Expanded(
              child: ListView.builder(
                itemCount: jobs!.length,
                itemBuilder: (context, index) {
                  final job = jobs![index];
                  return ListTile(
                    title: Text(job.instituteName ?? ''),
                    subtitle: Text(job.hireDate ?? ''),
                    // Add more fields as needed
                  );
                },
              ),
            ),
          if (jobs == null || jobs!.isEmpty) // Display loading or empty state
            Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}

