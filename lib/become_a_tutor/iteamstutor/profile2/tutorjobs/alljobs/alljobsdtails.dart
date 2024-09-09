import 'dart:convert';

import 'package:finalbesttutor/services/apiservices.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../model/tutordashboard/alljobmodel.dart';
import 'package:http/http.dart' as http;

import '../../../../../routes/routesname.dart';

class AlljobsDtails extends StatefulWidget {
  const AlljobsDtails({super.key});

  @override
  State<AlljobsDtails> createState() => _AlljobsDtailsState();
}

class _AlljobsDtailsState extends State<AlljobsDtails> {
  Future<AlljobModel> getalljob() async {
    final response =
    await http.get(Uri.parse('https://api.besttutor.xyz/api/all-job'));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return AlljobModel.fromJson(data);
    } else {
      return AlljobModel.fromJson(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<AlljobModel>(
        future: getalljob(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child:
              CircularProgressIndicator(), // Show loading indicator while fetching data
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                  'Error: ${snapshot.error}'), // Show error if fetching data fails
            );
          } else if (snapshot.hasData) {
            // Display the list of jobs using ListView.builder
            return ListView.builder(
              itemCount: snapshot.data!.jobs!.length,
              itemBuilder: (context, index) {
                var job = snapshot.data!.jobs![index];
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    key: Key(job.id.toString()), // Add key with job ID
                    title: Text(
                      'Need ${job.categoryNames?.join(', ') ?? ''}Tutor For ${job.classOrCourseNames?.join(', ') ?? ''}- ${job.daysOfWeek ?? ''}Days/Week',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      children: [
                        Text(
                            'Job ID: ${job.id ?? ''} Created At: ${job.createdAt ?? ''}'),
                        Row(
                          children: [
                            Icon(Icons.book),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Tuition Type',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Tuition Type: ${job.tuitionType?.name ?? ''}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.monetization_on),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Salary',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  'Salary: ${job.salary ?? ''}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.subject),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Subject',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  ' ${job.classOrCourseNames?.join(', ') ?? ''}}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on_rounded),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Location',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  ' Area: ${job.area?.name ?? ''}, District: ${job.district?.name ?? ''}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.location_on_rounded),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Special Requirement',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  width: 300,
                                  child: Text(
                                    ' ${job.moreRequirement ?? ''}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              job.studentGender == 'male'
                                  ? Icons.male
                                  : job.studentGender == 'female'
                                  ? Icons.female
                                  : Icons.person,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Student Gender: ${job.studentGender ?? "Not specified"}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              job.tutorGender == 'male'
                                  ? Icons.male
                                  : job.tutorGender == 'female'
                                  ? Icons.female
                                  : Icons.person,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Tutor Gender: ${job.tutorGender ?? "Not specified"}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            ElevatedButton(onPressed: (){
                              Get.toNamed(RouteName.alljobdtails);

                            }, child: Text('Details')),
                            SizedBox(width: 20,),
                            ElevatedButton(onPressed: (){

                            }, child: Text('Location'))
                          ],
                        )

                      ],
                    ),
                    // Add more fields as per your requirement
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text('No Data Available'), // Show if no data is available
            );
          }
        },
      ),
    );
  }
}
